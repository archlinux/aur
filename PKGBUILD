# Maintainer: Ali Ukani <ali.ukani@gmail.com>
pkgname=voltra
pkgver=1.11.0_1
pkgrel=1
pkgdesc='Voltra music player'
arch=('x86_64')
url='https://voltra.co'
license=('custom')
depends=()
makedepends=()
install=${pkgname}.install
source=('https://s3.amazonaws.com/download.voltra.co/voltra.deb')
md5sums=('52cbfe64f2799fe58a4094fb6881f74e')

pkgver() {
  bsdtar -xf "${srcdir}/control.tar.gz"
  grep -i "version" "${srcdir}/control" | cut -d ':' -f 2 | sed -e "s/-/_/" -e "s/\s//g"
}

package() {
  bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}/"

  cd "${pkgdir}"
  find -name '*.py' -exec sed -i 's|^#!/usr/bin/env python\s*$|#!/usr/bin/env python2|' {} \;
  find -name '*.py' -exec sed -i 's|^#!/usr/bin/python\s*$|#!/usr/bin/python2|' {} \;

  find "${pkgdir}"/usr -type f -exec chmod 644 {} \;
  find "${pkgdir}"/usr/bin -type f -exec chmod 755 {} \;
  find "${pkgdir}"/usr -type d -exec chmod 755 {} \;
  chmod 755 "${pkgdir}"/usr/share/voltra/voltra
  chmod 755 "${pkgdir}"/usr/share/voltra/resources/app/plugins

  mkdir -p "${pkgdir}"/usr/share/licenses/voltra/

  rm -rf "${pkgdir}/usr/bin/voltra"
  ln -s /usr/share/voltra/voltra "${pkgdir}/usr/bin/voltra"
  ln -s /usr/share/voltra/LICENSE "${pkgdir}/usr/share/licenses/voltra/LICENSE"
}
