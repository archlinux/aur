# Maintainer: just-a-pony <pony@just-a-pony.net>
_repo_name=ZLMediaKit
pkgname=zlmediakit-mediaserver-git
pkgver=r3998.bd7982ec
pkgrel=1
pkgdesc="An high-performance, enterprise-level streaming media server based on C++11."
arch=(x86_64)
url="https://github.com/ZLMediaKit/ZLMediaKit/"
license=('MIT')
makedepends=(cmake gcc openssl ffmpeg libsrtp)
source=(
    "git+https://github.com/ZLMediaKit/ZLMediaKit.git"
)
sha256sums=(SKIP)

prepare() {
    cd $srcdir/$_repo_name
    git submodule update --init
    sed -i 's/set(CMAKE_BUILD_TYPE "Debug")/set(CMAKE_BUILD_TYPE "Release")/' CMakeLists.txt
}
pkgver() {
    cd ${srcdir}/$_repo_name
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
    cd $srcdir/$_repo_name
    cmake .
    make MediaServer
}

package() {
    cd $srcdir/..
    install -Dm644 "zlmediaserver.service" "$pkgdir/usr/lib/systemd/system/zlmediaserver.service"
    cd "$srcdir/$_repo_name/"
    install -Dm755 "release/linux/Release/MediaServer" "$pkgdir/usr/bin/MediaServer"
    mkdir -p $pkgdir/var/log/zlmediaserver/
    sed -i 's/.\/www\/snap\//' 'release/linux/Release/config.ini'
    echo '##IF YOU WANT TO CHANGE TLS CERT,PLEASE EDIT SERVICE FILE' >> 'release/linux/Release/config.ini'
    install -Dm644 "release/linux/Release/config.ini" "$pkgdir/etc/ZLMediaKit/config.ini"
    install -Dm644 "default.pem" "$pkgdir/etc/ZLMediaKit/default.pem"
}

