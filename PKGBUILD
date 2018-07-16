pkgname="disappeer-git"
_projname="disappeer"
pkgver=r20.8152243
pkgrel=1
pkgdesc='A pure Python GUI app for GPG key management and peer-to-peer encrypted messaging over Tor'
license=('GPL')
arch=('any')
url='https://github.com/disappeerlabs/disappeer'
makedepends=('python' 'python-distribute')
depends=('gnupg' 'python' 'python-gnupg' 'python-stem' 'python-pysocks' 'tk')
source=(
  'git+https://github.com/disappeerlabs/disappeer'
  '10-images_dir_path.patch')
md5sums=('SKIP' '40567ee80b6b1c4b237ff31d9cac2d28')

pkgver() {
  cd "${srcdir}/${_projname}"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git describe --always)"
}

build() {
  cd "${srcdir}/${_projname}"
  patch -p1 -i "${srcdir}/10-images_dir_path.patch"
  python setup.py build
}

package() {
  cd "${srcdir}/${_projname}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -dm755 "${pkgdir}/usr/share/${_projname}/images/"
  for img in `ls ${srcdir}/${_projname}/${_projname}/images/*.png ${srcdir}/${_projname}/${_projname}/images/*.gif`; do
    install -Dm644 "$img" "${pkgdir}/usr/share/${_projname}/images/"
  done
}
