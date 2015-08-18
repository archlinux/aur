# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Joao Cordeiro <jlcordeiro@gmail.com>

pkgname=ntfs-config
pkgver=1.0.1
pkgrel=13
pkgdesc="Enable/disable NTFS write support with a simple click"
arch=(any)
url=http://flomertens.free.fr/$pkgname/
license=(GPL2)
depends=(ntfs-3g pygtk udev)
makedepends=(intltool)
optdepends=('hal: external devices'
    'gnome-mount: external devices (or any other that can handle ntfs-3g using hal as backend)'
    'device-mapper: crypt, lvm and raid devices'
    'e2fsprogs: blkid')
source=(http://l42y.googlecode.com/files/$pkgname-$pkgver.tar.gz
    $pkgname.patch)
sha256sums=('611dbcfa7aebf44ef8ad170d16952e256aec055e4f2cb334cf20a12a75bbdcb2'
    '795d9270667993a638b2c187b7b8340fd9157cbfae2ed35fcc6413d17087e8d2')
sha512sums=('f09cd863b35dfdd53ee24b2f663bf356de5b270f13020553002aadf68c84ea2d2aa704a3b3e7f8e4d0cb468eb5dfc568229cc04c8555ba2848142959e89f0b52'
    '6f4740087a2874c0a0190110ad55554e433b9bc8550f391baec0e34a62f3cee34c28e084849a38f63761fffe5fa901c48b88b73c984d5c76f7c430893b2c3e43')

prepare() {
    cd $pkgname-$pkgver/
    patch -p1 -i ../$pkgname.patch
}

build() {
    cd $pkgname-$pkgver/
    autoreconf -fi
    ./configure --prefix=/usr --sbindir=/usr/bin
    make
}

package() {
    cd $pkgname-$pkgver/
    # prevent silly HAL error
    install -d "$pkgdir"/etc/hal/fdi/
    touch "$pkgdir"/etc/hal/fdi/policy
    make DESTDIR="$pkgdir" install
}
