# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="mstream"
pkgver=5.9.1
pkgrel=1
pkgdesc="Music player server with a web-based interface"
url="https://mstream.io"
license=("GPL3")
arch=("any")
provides=("mstream")
conflicts=("nodejs-mstream" "mstream-git")
replaces=("mstream-git")
depends=("nodejs")
makedepends=("npm")
source=("$pkgname-$pkgver.tar.gz::https://github.com/IrosTheBeggar/mStream/archive/refs/tags/v$pkgver.tar.gz"
        "mstream.json"
        "mstream.service"
        "mstream.sysusers"
        "mstream.tmpfiles")
sha256sums=('a77458ba8969c95b91c8864480934cd13e2112b4f728c5e43e4f67b6ad782c69'
            '1d6faa9e1a76d13f3ab8558a3640158b1f0a54f624a4e37ddc3ef41ed4191058'
            '833f86daaffb12857612ef5b1264e944b0a48a077d5a8bb8d217ec6565ed90c3'
            '5f2e6aced1707f64ca4ae3ae647fb6a8420f5c2a747ba06fa9174920fd821437'
            '3664207c5b2782d55acc77a6ff1ced5c80447047c4c036837983dc03e19896de')
noextract=("$pkgname-$pkgver.tar.gz")
backup=("etc/mstream.json")
options=("!strip")

package(){
 npm install -g --prefix "$pkgdir/usr" "$pkgname-$pkgver.tar.gz"

 install -d -m 750 "$pkgdir/var/cache/mstream"
 install -d -m 750 "$pkgdir/var/lib/mstream"
 install -d "$pkgdir/var/lib/mstream/album-art"
 install -d "$pkgdir/var/lib/mstream/db"
 install -d "$pkgdir/var/lib/mstream/media"
 install -d "$pkgdir/var/lib/mstream/sync"
 install -d "$pkgdir/var/log/mstream"

 install -D -m 600 "$srcdir/mstream.json" "$pkgdir/etc/mstream.json"
 install -D -m 644 "$srcdir/mstream.service" "$pkgdir/usr/lib/systemd/system/mstream.service"
 install -D -m 644 "$srcdir/mstream.sysusers" "$pkgdir/usr/lib/sysusers.d/mstream.conf"
 install -D -m 644 "$srcdir/mstream.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/mstream.conf"

 rm -r "$pkgdir/usr/lib/node_modules/mstream/.github" \
  "$pkgdir/usr/lib/node_modules/mstream/.npmignore" \
  "$pkgdir/usr/lib/node_modules/mstream/bin" \
  "$pkgdir/usr/lib/node_modules/mstream/image-cache/" \
  "$pkgdir/usr/lib/node_modules/mstream/save/db" \
  "$pkgdir/usr/lib/node_modules/mstream/save/sync" \
  "$pkgdir/usr/lib/node_modules/mstream/save/logs"

 chown -R root: "$pkgdir/usr"
 ln -s "/var/cache/mstream" "$pkgdir/usr/lib/node_modules/mstream/image-cache"
 ln -s "/var/lib/mstream/db" "$pkgdir/usr/lib/node_modules/mstream/save/db"
 ln -s "/var/lib/mstream/sync" "$pkgdir/usr/lib/node_modules/mstream/save/sync"
 ln -s "/var/log/mstream" "$pkgdir/usr/lib/node_modules/mstream/save/logs"
}
