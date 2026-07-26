pkgname=wine-dwproton
pkgver=11.0
pkgrel=9
pkgdesc="dwproton的wine版"
url="https://dawn.wine/dawn-winery/wine-dwproton"
arch=("x86_64")
provides=(
  "wine=$pkgver"
  "wine-staging=$pkgver"
  "wine-wow64=$pkgver"
  "wine-dwproton=$pkgver"
)
conflicts=("wine")
source=(
    "git+https://dawn.wine/dawn-winery/wine-dwproton#branch=dwproton/$pkgver-$pkgrel"
    https://github.com/irtkll/wine-proton-patch/raw/main/恢复字体.patch
    https://github.com/irtkll/wine-proton-patch/raw/main/还原部分wine功能.patch
    https://github.com/irtkll/wine-proton-patch/raw/main/修复任务栏的图标问题.patch
    https://github.com/NelloKudo/spritz-wine/raw/master/patches/0001-spritz/0003-programs-Add-Steam.exe-stub-from-Proton.patch
)
sha256sums=('SKIP'
            '1650786c3c108841371b39edcc2868ea56b4cf4f8c57320f4a49c79ed49a687e'
            '5fc91749290610be0f313ab8c1b110ead12715e68447484198a38990cda661ae'
            '53c071efa60bf49b5c646d787d7f090cf97ffbe28c9aebdbe78daace34f8c4cc'
            '1e0ef2d38a64608773a80eae333abcaabe8be4bb9763524e15bea592d82c3556')
prepare(){
    cd "$pkgname"
    for src in "${source[@]}"; do
        src="${src%%::*}"
        src="${src##*/}"
        src="${src%.zst}"
        [[ $src = *.patch ]] || continue
        msg2 "应用补丁 $src..."
        git apply -p1 -C1 < "../$src" || msg2 "应用补丁 $src 失败，但继续进行..."
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
