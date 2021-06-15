# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="mstream-git"
pkgver=4.7.0.r20.gb52fdde
pkgrel=1
pkgdesc="Music player server with a web-based interface"
url="https://mstream.io"
license=("GPL3")
arch=("any")
provides=("mstream")
conflicts=("nodejs-mstream")
depends=("nodejs")
makedepends=("npm" "git")
#source=("git+https://github.com/IrosTheBeggar/mStream.git"
# using this branch because it supports relative URLs (pull request pending)
source=("git+https://github.com/d10n/mStream.git#branch=d10n-master"
        "mstream.json"
        "mstream.service"
        "mstream.sysusers"
        "mstream.tmpfiles")
sha256sums=("SKIP"
            "fb95db00a269d0e7f5d6b7e23e037d319176ad8e7a8332ab61f87ed2e82842a7"
            "833f86daaffb12857612ef5b1264e944b0a48a077d5a8bb8d217ec6565ed90c3"
            "5f2e6aced1707f64ca4ae3ae647fb6a8420f5c2a747ba06fa9174920fd821437"
            "a584c25700c57ffe9df9a1902e44fe2f0ad9b508af748eca540734e3df44bb0f")
backup=("etc/mstream.json")
options=("!strip")
install="mstream.install"

pkgver(){
 cd "mStream"
 git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g;s/^v//"
}

package(){
 # archiving the folder because `npm install` doesn't move the files to $pkgdir
 tar czf "mStream.tar.gz" -C "mStream" .
 npm install -g --user root --prefix "$pkgdir/usr" "mStream.tar.gz"

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

 rm -r "$pkgdir/usr/lib/node_modules/mstream/.git" \
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
