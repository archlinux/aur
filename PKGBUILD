# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname=mstream-git
pkgver=v4.7.0.r20.gb52fdde
pkgrel=1
pkgdesc="Music player server with a web-based interface"
arch=("any")
url="https://mstream.io"
license=("GPL3")
depends=("nodejs")
makedepends=("npm")
conflicts=("nodejs-mstream" "mstream")
backup=("etc/mstream.json")
install="mstream.install"
#source=("git+https://github.com/IrosTheBeggar/mStream.git"
# using this branch because it supports relative URLs (pull request pending)
source=("git+https://github.com/d10n/mStream.git#branch=d10n-master"
        "mstream.json"
        "mstream.service"
        "mstream.sysusers")
md5sums=("SKIP"
        "f590018cf4626a0e1a2bfb9b30531c44"
        "f4fb1b503cedd059c4c3e311b7f8a206"
        "542a37c003900d7e68fc0820fc0634e2")

pkgver(){
 cd "$srcdir/mStream"
 git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
}

package(){
 tar czf "mStream.tar.gz" -C "$srcdir/mStream" .
 npm install -g --user root --prefix "$pkgdir/usr" "mStream.tar.gz"

 install -d "$pkgdir/var/cache/mstream"
 install -d "$pkgdir/var/lib/mstream"
 install -d "$pkgdir/var/lib/mstream/album-art"
 install -d "$pkgdir/var/lib/mstream/db"
 install -d "$pkgdir/var/lib/mstream/media"
 install -d "$pkgdir/var/lib/mstream/sync"
 install -d "$pkgdir/var/log/mstream"
 
 install -Dm640 "mstream.json" "$pkgdir/etc/mstream.json"
 install -Dm644 "mstream.service" "$pkgdir/usr/lib/systemd/system/mstream.service"
 install -Dm644 "mstream.sysusers" "$pkgdir/usr/lib/sysusers.d/mstream.conf"
 
 chown -R root: "$pkgdir/usr"
 chown root:mstream "$pkgdir/etc/mstream.json"
 chown -R mstream: "$pkgdir/var/cache/mstream" "$pkgdir/var/lib/mstream" "$pkgdir/var/log/mstream"
 chmod 755 "/usr/lib/node_modules" "$pkgdir/usr/lib/node_modules/mstream/node_modules" "$pkgdir/usr/lib/node_modules/mstream/node_modules/.bin"

 rm -r "$pkgdir/usr/lib/node_modules/mstream/.git"
 rm -r "$pkgdir/usr/lib/node_modules/mstream/image-cache/"
 rm -r "$pkgdir/usr/lib/node_modules/mstream/save/db"
 rm -r "$pkgdir/usr/lib/node_modules/mstream/save/sync"
 rm -r "$pkgdir/usr/lib/node_modules/mstream/save/logs"

 ln -s "/var/cache/mstream" "$pkgdir/usr/lib/node_modules/mstream/image-cache"
 ln -s "/var/lib/mstream/db" "$pkgdir/usr/lib/node_modules/mstream/save/db"
 ln -s "/var/lib/mstream/sync" "$pkgdir/usr/lib/node_modules/mstream/save/sync"
 ln -s "/var/log/mstream" "$pkgdir/usr/lib/node_modules/mstream/save/logs"
}
