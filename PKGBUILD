# Maintainer: Husam Bilal <husam212@gmail.com>
# Contributer: Manuel <manuel.bua@gmail.com>

pkgname=komorebi
pkgver=2.0
pkgrel=1
pkgdesc="Parallax backgrounds manager"
url="https://github.com/iabem97/komorebi"
depends=("desktop-file-utils" "glib2>=2.38" "gtk3>=3.14" "hicolor-icon-theme" "libgtop" "libgee" "libwnck")
makedepends=("git" "cmake" "vala" "gendesk")
provides=("komorebi")
license=("GPL")
arch=("x86_64" "i686")
md5sums=("0c72498a4c0c10b00c50fad1ef2f6195")
source=("https://github.com/iabem97/${pkgname}/archive/v${pkgver}.tar.gz")

prepare() {
  gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --exec="/usr/bin/komorebi"
  gendesk -f -n --pkgname "$pkgname-wallpaper-creator" --pkgdesc "$pkgdesc (wallpaper creator)" --exec="/usr/bin/komorebi-wallpaper-creator"
}

build() {
  _base_dir="${srcdir}/${pkgname}-${pkgver}"
  cd "$_base_dir"

  sed -i '/$ENV{HOME}/d' CMakeLists.txt
  find . -type f -exec sed -i 's|/System/Applications/|/usr/bin/|g' {} \;
  find . -type f -exec sed -i 's|/System/Resources/|/usr/share/|g' {} \;

  mkdir -p "$_base_dir/build"
  cd "$_base_dir/build"

  cmake "$_base_dir"
  make
}

package() {
  _base_dir="${srcdir}/${pkgname}-${pkgver}"

  cd "$_base_dir/build"
  make DESTDIR="$pkgdir/" install

  install -Dm644 "$_base_dir/data/Icons/komorebi.svg" "${pkgdir}/usr/share/pixmaps/${pkgname}.svg"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
