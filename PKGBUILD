# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname=mstream-git
pkgver=v4.7.0.r20.gb52fdde
pkgrel=2
pkgdesc="Music player server with a web-based interface"
url="https://mstream.io"
license=("GPL3")
arch=("any")
provides=("mstream")
conflicts=("mstream" "nodejs-mstream")
depends=("nodejs")
makedepends=("npm")
#source=("git+https://github.com/IrosTheBeggar/mStream.git"
# using this branch because it supports relative URLs (pull request pending)
source=("git+https://github.com/d10n/mStream.git#branch=d10n-master"
        "mstream.json"
        "mstream.service"
        "mstream.sysusers"
        "mstream.tmpfiles")
md5sums=("SKIP"
        "f590018cf4626a0e1a2bfb9b30531c44"
        "f4fb1b503cedd059c4c3e311b7f8a206"
        "a2c873e2862c0cc5a13e3db4c05e61bb"
        "3d6bd19d0e8aa007f2f342d1d5a74083")
backup=("etc/mstream.json")
install="mstream.install"

pkgver(){
 cd "mStream"
 git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
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
