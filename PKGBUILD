# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname=lms-git
pkgver=v3.18.0.r0.gf77804a
pkgrel=1
pkgdesc="Lightweight Music Server. Access your self-hosted music using a web interface"
arch=("x86_64" "armv7h")
url="https://github.com/epoupon/lms"
license=("GPL3")
depends=("ffmpeg"
        "libconfig"
        "libtaginfo"
        "wt")
makedepends=(
        "boost"
        "cmake"
        "graphicsmagick"
        "pstreams")
source=("$pkgname::git+$url.git"
        "lms.sysusers"
        "lms.service")
md5sums=("SKIP"
        "938534cc0cd64a4990dd3f413ea0f4bb"
        "7cdb8d3326ed75ce31ce7d4c20fa12c1")
backup=("etc/lms.conf")

pkgver(){
 cd "$srcdir/$pkgname"
 git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
}

build(){
 cd "$pkgname"
 rm -rf build
 mkdir build
 cd build
 cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
 make 
}

package() {
 cd "$pkgname/build"
 make DESTDIR="$pkgdir" install
 install -Dm644 "$pkgdir/usr/share/lms/lms.conf" "$pkgdir/etc/lms.conf"
 sed -i "s|/var/lms|/var/lib/lms|g" "$pkgdir/etc/lms.conf"
 install -Dm644 "$srcdir/lms.service" "$pkgdir/usr/lib/systemd/system/lms.service"
 install -Dm644 "$srcdir/lms.sysusers" "$pkgdir/usr/lib/sysusers.d/lms.conf"
 install -d "$pkgdir/var/lib/lms"
 chown lms: "$pkgdir/var/lib/lms"
}
