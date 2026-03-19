# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-lameenc
_gitpkgname=lameenc
pkgver=1.8.2
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

sha512sums=('99a76548c7078ca26831d825f153329464f6e7e8d52dc49ce386a6a7b78a63073515c16e8386bda17794b4b90f0de19a285af1f579d9c873b2232104a93b125d'
            'd9b262a333afe1a00415a4b76257b9d966a08ce618b5dd5daade9cdfef03d986343ecfbdf0e21d218f9f10b1bae52fb6af2697ee6ee338b4c599127f4e8b62a2')

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
  if ! grep -qF 'LAME3.' actual.txt; then
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
