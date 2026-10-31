# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=wmbusmeters
pkgver=3.1.1
pkgrel=1
pkgdesc='Read the wired or wireless mbus protocol to acquire utility meter readings'
arch=(x86_64)
url='https://github.com/wmbusmeters/wmbusmeters'
license=(GPL-3.0-or-later)
depends=(glibc libgcc libstdc++ libxml2 rtl-sdr)
makedepends=(libusb)
optdepends=('rtl-wmbus: read wmbusmeters from rtl-sdr recievers')
backup=('etc/wmbusmeters.conf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
  $pkgname.{service,sysusers,tmpfiles})
b2sums=('167eaa04f8d71be3fb61e40b182b5897a2195ebd21bdd5ebd3521563fdb0aa725995fe9b426449634a5ec30aee84d2dbc5203f5ca822f011c7e64d9947001396'
        'e5abb7690ab1095987542b5542b6e4d6b651899b56933165679343c5b19e6a8ec653007b83f0e08a71a2cffff6fb9c34c7be77480ab3a09ba758ce97a6a13fee'
        'c4e13af08548da1563f5a15d56d979876ba5367b60ac5b3b76ab6c984ee7c34b022345d929ef0566301a3ed289d9965c7223e1658826f610d184a1414ce369ab'
        '236107124e3b198cd2bed49651f4af24609f399b4e6420eb16828d6c9ca97e3e2d129acfd15aaacae91c150c54d158f0f3aa091c6ddef128880e3d0dd018a5aa')

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

  # journald
  rm -r "$pkgdir"/etc/logrotate.d "$pkgdir"/var/log

  # remove systemd file, since we do not use wmbus user
  rm "$pkgdir"/usr/lib/systemd/system/wmbusmeters.service

  # install our own systemd service/tmpfiles/sysusers
  install -Dm644 ../$pkgname.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/$pkgname.conf
  install -Dm644 ../$pkgname.sysusers "$pkgdir"/usr/lib/sysusers.d/$pkgname.conf
  install -Dm644 ../$pkgname.service -t "$pkgdir"/usr/lib/systemd/system/
}

# vim:set ts=2 sw=2 et:
