# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="mstream"
pkgver=5.13.1
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
b2sums=('aac8d58218a240bf4b11f181957de0cb28a48be3e8e3cc54ffd035f7e2373e7705371c9327fcb2ff9db2f2274243bf99ca4450c6257490f04276aa416b3e470b'
        'bfc90b958b79be3b741cd1315c282097bdf07e6bd990340b612c4223faed5847fcb5b8390a4d07ff799113a1651ab8bdde7a526bd38df5775222678d09fd0161'
        '87799de7450bbd6cf85b83ef06c0e43699144c4d7910947ea15ee3fe741058cb8420e031d8f53efe753bfbb3a9dc94ba897b129658db942f06ccc37bd972c37e'
        '2a9d93f3c85a3755a446b2a9297fb1c06b6614196328db395f963e66279b4597f499d0df11c064681db363abeed88ae63a0a435570bf2ad21e13c6497de5f81b'
        'f8c644e5aa5ad413ec31f30baf90978d3e5a8c1dfd6c1db76051ce9d156a58027ec0b196f39d53fbf4580aef60b79b00d677aa809055a502f152fd481a471100')
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
