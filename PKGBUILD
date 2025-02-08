# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="lms-git"
pkgver=3.63.0.r0.gdd1a080b
pkgrel=1
pkgdesc="Lightweight Music Server. Access your self-hosted music using a web interface"
url="https://github.com/epoupon/lms"
license=("GPL3")
arch=("x86_64" "armv7h")
depends=("ffmpeg" "libconfig" "taglib" "wt" "stb")
makedepends=("boost" "cmake" "graphicsmagick" "pstreams" "git")
source=("$pkgname::git+$url.git"
        "lms.sysusers"
        "lms.service"
        "lms.tmpfiles")
b2sums=('SKIP'
        '3f69fe7199768caae29e030a4663f70392e8bc3347387f06cc51f69c2d44fe505534b31ebe1e085ad38b321cc4230ccd1d3a16a325bfa7f2794787f04951f7bd'
        '5a1a4ee8583ee27ac119a3b4523bc3e76901f45b655ce33fc72079cdd1aae2eb68ca8288524a5347dd9c3264552d887fe174b6830ad5c3a83039995f3e29bb7a'
        'e2613fb3dd3321ba96f30fc6228ed5be2dcc907c118c09950c42d92f6d7e9bf59a4452a7eebbbaca5bb60d28c6c2bf3811351336f6aaa6fe58af239671229423')
backup=("etc/lms.conf")

pkgver(){
 cd "$pkgname"
 git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g;s/^v//"
}

build(){
 cd "$pkgname"
 rm -rf build
 mkdir build
 cd build
 cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
 make
}

package(){
 install -d "$pkgdir/var/lib/lms"
 install -D -m 644 "lms.service" "$pkgdir/usr/lib/systemd/system/lms.service"
 install -D -m 644 "lms.sysusers" "$pkgdir/usr/lib/sysusers.d/lms.conf"
 install -D -m 644 "lms.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/lms.conf"

 cd "$pkgname/build"
 make DESTDIR="$pkgdir" install
 install -D -m 644 "$pkgdir/usr/share/lms/lms.conf" "$pkgdir/etc/lms.conf"
 sed -i "s|/var/lms|/var/lib/lms|g" "$pkgdir/etc/lms.conf"
}
