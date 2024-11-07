# Maintainer: Aikawa Yataro <aikawayataro at protonmail dot com>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=omi
pkgver=1.9.1_0
pkgrel=1
pkgdesc='Open Management Infrastructure (OMI) is an open source project to further the development of a production quality implementation of the DMTF CIM/WBEM standards.'
arch=('i686' 'x86_64')
url='https://github.com/Microsoft/omi'
license=('MIT')
depends=('openssl')
makedepends=('lsb-release')

source=("$pkgname-$pkgver.tar.gz::https://github.com/Microsoft/omi/archive/v${pkgver//_/-}.tar.gz"
            'omi-configure.patch'
            'omi-server-config.patch'
            'omi.service'
            'omigenkey.service'
            'omi.sysusers'
            'omi.tmpfiles'
            'omikeygen')
sha256sums=('3b52b10bef876ca1ef8bd31aac693442e9faa15b2c7da5759749db27849ab145'
            '8e4943f9a69b6be1d28170db271cc4ca29b680652c03001e1957133d369964b9'
            '806f0afccdb4c901f4ccbb8445bfc3518392f1f8c7fad1265cb733e7dd746be3'
            '584ce65c07a9984dda871e4b0eb2461533b6f88cfc2978edde3d10d2be6b0d49'
            'e2233224c6702f82764e5925725a3a5eedcf6a704a422885da89f09946c94877'
            'b1320b9bb156a66c09b0e376043d8c3788e3d1838a5299d05da5f62335d11736'
            '84bf7c5545ceefaa7ae70c763070bc70495cc6029031bd6a2bcd9c978a3a4365'
            '99befefa05dfd3f28cf6ce45dea52892c9a1cdfa3873baf5d40f02426880cbbb')

prepare() {
  cd "$pkgname-${pkgver//_/-}"
  patch --forward --strip=1 --input=../omi-configure.patch # Remove broken features
  patch --forward --strip=1 --input=../omi-server-config.patch # Use `omi` user for omiservice
}

build() {
  cd "$pkgname-${pkgver//_/-}/Unix"
  ./configure --enable-microsoft
  make
}

package() {
  cd "$pkgname-${pkgver//_/-}/Unix"
  make install DESTDIR="$pkgdir"

  cp "$srcdir/omikeygen" "$pkgdir/opt/omi/bin"
  install -Dm 644 "$srcdir/omi.service" -t "$pkgdir/usr/lib/systemd/system"
  install -Dm 644 "$srcdir/omigenkey.service" -t "$pkgdir/usr/lib/systemd/system"
  install -Dm 644 "$srcdir/omi.sysusers" "$pkgdir/usr/lib/sysusers.d/omi.conf"
  install -Dm 644 "$srcdir/omi.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/omi.conf"

  install -Dm 644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
