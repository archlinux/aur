# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: codestation <codestation404@gmail.com>

pkgname=libvitamtp-git
pkgver=2.5.9.2.g09b50f7
pkgrel=1
pkgdesc="Library to interact with Vita's USB MTP protocol. (GIT version)"
arch=('x86_64')
url='https://github.com/codestation/vitamtp'
license=('GPL')
depends=(
  'libusb'
  'libxml2'
)
provides=('libvitamtp')
conflicts=(
  'libvitamtp'
  'vitamtp'
  'vitamtpmod'
)
source=(
  'libvitamtp::git+https://github.com/codestation/vitamtp.git#branch=testing'
  'libvitamtp-git.sysuser'
)
sha256sums=(
  'SKIP'
  '1097b417fa02466b7c9d7f7296329f4ba5a6d566687c931ecae4821af29619ea'
)
options=('debug')
install=libvitamtp-git.install

pkgver() {
  cd libvitamtp
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

prepare() {
  mkdir -p build

  (cd libvitamtp; autoreconf -vfi -I /usr/share/gettext/m4)
}

build() {
  cd build
  ../libvitamtp/configure \
    --prefix=/usr

  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
  install -Dm644 libvitamtp/debian/libvitamtp*.udev "${pkgdir}/usr/lib/udev/rules.d/80-psvita.rules"

  install -Dm644 ${srcdir}/libvitamtp-git.sysuser "${pkgdir}/usr/lib/sysusers.d/vitamtp.conf"
}
