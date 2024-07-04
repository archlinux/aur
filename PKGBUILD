# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-lameenc
_gitpkgname=lameenc
pkgver=1.7.0
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
  'python-wheel'
)

source=(
  "${_gitpkgname}-${pkgver}.tar.gz::https://github.com/chrisstaite/lameenc/archive/v${pkgver}.tar.gz"
  'use-system-lame.patch'
)

sha512sums=(
  '3c841bc141e2c38105d6ba0654f3084b19424aa38e5f983e504c8e341119c9e32d6c7e947876d93f4a580e98eb581f4d2db80a87d28b1b663d16fdb9dcc06c8b'
  'd021e5f848c7419a7affa31e81ffe00eb1c9157816e99cc1d628f0e6847a2bdeb75ff5d68db71f5d9de7c65374325deb9b9e5e4d08c2de2be0c0bdc004d9ef3a'
)

prepare() {
  cd "${_gitpkgname}-${pkgver}"
  echo >&2 'Configuring support for using system-provided LAME'
  patch -p1 < ../use-system-lame.patch
}

build() {
  cd "${_gitpkgname}-${pkgver}"
  echo >&2 'Building wheel'
  python -m build --wheel --no-isolation
}

check() {
  cd "${_gitpkgname}-${pkgver}"
  local _site_packages
  _site_packages="$(python -c 'import site; print(site.getsitepackages()[0])')"
  python -m installer --destdir=tmp_install dist/*.whl

  echo >&2 'Testing the extension'
  PYTHONPATH="${PWD}/tmp_install/${_site_packages}" python << 'EOF' > actual.txt
import lameenc
encoder = lameenc.Encoder()
encoder.encode('')
print(encoder.flush().decode(encoding='ascii', errors='replace'))
EOF
  if ! grep -qF 'LAME3.100' actual.txt; then
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
