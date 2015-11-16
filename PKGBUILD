# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: codestation <codestation404@gmail.com>

pkgname=libvitamtp-git
pkgver=v2.5.6.6.ge98d0ec
pkgrel=1
pkgdesc="Library to interact with Vita's USB MTP protocol. (GIT version"
arch=("i686" "x86_64")
url='https://github.com/codestation/vitamtp'
license=('GPL')
depends=('libusb'
         'libxml2'
         )
provides=('libvitamtp')
conflicts=('vitamtp' 'vitamtpmod')
source=('libvitamtp::git+https://github.com/codestation/vitamtp.git'
        'libvitamtp-git.sysuser')
sha1sums=('SKIP'
          '90ec10f07f7526009e099ddcb758fcfec7d3b095')
install=libvitamtp-git.install

pkgver() {
  cd libvitamtp
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  cd libvitamtp

  # only allow users in the vitamtp group to access the Vita
  sed 's/root/vitamtp/' -i debian/libvitamtp4.udev
  sed 's/666/660/' -i debian/libvitamtp4.udev

  ./autogen.sh
}

build() {
  cd libvitamtp
  ./configure --prefix=/usr
  make
}

package() {
  cd libvitamtp
  make DESTDIR="${pkgdir}" install
  install -Dm644 debian/libvitamtp4.udev "${pkgdir}/usr/lib/udev/rules.d/80-psvita.rules"

  install -Dm644 ${srcdir}/libvitamtp-git.sysuser "${pkgdir}/usr/lib/sysusers.d/vitamtp.conf"
}
