# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="lms-git"
pkgver=v3.19.2.r0.g8ecf41e
pkgrel=1
pkgdesc="Lightweight Music Server. Access your self-hosted music using a web interface"
url="https://github.com/epoupon/lms"
license=("GPL3")
arch=("x86_64" "armv7h")
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
        "lms.service"
        "lms.tmpfiles")
md5sums=("SKIP"
        "938534cc0cd64a4990dd3f413ea0f4bb"
        "7cdb8d3326ed75ce31ce7d4c20fa12c1"
        "54f669182ba59508d71729f40ead6b93")
backup=("etc/lms.conf")

pkgver(){
 cd "$pkgname"
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
