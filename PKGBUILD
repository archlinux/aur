# Maintainer: ahmetlii
pkgname='organicmaps-git'
pkgver='2022.11.24_3'
pkgrel='2'
pkgdesc='A free offline maps app for travelers, tourists, hikers, and cyclists based on top of crowd-sourced OpenStreetMap data'
arch=("x86_64")
depends=("cmake>=3.22.1" "qt5-base" "clang" "ninja" "python3")
optdepends=("ccache")
makedepends=("git" "gendesk")
license=("Apache")
url="https://github.com/organicmaps/organicmaps"
conflicts=("${pkgname%-git}-bin")

prepare() {
 git clone --recurse-submodules --depth=1 https://github.com/organicmaps/organicmaps.git ./organicmaps-git
 cd $pkgname
 bash ./configure.sh
}

build() {
 echo "Select option:"
 echo "1. Compile with one core (recommended)"
 echo "2. Compile with disabled Unity Builds"
 echo "1/2 (default=1)"
 read -r $ans
 if [ ${ans} -e 1 ]
  then
  $srcdir/$pkgname/tools/unix/build_omim.sh -n 1 -r desktop
  else if [ ${ans} -e 2 ]
  then
  $srcdir/$pkgname/tools/unix/build_omim.sh -r desktop -DUNITY_DISABLE=ON
  else
  $srcdir/$pkgname/tools/unix/build_omim.sh -n 1 -r desktop
 fi
fi
}

package() {
 mkdir -p "$pkgdir/usr/share" "$pkgdir/usr/lib" "$pkgdir/usr/bin" "$pkgdir/usr/bin/${pkgname%-git}" "$pkgdir/usr/share/${pkgname%-git}"
 cp -r "$srcdir/$pkgname/data" "$pkgdir/usr/share/${pkgname%-git}"
 cp "$srcdir/omim-build-release/OMaps" "$srcdir/OMaps"
 install -Dm644 "$srcdir/omim-build-release/OMaps.app/Contents/Resources/mac.icns" "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"
 cp -r "${srcdir}/omim-build-release" "${pkgdir}/usr/lib/${pkgname%-git}"
 gendesk -f --pkgname "$pkgname" --pkgdesc "$pkgdesc" --exec "/usr/bin/${pkgname%-git}/OMaps --data_path=/usr/share/${pkgname%-git}/" --name "OrganicMaps" --icon="/usr/share/pixmaps/${pkgname%-git}.png" --categories="Utility;Maps;Navigation" --startupnotify=true
 install -Dm755 "$srcdir/OMaps" "$pkgdir/usr/bin/${pkgname%-git}"
 install -Dm644 "organicmaps.desktop" -t "$pkgdir/usr/share/applications"
 rm -rf "${pkgdir}/usr/lib/${pkgname%-git}/OMaps"
 rm "${pkgdir}/usr/lib/${pkgname%-git}/data"
 find  "$pkgdir/usr/lib/${pkgname%-git}" -type d -maxdepth 1 -mindepth 1 -print0 | xargs -0 ln -s -t "$pkgdir/usr/bin/${pkgname%-git}"
 ln -sf "$pkgdir/usr/share/${pkgname%-git}/data" "$pkgdir/usr/bin/${pkgname%-git}/data"
}
