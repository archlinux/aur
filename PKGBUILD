# Maintainer: Claudia Pellegrino <auerhuhn@archlinux.org>

pkgname=python-lameenc
_gitpkgname=lameenc
pkgver=1.8.4
pkgrel=1
pkgdesc='Python bindings for the LAME encoding library'
arch=('x86_64')
url='https://github.com/chrisstaite/lameenc'
license=('LGPL-3.0-only')
depends=('glibc' 'lame' 'python')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm'
  'python-wheel'
)

source=(
  "${_gitpkgname}-${pkgver}.tar.gz::https://github.com/chrisstaite/lameenc/archive/v${pkgver}.tar.gz"
  'use-system-lame.patch'
)

sha512sums=('355ffd1ecfa862afe28b0f8844e16e991bf4486e6dcbccbfed3d4b3685fefaf3de7131b0ef528db89641b49890e5eef6ca54843ae60252edfa69e987cbce647b'
            'e8d862117925dfe8cd36e58e670c3b49ce74a2d96f5fe51a35091ae8422a403b47ae27bbc13d874da43c5e88fca1776f524f0c54976f94dba72d0f5a5fafb7a0')

prepare() {
  cd "${_gitpkgname}-${pkgver}"
  echo >&2 'Configuring support for using system-provided LAME'
  patch -p1 < ../use-system-lame.patch
}

build() {
  cd "${_gitpkgname}-${pkgver}"
  echo >&2 'Building wheel'
  export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_gitpkgname}-${pkgver}"

  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl

  echo >&2 'Testing the extension'
  test-env/bin/python << 'EOF' > actual.txt
import lameenc
encoder = lameenc.Encoder()
encoder.encode('')
print(encoder.flush().decode(encoding='ascii', errors='replace'))
EOF
  if ! grep -q 'LAME[1-9]\.' actual.txt; then
    printf >&2 '%s\n' 'Unexpected test output:' '==='
    hexdump >&2 actual.txt
    printf >&2 '\n%s\n' '==='
    exit 1
  fi
}

package() {
  cd "${_gitpkgname}-${pkgver}"

  echo >&2 'Packaging the wheel'
  python -I -m installer --destdir="${pkgdir}" dist/*.whl

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    README.md

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE
}
