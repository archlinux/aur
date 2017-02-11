# Maintainer: Husam Bilal <husam212@gmail.com>

pkgname=komorebi
pkgver=0.9.2
pkgrel=1
pkgdesc="Parallax backgrounds manager"
url="https://github.com/iabem97/komorebi"
depends=("desktop-file-utils" "glib2>=2.38" "gtk3>=3.14" "hicolor-icon-theme" "libgtop")
makedepends=("git" "cmake" "vala" "gendesk")
provides=("komorebi")
license=("GPL")
arch=("x86_64" "i686")
md5sums=("aeff3ba89bea015d2a179180aa6f8470")
source=("https://github.com/iabem97/${pkgname}/archive/${pkgver}.tar.gz")

prepare() {
  gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --exec="/usr/bin/komorebi"
}

build() {
  _base_dir="${srcdir}/${pkgname}-${pkgver}"

  cd "$_base_dir"
  sed -i '/$ENV{HOME}/d' CMakeLists.txt
  sed -i 's|/System/Applications/|/usr/bin/|g' CMakeLists.txt
  sed -i 's|/System/Resources/|/usr/share/|g' CMakeLists.txt
  sed -i 's|/System/Resources/|/usr/share/|g' src/OnScreen/InfoBox.vala
  sed -i 's|/System/Resources/|/usr/share/|g' src/OnScreen/BackgroundWindow.vala
  sed -i 's|/System/Resources/|/usr/share/|g' src/OnScreen/PreferencesWindow.vala

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
