# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=wmbusmeters
pkgver=3.1.1
pkgrel=2
pkgdesc='Read the wired or wireless mbus protocol to acquire utility meter readings'
arch=(x86_64)
url='https://github.com/wmbusmeters/wmbusmeters'
license=(GPL-3.0-or-later)
depends=(glibc libgcc libstdc++ libxml2 rtl-sdr)
makedepends=(libusb)
optdepends=('rtl-wmbus: read wmbusmeters from rtl-sdr receivers')
backup=('etc/wmbusmeters.conf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
  $pkgname.{service,sysusers,tmpfiles})
b2sums=('167eaa04f8d71be3fb61e40b182b5897a2195ebd21bdd5ebd3521563fdb0aa725995fe9b426449634a5ec30aee84d2dbc5203f5ca822f011c7e64d9947001396'
        '36841737f5fce2397180984ca8ca45223c4c2bbb4bea63302e739c5a6a74877c91a9d7f7e11ee5e5e4a6537ede35a724b673be2b01b0f997bab2b4d8ffe57237'
        'fe16731f076f6c05ba2447b59ffb2876fd67f9cc3a17c9180ea07f3cf0aa8f48a782faa604da2d84d4e27d9d3e9f27844d7832dfd5975b25c72a603a7926b7fd'
        '89aae2f0237425a90ba05375ad26ab0968cc76dca94f1bbbb453765ba0a0ea2e63450fd80597724e518e028522c81913bcd5dd9b39bdd39a86fef6abd20961dd')

build() {
  cd $pkgname-$pkgver
  ./configure
  make STRIP=true COMMIT_HASH=$pkgrel TAG=$pkgver BRANCH="master" CHANGES="nochanges"
}

package() {
  cd $pkgname-$pkgver
  make STRIP=true COMMIT_HASH=$pkgrel TAG=$pkgver BRANCH="master" CHANGES="nochanges" DESTDIR="$pkgdir" EXTRA_INSTALL_OPTIONS="--no-adduser" install

  # fix lib
  mv "$pkgdir"/lib "$pkgdir"/usr/lib

  # fix /usr/sbin
  mv "$pkgdir"/usr/sbin/* "$pkgdir"/usr/bin/
  rmdir "$pkgdir"/usr/sbin

  # log to the journal; tmpfiles creates the state directories with the service user as owner
  rm -r "$pkgdir"/etc/logrotate.d "$pkgdir"/var
  sed -i 's|^logfile=.*|logfile=syslog|' "$pkgdir"/etc/wmbusmeters.conf

  # remove systemd file, since we do not use wmbus user
  rm "$pkgdir"/usr/lib/systemd/system/wmbusmeters.service

  # install our own systemd service/tmpfiles/sysusers
  install -Dm644 ../$pkgname.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/$pkgname.conf
  install -Dm644 ../$pkgname.sysusers "$pkgdir"/usr/lib/sysusers.d/$pkgname.conf
  install -Dm644 ../$pkgname.service -t "$pkgdir"/usr/lib/systemd/system/
}

# vim:set ts=2 sw=2 et:
