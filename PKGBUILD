# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-aardwolf
_pkgname=aardwolf
pkgver=0.2.11
pkgrel=1
pkgdesc="Asynchronous RDP/VNC client in Python (headless)"
url="https://github.com/skelsec/aardwolf"
arch=('any')
license=('MIT')
depends=( 'python>=3.7' 'python-unicrypto>=0.0.10' 'python-asyauth>=0.0.13'
	  'python-asysocks' 'python-tqdm' 'python-colorama' 'python-asn1crypto'
	  'python-asn1tools' 'python-bitstruct' 'python-pyperclip>=1.8.2'
	  'python-arc4>=0.3.0' 'python-pillow>=9.0.0' )
optdepends=('python-pyqt5')
makedepends=( 'cython' 'python-build' 'python-installer' 'python-wheel'
	      'python-setuptools>=62.4' 'python-setuptools-rust>=1.5.2' 'rust')
#source=("https://github.com/skelsec/aardwolf/archive/refs/tags/${pkgver}.tar.gz")
source=("https://files.pythonhosted.org/packages/98/bf/ca13fae2516b0ce274d7359b0439911086fd8a46afc87e6b7a5814cb6d2e/aardwolf-${pkgver}.tar.gz")
sha256sums=('46dc892703f133961b782fd2971124803cba7409ea5dad5b4ebb7653b16dcdf3')

build() {
  cd "${_pkgname}-${pkgver}"
  export CARGO_HOME="${srcdir}/cargo"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  export CARGO_HOME="${srcdir}/cargo"
  python -m installer --destdir="$pkgdir" --compile-bytecode=2 dist/*.whl

  _docfiles=(
    README.md
  )
  _docdirs=()
  _manfiles=()
  _infofiles=()
  _licensefiles=(
    LICENSE
  )
  for _docfile in "${_docfiles[@]}"; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_docfile}")"
  done
  for _docdir in "${_docdirs[@]}"; do
    cp -rv "${_docdir}" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_docdir}")"
  done
  for _manfile in "${_manfiles[@]}"; do
    _section="$(basename "${_manfile}" .gz | sed -E -e 's|^.*\.([^.]*)$|\1|')"
    install -D -v -m644 "docs/build/man/${_manfile}" "${pkgdir}/usr/share/man/man${_section}/$(basename "${_manfile}")"
  done
  for _infofile in "${_infofiles[@]}"; do
    install -D -v -m644 "${_infofile}" "${pkgdir}/usr/share/info/$(basename "${_infofile}")"
  done
  for _licensefile in "${_licensefiles[@]}"; do
    install -D -v -m644 "${_licensefile}" "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")"
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_licensefile}")"
  done
}
