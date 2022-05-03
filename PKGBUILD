# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: dingjing <dingjing@live.cn>

pkgname=graceful-udisks
_pkgname=udisks2
pkgver=2.9.4
myver=3
pkgrel=1
pkgdesc='原始项目: https://www.freedesktop.org/wiki/Software/udisks, 本项目仅用于个人调试，不能用于生产环境，否则会造成不可预估的损失，使用本包造成的损失由自己承担。'
arch=('x86_64')
url="https://github.com/graceful-linux/udisks"
license=('GPL2')
depends=('polkit' 'libatasmart' 'libgudev' 'libblockdev')
makedepends=('docbook-xsl' 'gobject-introspection' 'parted' 'gtk-doc')
optdepends=('gptfdisk: GUID partition table support'
            'ntfs-3g: NTFS filesystem management support'
            'dosfstools: VFAT filesystem management support')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
backup=('etc/udisks2/udisks2.conf')
source=("https://github.com/graceful-linux/udisks/archive/refs/tags/udisks-debug-$pkgver-$myver.tar.gz")
sha512sums=('fb67dd66641058edcbbcaab3f468734dbe89e6c978f6f741dfe530968bbf64e1203ba3a504193bb34e43fc586c39547380d926d1697e8cca5d29995c83b2a29a')

prepare() {
  mv udisks-udisks-debug-$pkgver-$myver udisks-udisks-$pkgver 
  cd udisks-udisks-$pkgver
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd udisks-udisks-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc \
      --sbindir=/usr/bin --libexecdir=/usr/lib \
      --with-systemdsystemunitdir=/usr/lib/systemd/system \
      --localstatedir=/var --disable-static \
      --enable-gtk-doc enable_available_modules=yes
  make
}

check() {
  cd udisks-udisks-$pkgver
  make check
}

package() {
  cd udisks-udisks-$pkgver
  make DESTDIR="$pkgdir" install
}
