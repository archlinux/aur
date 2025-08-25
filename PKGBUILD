# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

_name=hyperqueue
pkgbase=$_name-git
pkgname=($pkgbase python-$pkgbase)
pkgver=0.23.0.r69.g49bab80
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
)
b2sums=('SKIP')

pkgver() {
  cd $_name
  git describe --long --tags --abbrev=7 --exclude=nightly --exclude=-rc | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_name
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

  # run Python tests with the release binary
  sed -i 's|"target", directory, "hq"|"target", "release", "hq"|' tests/conftest.py
}

build() {
  # fix building with LTO
  CFLAGS+=' -ffat-lto-objects'

  cd $_name
  cargo build --frozen --release --all-features

  # build Python bindings
  cd crates/pyhq
  maturin build --locked --release --target "$(rustc -vV | sed -n 's/host: //p')" --strip
}

check() {
  cd $_name
  cargo test --frozen --release --all-features

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
  $_target generate-completion bash   | install -vDm 644 /dev/stdin "$pkgdir"/usr/share/bash-completion/completions/hq.bash
  $_target generate-completion elvish | install -vDm 644 /dev/stdin "$pkgdir"/usr/share/elvish/lib/hq.elv
  $_target generate-completion fish   | install -vDm 644 /dev/stdin "$pkgdir"/usr/share/fish/vendor_completions.d/hq.fish
  $_target generate-completion zsh    | install -vDm 644 /dev/stdin "$pkgdir"/usr/share/zsh/site-functions/_hq
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
  python -m installer --destdir "$pkgdir" target/wheels/*.whl
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
