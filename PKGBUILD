# Maintainers:
#  - Thomas Weißschuh <thomas t-8ch de>
#  - Mike Javorski (javmorin) <mike.javorski gmail com>
#
pkgname=dput-ng
pkgver=1.15
pkgrel=1
pkgdesc='Next generation Debian package upload tool'
url='https://people.debian.org/~paultag/dput-ng/'
makedepends=('python2-setuptools')
depends=('python2-debian')
license=('GPL2')
arch=('any')
provides=('dput')
conflicts=('dput')
source=("http://http.debian.net/debian/pool/main/d/${pkgname}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('36e6075a705ecc653e428babdb691beba39485718e46083fb5ecc781d5e09dd4')


package() {
  cd "$pkgname-$pkgver"
  sed -i 's/#!\/usr\/bin\/env python$/#!\/usr\/bin\/env python2/' bin/* $(find -name '*.py')

  python2 setup.py install --root="$pkgdir/" --optimize=1

  install -d "${pkgdir}/usr/bin"
  install -m755 bin/{dput,dcut,dirt} "${pkgdir}/usr/bin"

  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 AUTHORS FAQ README.md TODO "${pkgdir}/usr/share/doc/${pkgname}"

  install -d "${pkgdir}/etc/dput.d"
  for _dir in metas profiles; do
    install -d "${pkgdir}/etc/dput.d/${_dir}"
    install -m644 skel/$_dir/* "${pkgdir}/etc/dput.d/${_dir}"
  done

  install -d "${pkgdir}/usr/share/${pkgname}"
  for _dir in codenames commands hooks interfaces schemas uploaders; do
    install -d "${pkgdir}/usr/share/${pkgname}/${_dir}"
    install -m644 skel/${_dir}/* "${pkgdir}/usr/share/${pkgname}/${_dir}"
  done

  # install -d "${pkgdir}/usr/share/bash-completion/completions/"
  install -Dm644 "debian/${pkgname}.bash-completion"  "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"

  install -d "${pkgdir}/usr/share/${pkgname}/examples"
  cp -r examples/* "${pkgdir}/usr/share/${pkgname}/examples"
}
