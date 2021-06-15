# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="lms-git"
pkgver=3.26.1.r1.g8231c67
pkgrel=1
pkgdesc="Lightweight Music Server. Access your self-hosted music using a web interface"
url="https://github.com/epoupon/lms"
license=("GPL3")
arch=("x86_64" "armv7h")
depends=("ffmpeg" "libconfig" "libtaginfo" "wt")
makedepends=("boost" "cmake" "graphicsmagick" "pstreams" "git")
source=("$pkgname::git+$url.git"
        "lms.sysusers"
        "lms.service"
        "lms.tmpfiles")
sha256sums=("SKIP"
            "04bda76b610b7d61dfcad355a5ca18c794df417e1b3172d7419c93170446da41"
            "e52499370746e696f18271db3703853475c6565e10f73e1e3514868a327db3d1"
            "32f537bf3480fbe55d0a9929ba633718fbc16887a68e0ba1a2b3b265c400ed41")
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
