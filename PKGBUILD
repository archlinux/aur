# Maintainer: David Runge <dvzrv@archlinux.org>

_name=mutagen
pkgname=python2-mutagen
pkgver=1.43.0
pkgrel=3
arch=('any')
pkgdesc="An audio metadata tag reader and writer (python2 library)"
url="https://github.com/quodlibet/mutagen"
license=('GPL2')
depends=('python2-setuptools')
source=("https://github.com/quodlibet/${_name}/releases/download/release-$pkgver/${_name}-$pkgver.tar.gz"{,.sig})
sha512sums=('66df63705a43befa9cf6688bc8b3acc4fd1559eb28920c105b47a97c35422b5e19527051445daa7aed66facc2e4c14d71058f8560bbd564fecbe56a076491e3f'
            'SKIP')
validpgpkeys=('0EBF782C5D53F7E5FB02A66746BD761F7A49B0EC') # Christoph Reiter <reiter.christoph@gmail.com>

prepare() {
  mv -v "${_name}-${pkgver}" "${pkgname}-${pkgver}"
  cd "${pkgname}-$pkgver"
  for script in {mid3{cp,iconv,v2},moggsplit,mutagen-{inspect,pony}}; do
    sed -e "s/${script}/${script}2/g" -i setup.py
    mv -v "man/${script}"{,2}.1
  done
}

build() {
  cd "${pkgbase}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py install --skip-build \
                           --optimize=1 \
                           --prefix=/usr \
                           --root="${pkgdir}"
  install -vDm 644 {NEWS,README.rst} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
