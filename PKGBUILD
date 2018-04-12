# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: codestation <codestation404@gmail.com>

pkgname=libvitamtp-git
pkgver=v2.5.9.2.g09b50f7
pkgrel=1
pkgdesc="Library to interact with Vita's USB MTP protocol. (GIT version)"
arch=('x86_64')
url='https://github.com/codestation/vitamtp'
license=('GPL')
depends=('libusb'
         'libxml2'
         )
provides=('libvitamtp')
conflicts=('libvitamtp'
           'vitamtp'
           'vitamtpmod'
           )
source=('libvitamtp::git+https://github.com/codestation/vitamtp.git#branch=testing'
        'libvitamtp-git.sysuser'
        )
sha1sums=('SKIP'
          '06698a33a6dec777373ab4273caf4a55bfde596c'
          )
install=libvitamtp-git.install

pkgver() {
  cd libvitamtp
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  cd libvitamtp
  ./autogen.sh
}

build() {
  cd libvitamtp
  ./configure \
    --prefix=/usr

  make
}

package() {
  cd libvitamtp
  make DESTDIR="${pkgdir}" install
  install -Dm644 debian/libvitamtp*.udev "${pkgdir}/usr/lib/udev/rules.d/80-psvita.rules"

  install -Dm644 ${srcdir}/libvitamtp-git.sysuser "${pkgdir}/usr/lib/sysusers.d/vitamtp.conf"
}
