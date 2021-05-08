# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Aurelien Foret <orelien@chez.com>

pkgname=gnokii
pkgver=0.6.31
pkgrel=19
pkgdesc='Tools and user space driver for use with mobile phones'
arch=('x86_64')
url='https://www.gnokii.org/'
license=('GPL')
depends=('libusb-compat' 'libxpm' 'bluez-libs' 'libical' 'sqlite' 'systemd')
makedepends=('gtk2' 'mariadb-libs' 'postgresql-libs' 'intltool')
optdepends=('dialog: sendsms tool'
            'gtk2: xgnokii GUI'
            'mariadb-libs: smsd mysql backend'
            'postgresql-libs: smsd postgresql backend')
backup=('etc/gnokiirc')
install=$pkgname.install
source=("https://www.gnokii.org/download/$pkgname/$pkgname-$pkgver.tar.bz2"
        'gnokii-config.patch'
        'gnokii-lock.patch'
        'gnokii-gcc5.patch'
        'gnokii-gcc7.patch')
sha256sums=('8f5a083b05c1a66a3402ca5cd80084e14c2c0632c991bb53b03c78e9adb02501'
            '4c795f0b80b3703a2813adb32399b42080a01670619c1db63ab094494cb6f329'
            'e0584a44268e9055b43f1673d7db828f45294c5108635ebd5f664e12703f108b'
            'eafe67990e383e92636a88de27f003674374db81d986ddbb397ab18d82b6556d'
            'a5db8684216904bd2a2cd8a557dcc16484831b9bc2ec91a0b102b14c3bfe9245')

prepare() {
  cd $pkgname-$pkgver

  # Set bindir location
  patch -Np1 -i ../gnokii-config.patch

  # Set lock path
  patch -Np1 -i ../gnokii-lock.patch

  # Fix build with GCC 5 (Fedora patch)
  patch -Np1 -i ../gnokii-gcc5.patch

  # Fix build with GCC 7
  patch -Np1 -i ../gnokii-gcc7.patch
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --sbindir=/usr/bin \
              --enable-security
  make
  pushd xgnokii
  make
  popd
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
  pushd xgnokii
  make DESTDIR="$pkgdir" install
  popd

  # Install initial config file
  install -Dm644 Docs/sample/gnokiirc "$pkgdir/etc/gnokiirc"

  # Fix file permission
  chmod 755 "$pkgdir/usr/bin/sendsms"

  # Setup lock directory
  install -dm755 "$pkgdir"/usr/lib/tmpfiles.d
  echo 'd /run/lock/lockdev 0775 root lock -' > "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}
