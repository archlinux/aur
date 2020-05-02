# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=it-edit-git
pkgver=2.0.r2.6850468
pkgrel=1
pkgdesc="An integrated terminal programming text-editor with many functionalities like a manpage reader, a documentation registering with direct accessing mechanism and many others settings and features"
arch=('x86_64')
url="https://github.com/mrcyberfighter/IT-Edit"
license=('GPL-3.0')
provides=('it-edit')
depends=('vte290')
makedepends=('git')
source=("git+${url}"
		'0001-fix-make-install-failure-inside-fakeroot.patch')
sha256sums=('SKIP'
			'SKIP')

pkgver() {
  cd "${srcdir}/IT-Edit/it-edit-2.0/"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "2.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${srcdir}/IT-Edit/"
  patch -Np1 -i "${srcdir}/0001-fix-make-install-failure-inside-fakeroot.patch"
  cd it-edit-2.0
  chmod 755 configure
  autoreconf -if
  ./configure --prefix=/usr
}

build() {
  cd "${srcdir}/IT-Edit/it-edit-2.0/"
  make
}

package() {
  cd "${srcdir}/IT-Edit/it-edit-2.0/"
  make install DESTDIR="${pkgdir}"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname%-git}"
  ln -s /usr/share/licenses/common/GPL3/license.txt "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
  chmod 755 "${pkgdir}/usr/share/applications"
}