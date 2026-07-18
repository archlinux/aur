pkgname=wine-dwproton
pkgver=11.0
pkgrel=7
pkgdesc="dwproton的wine版"
url="https://dawn.wine/dawn-winery/wine-dwproton"
arch=("x86_64")
provides=(
  "wine=$pkgver"
  "wine-staging=$pkgver"
  "wine-wow64=$pkgver"
)
conflicts=("wine")
source=(
    "git+https://dawn.wine/dawn-winery/wine-dwproton#branch=dwproton/$pkgver-$pkgrel"
    https://github.com/irtkll/wine-proton-patch/raw/main/恢复字体.patch
)
sha256sums=('SKIP'
            'e5bbe669e881d41ad0ac530903b4356ec3bbace37bed1dcaddd9c2f2a81a29df')
prepare(){
    cd "$pkgname"
    for src in "${source[@]}"; do
        src="${src%%::*}"
        src="${src##*/}"
        src="${src%.zst}"
        [[ $src = *.patch ]] || continue
        msg2 "应用补丁 $src..."
        patch -p1 -F3 < "../$src" || msg2 "应用补丁 $src 失败，但继续进行..."
    done
    ./autogen.sh
    ./configure --enable-archs=i386,x86_64 --disable-tests --prefix=/usr
}
build(){
    cd "$pkgname"
    make -j$(nproc)
}
package(){
    cd "$pkgname"
    make DESTDIR="$pkgdir" install
}
