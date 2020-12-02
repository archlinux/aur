# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Espen Fossen <espfos@junta.no>

pkgname="nodejs-mstream"
pkgver=4.6.1
pkgrel=2
pkgdesc="Music player server with a web-based interface, NPM-JS package"
url="https://mstream.io"
license=("GPL3")
arch=("any")
provides=("mstream")
conflicts=("mstream-git")
depends=("nodejs")
makedepends=("npm")
source=("https://registry.npmjs.org/mstream/-/mstream-$pkgver.tgz"
        "mstream.json"
        "mstream.service"
        "mstream.sysusers"
        "mstream.tmpfiles")
sha256sums=("40b2c1bf628e0462bc0f80e45a5d2a3a4e8f50f14366077c6c61ba309f00e990"
            "fb95db00a269d0e7f5d6b7e23e037d319176ad8e7a8332ab61f87ed2e82842a7"
            "833f86daaffb12857612ef5b1264e944b0a48a077d5a8bb8d217ec6565ed90c3"
            "5f2e6aced1707f64ca4ae3ae647fb6a8420f5c2a747ba06fa9174920fd821437"
            "a584c25700c57ffe9df9a1902e44fe2f0ad9b508af748eca540734e3df44bb0f")
backup=("etc/mstream.json")
install="mstream.install"
noextract=("mstream-$pkgver.tgz")

package(){
 npm install -g --user root --prefix "$pkgdir/usr" "mstream-$pkgver.tgz"

 install -d "$pkgdir/var/cache/mstream"
 install -d "$pkgdir/var/lib/mstream"
 install -d "$pkgdir/var/lib/mstream/album-art"
 install -d "$pkgdir/var/lib/mstream/db"
 install -d "$pkgdir/var/lib/mstream/media"
 install -d "$pkgdir/var/lib/mstream/sync"
 install -d "$pkgdir/var/log/mstream"
 
 install -D -m 640 "mstream.json" "$pkgdir/etc/mstream.json"
 install -D -m 644 "mstream.service" "$pkgdir/usr/lib/systemd/system/mstream.service"
 install -D -m 644 "mstream.sysusers" "$pkgdir/usr/lib/sysusers.d/mstream.conf"
 install -D -m 644 "mstream.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/mstream.conf"

 rm -r "$pkgdir/usr/lib/node_modules/mstream/image-cache/" \
  "$pkgdir/usr/lib/node_modules/mstream/save/db" \
  "$pkgdir/usr/lib/node_modules/mstream/save/sync" \
  "$pkgdir/usr/lib/node_modules/mstream/save/logs"

 chown -R root: "$pkgdir/usr"

 ln -s "/var/cache/mstream" "$pkgdir/usr/lib/node_modules/mstream/image-cache"
 ln -s "/var/lib/mstream/db" "$pkgdir/usr/lib/node_modules/mstream/save/db"
 ln -s "/var/lib/mstream/sync" "$pkgdir/usr/lib/node_modules/mstream/save/sync"
 ln -s "/var/log/mstream" "$pkgdir/usr/lib/node_modules/mstream/save/logs"
}
