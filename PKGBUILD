# Maintainer: ahmetlii
pkgname='organicmaps-git'
pkgver='2022.11.24_3'
pkgrel='1'
pkgdesc='A free offline maps app for travelers, tourists, hikers, and cyclists based on top of crowd-sourced OpenStreetMap data'
arch=("x86_64")
depends=("cmake>=3.22.1" "qt5-base" "clang" "ninja" "python3")
optdepends=("ccache")
makedepends=("git" "gendesk")
license=("Apache")
url="https://github.com/organicmaps/organicmaps"

prepare(){
git clone --recurse-submodules --depth=1 https://github.com/organicmaps/organicmaps.git ./organicmaps-git #one-off build
cd $pkgname
bash ./configure.sh
}

build() {
$srcdir/$pkgname/tools/unix/build_omim.sh -n 1 -r desktop #only one processor to avoid kernel panic/running out of mem
}

package(){
 cd $srcdir/omim-build-release
 install -dm755 "${pkgdir}/usr/lib/${pkgname%-git}"
 mkdir -p "${pkgdir}/usr/bin"
 cp -r "${srcdir}/omim-build-release" "${pkgdir}/usr/bin/organicmaps"
 gendesk -f --pkgname "$pkgname" --pkgdesc "$pkgdesc" --exec "${pkgdir}/usr/bin/organicmaps/OMaps" --name "OrganicMaps" --icon="${srcdir}/omim-build-release/OMaps.app/Contents/Resources/mac.icns"
 install -Dm644 "$srcdir/omim-build-release/OMaps.app/Contents/Resources/mac.icns" "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"
 install -Dm755 "$srcdir/omim-build-release/OMaps" "$pkgdir/usr/bin/${pkgname%-git}"
 install -Dm644 "organicmaps.desktop" -t "$pkgdir/usr/share/applications"
 install -dm755 "${pkgdir}/usr/bin" "organicmaps"

 }

