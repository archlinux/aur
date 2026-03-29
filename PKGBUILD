# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=hexora
pkgver=0.2.4
pkgrel=1
pkgdesc='Statically analyze potentially malicious Python code'
arch=('x86_64')
url='https://github.com/rushter/hexora'
license=('MIT')
depends=('glibc' 'libgcc' 'python')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools-rust'
)
checkdepends=('jq')
options=('!lto')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/rushter/hexora/archive/v${pkgver}.tar.gz"
)

sha512sums=('687a7b86fe67c730fa4b5dac73ae7382aa667b27137b3fa89ba1cf64a646ed53f0c8784b0d82101b73dfab186833a37e07d437f0cbf7a105a9071625e263f872')

prepare() {
  cd "${pkgname}-${pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  # Bump the versions of the workspace crates in the lock file
  # (upstream’s release CI workflow does not do it)
  cargo update --workspace
  cargo fetch --locked --target host-tuple
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  echo >&2 'Building wheel'
  python -m build --wheel --no-isolation
}

check() {
  cd "${pkgname}-${pkgver}"

  echo >&2 'Installing wheel into a temporary environment'
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl

  echo >&2 'Testing the executable'
  echo > test.py 'builtins = __import__("builtins")'
  echo >> test.py 'builtins.print("Arch Linux")'
  test-env/bin/hexora audit test.py --output-format json > actual.txt
  if [[ "$(jq -r .rule actual.txt)" != 'HX5000' ]]; then
    printf >&2 '%s\n' 'Unexpected test output:' '==='
    cat >&2 actual.txt
    printf >&2 '\n%s\n' '==='
    exit 1
  fi

  echo >&2 'Running unit tests'
  cargo test --frozen --workspace --all-features
}

package() {
  cd "${pkgname}-${pkgver}"

  echo >&2 'Packaging the wheel'
  python -I -m installer --destdir="${pkgdir}" dist/*.whl

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    README.md
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}/docs" \
    docs/example.gif docs/examples.md

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE
}
