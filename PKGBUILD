# Maintainer: ahmetlii
pkgname='organicmaps-git'
pkgver='2022.11.24_3'
pkgrel='4'
pkgdesc='A free offline maps app for travelers, tourists, hikers, and cyclists based on top of crowd-sourced OpenStreetMap data'
arch=("x86_64" "ARM") #ARM untested, but the binary includes compatibility
depends=("cmake>=3.22.1" "qt5-base" "clang" "ninja" "python3")
optdepends=("ccache")
makedepends=("git" "gendesk" "libxml2")
license=("Apache")
url="https://github.com/organicmaps/organicmaps"
conflicts=("${pkgname%-git}-bin")

prepare() {
 git clone --recurse-submodules --depth=1 https://github.com/organicmaps/organicmaps.git ./organicmaps-git
 cd $pkgname
 bash ./configure.sh
}

pkgver() {
 cd $pkgname
 xmllint --xpath "string(//releases/release/@version)"  "${srcdir}/${pkgname}/packaging/app.organicmaps.desktop.metainfo.xml"
}

build() {
  $srcdir/$pkgname/tools/unix/build_omim.sh -n 1 -r desktop #pass option -DUNITY_DISABLE=1 if running into free memory issues, remove option -n 1 if not having problems with multi-core compiling
}

package() {
 install -dm755 "$pkgdir/usr/share/${pkgname%-git}"
 cp -r "$srcdir/$pkgname/data" "$pkgdir/usr/share/${pkgname%-git}"
 install -dm777 "$pkgdir/usr/share/organicmaps/data/221119" #needs to be changed manually every time the upstream has a new release
 install -Dm644 "$srcdir/omim-build-release/OMaps.app/Contents/Resources/mac.icns" "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"
 gendesk -f --pkgname "$pkgname" --pkgdesc "$pkgdesc" --exec "/usr/bin/OMaps --data_path=/usr/share/${pkgname%-git}/data" --name "OrganicMaps" --icon="/usr/share/pixmaps/${pkgname%-git}.png" --categories="Utility;Maps;Navigation" --startupnotify=true
 install -Dm755 "$srcdir/omim-build-release/OMaps" "$pkgdir/usr/bin/OMaps"
 install -Dm644 "organicmaps.desktop" -t "$pkgdir/usr/share/applications"
}
