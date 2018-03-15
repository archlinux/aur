# Maintainer: David Runge <dave@sleepmap.de>

_name=khard
pkgname=khard-git
pkgver=0.12.2.r2.g3cd57db
pkgrel=1
pkgdesc="Console CardDAV client"
url="https://github.com/scheibler/khard/"
arch=('any')
license=('GPL3')
depends=('python-atomicwrites' 'python-configobj' 'python-ruamel-yaml' 'python-unidecode' 'python-vobject' 'python-yaml')
makedepends=('git' 'python-setuptools')
optdepends=('vdirsyncer: Synchronization of address books with a DAV server.')
provides=('khard')
conflicts=('khard')
source=("git+https://github.com/scheibler/khard.git")
install="${pkgname}.install"
sha512sums=('SKIP')

pkgver() {
  cd "${_name}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
  cd "${_name}"
  python setup.py build
}

package() {
  cd "${_name}"
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
  # additional wrapper script
  install -vDm 755 misc/sdiff/sdiff_khard_wrapper.sh \
    "${pkgdir}/usr/bin/sdiff_khard_wrapper.sh"
  # twinkle integration
  install -t "${pkgdir}/usr/share/${_name}/twinkle/scripts/" \
    -vDm 644 misc/twinkle/scripts/*.py
  install -t "${pkgdir}/usr/share/${_name}/twinkle/sounds/" \
    -vDm 644 misc/twinkle/sounds/*.wav
  # zsh
  install -vDm 644 "misc/zsh/_${_name}" \
    "${pkgdir}/usr/share/zsh/site-functions/_${_name}"
  # docs
  install -t "${pkgdir}/usr/share/doc/${_name}/" \
    -vDm 644 {AUTHORS,CHANGES,README.md} "misc/${_name}/"*.{example,yaml}
}
