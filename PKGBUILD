# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

_name=hyperqueue
pkgbase=$_name-git
pkgname=($pkgbase python-$pkgbase)
pkgver=0.21.0.r19.g832f245
pkgrel=1
pkgdesc="Scheduler for sub-node tasks for HPC systems with batch scheduling"
arch=(x86_64)
url="https://github.com/It4innovations/hyperqueue/"
license=(MIT)
makedepends=(
  git
  cargo
  maturin
  python-installer
  python-cloudpickle
  python-tqdm
  python-pydot
)
checkdepends=(
  # some tests run `hostname` https://github.com/It4innovations/hyperqueue/issues/808#issuecomment-2629060187
  inetutils
  # https://github.com/It4innovations/hyperqueue/blob/main/tests/requirements.txt
  python-pytest
  python-pytest-xdist
  python-iso8601
  python-schema
  python-maturin
  python-psutil
  python-requests
  python-aiohttp
  python-inline-snapshot
  python-ruff
)
source=(
  git+$url
  fix-pyhq.patch
)
b2sums=('SKIP'
        'b7727d0237b6a78f8a5db0e1bea21903c5bca1285baf1348985e0c9c9a91bd1a116c63e27a9060c6b730f1fdc241a12a8df40b7f3e77332a7a8f3ab6e60e89cc')

pkgver() {
  cd $_name
  git describe --long --tags --abbrev=7 --exclude=nightly | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_name
  # patch for Python 3.13 compatibility https://github.com/It4innovations/hyperqueue/pull/811
  patch -Np1 < ../fix-pyhq.patch

  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

  # run Python tests with the release binary
  sed -i 's|"target", directory, "hq"|"target", "release", "hq"|' tests/conftest.py
}

build() {
  cd $_name
  # does not work with jemalloc https://github.com/It4innovations/hyperqueue/issues/808#issuecomment-2628930149
  cargo build --frozen --release --no-default-features --features dashboard

  # build Python bindings
  cd crates/pyhq
  maturin build --locked --release --target "$(rustc -vV | sed -n 's/host: //p')" --strip
}

check() {
  cd $_name
  # does not work with jemalloc https://github.com/It4innovations/hyperqueue/issues/808#issuecomment-2628930149
  cargo test --frozen --no-default-features --features dashboard

  # test Python bindings
  local pytest_options=(
    -vv
    -W ignore::DeprecationWarning
    -n16
  )
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer target/wheels/*.whl
  # the tests use Python subprocess module to start hq which needs the same env in order for
  # submitted tasks to work, so we must actually activate the venv
  (
    source test-env/bin/activate
    python -m pytest "${pytest_options[@]}" tests
  )
}

package_hyperqueue-git() {
  depends=(
    gcc-libs
    glibc
  )
  conflicts=(hyperqueue)
  provides=(hyperqueue)

  cd $_name
  local _target="target/release/hq"

  # install the binary and license
  install -vDm 755 "$_target" -t "$pkgdir"/usr/bin/
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/

  # generate shell completions
  $_target generate-completion bash   | install -vDm 644 /dev/stdin "$pkgdir"/usr/share/bash-completion/completions/$_name.bash
  $_target generate-completion elvish | install -vDm 644 /dev/stdin "$pkgdir"/usr/share/elvish/lib/$_name.elv
  $_target generate-completion fish   | install -vDm 644 /dev/stdin "$pkgdir"/usr/share/fish/vendor_completions.d/$_name.fish
  $_target generate-completion zsh    | install -vDm 644 /dev/stdin "$pkgdir"/usr/share/zsh/site-functions/_$_name
}

package_python-hyperqueue-git() {
  pkgdesc+=" - Python bindings"
  depends=(
    gcc-libs
    glibc
    hyperqueue
    # https://github.com/It4innovations/hyperqueue/blob/main/crates/pyhq/pyproject.toml
    python
    python-cloudpickle
    python-tqdm
  )
  optdepends=(
    'python-pydot: task graph visualization'
  )
  conflicts=(python-hyperqueue)
  provides=(python-hyperqueue)

  cd $_name
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
  python -m installer -d "$pkgdir" target/wheels/*.whl
}
