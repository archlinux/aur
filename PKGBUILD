# Maintainers:
#  - Thomas Weißschuh <thomas t-8ch de>
#  - Mike Javorski (javmorin) <mike.javorski gmail com>
#
pkgname=dput-ng
pkgver=1.33
pkgrel=1
pkgdesc='Next generation Debian package upload tool'
url='https://people.debian.org/~paultag/dput-ng/'
makedepends=('python-setuptools')
depends=('python-debian' 'python-distro-info')
license=('GPL2')
arch=('any')
provides=('dput')
conflicts=('dput')
source=("http://http.debian.net/debian/pool/main/d/${pkgname}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('d881055539a2ee70ed254398f6cb93893f4a07a6c4327adddbdbddbd136ef635')


package() {
  cd "$pkgname-$pkgver"

  python setup.py install --root="$pkgdir/" --optimize=1

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
