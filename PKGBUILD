# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=wmbusmeters
pkgver=1.15.0
pkgrel=1
pkgdesc='Read the wired or wireless mbus protocol to acquire utility meter readings'
arch=(x86_64)
url=https://github.com/wmbusmeters/wmbusmeters
license=(GPL-3.0-or-later)
depends=(rtl-sdr)
makedepends=()
source=("https://github.com/$pkgname/$pkgname/archive/refs/tags/$pkgver.tar.gz"
        $pkgname.{service,sysusers,tmpfiles})
b2sums=('8874d9f876add029b41781f2b42ae109218f5d3cf248c72d8572082ae7658f4014b8cdffe333501b7dbe19b8aa3cfe9f89687ee0913e691e8fc7ad8723aaff47'
        'e5abb7690ab1095987542b5542b6e4d6b651899b56933165679343c5b19e6a8ec653007b83f0e08a71a2cffff6fb9c34c7be77480ab3a09ba758ce97a6a13fee'
        'c4e13af08548da1563f5a15d56d979876ba5367b60ac5b3b76ab6c984ee7c34b022345d929ef0566301a3ed289d9965c7223e1658826f610d184a1414ce369ab'
        '236107124e3b198cd2bed49651f4af24609f399b4e6420eb16828d6c9ca97e3e2d129acfd15aaacae91c150c54d158f0f3aa091c6ddef128880e3d0dd018a5aa')

build() {
  cd $pkgname-$pkgver
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
  install -Dm644 "$srcdir"/$pkgname.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/$pkgname.conf
  install -Dm644 "$srcdir"/$pkgname.sysusers "$pkgdir"/usr/lib/sysusers.d/$pkgname.conf
  install -Dm644 "$srcdir"/$pkgname.service -t "$pkgdir"/usr/lib/systemd/system/
}

# vim: set ts=2 sw=2 tw=0 et :
