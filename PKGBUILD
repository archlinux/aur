# Maintainer: Jake <aur@ja-ke.tech>
### Based on extra/powerdevil:
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=powerdevil-ddcutil
_pkgname=${pkgname%-ddcutil}
pkgver=5.26.4
pkgrel=1
pkgdesc='Power management for KDE plasma with DDC/CI enabled'
arch=(x86_64)
url='https://kde.org/plasma-desktop/'
license=(LGPL)
conflicts=($_pkgname)
provides=($_pkgname)
depends=(plasma-workspace bluez-qt networkmanager-qt ddcutil)
makedepends=(extra-cmake-modules kdoctools)
optdepends=('kinfocenter: for the Energy Information KCM' 'power-profiles-daemon: power profiles support')
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$pkgver/$_pkgname-$pkgver.tar.xz{,.sig}
        '45-ddcutil-i2c.rules'
        'i2c.sysusers')
sha256sums=('a39f83175603eca8e966eb6d7fb33528afe3d6a877d0ffbe5016471c76b755e9'
            'SKIP'
            'aa9980b02beb49e0ccafc59c57fc6b28b31308e60559120697a864a511fbef6c'
            'bf5ee4f9876505628c5ce84e84e918c70d66be70b766d62bb138e294608ffbae')
validpgpkeys=('E0A3EB202F8E57528E13E72FD7574483BB57B18D'  # Jonathan Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

build() {
  cmake -B build -S $_pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF \
    -DHAVE_DDCUTIL=On
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 '45-ddcutil-i2c.rules' "$pkgdir/usr/lib/udev/rules.d/45-ddcutil-i2c.rules"
  install -Dm644 'i2c.sysusers' "$pkgdir/usr/lib/sysusers.d/i2c.conf"
}
