# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: dingjing <dingjing@live.cn>

pkgname=graceful-udisks
_pkgname=udisks2
myver=12
pkgver=2.9.4
pkgrel=$myver
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
sha512sums=('5ac771ffd376d66fa5e877c6969f0bc0ad6666a28a09ba92eb8e75000fdf9d9eebc73f7b6a3748172391e19d5c36931d8c83b8c9870663b46e0a9deb28768a0e')

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
