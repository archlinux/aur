# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=hexora
pkgver=0.2.2
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
  'github-pr-4.patch'
)

sha512sums=(
  '320be329dc394f447b9ed1012f7317465e89fc57bb040e28e870205e57bca3ebdf04b375ca3dd932fb9db25a4d19f7aa81402c0d2160446a7e0ab6900f24bf49'
  'c801ce31c3e91f9fa3065b3fd1b3f4409f8d85f73cb905a59140913f8d3389494bf58c36f3c458865b980847dc88847e4b9ace056cce3121426fcec444608b09'
)

prepare() {
  cd "${pkgname}-${pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple

  # Remove this patch once the upstream author has cut a new stable
  # release.
  # See also: https://github.com/rushter/hexora/pull/4
  echo >&2 'Applying patch to fix unit test'
  patch -p1 < ../github-pr-4.patch
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
