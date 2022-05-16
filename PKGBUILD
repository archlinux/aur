# Maintainer: silverhikari <kerrickethan@gmail.com>
pkgname=inform7-ide-git
pkgver=0.5.r724.gd4b9b79c
pkgrel=1
pkgdesc="a ide for the inform language/compiler"
arch=(x86_64)
url="https://github.com/ptomato/inform7-ide"
license=('GPL3')
depends=('libcanberra' 'ninja' 'python-virtualenv' 'libxml2' 'libgl' 'glibc' 'goocanvas2' 'webkit2gtk' 'gtksourceview4' 'gspell' 'libplist' 'desktop-file-utils' 'gstreamer' 'gst-plugins-bad' 'gst-plugins-good')
makedepends=('meson')
provides=('inform7-ide')
source=("git+https://github.com/ptomato/inform7-ide" "git+https://github.com/ganelson/inweb" "git+https://github.com/ganelson/intest" "git+https://github.com/ganelson/inform")
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
install "${srcdir}/inform7-ide/build-aux/make-integration-settings.mk" "${srcdir}/make-integration-settings.mk"
install -d "${srcdir}/inform7-ide/retrospective"
bash "inweb/scripts/first.sh" "linux"
bash "intest/scripts/first.sh"
cd "inform"
bash "scripts/first.sh"
make "integration" "retrospective"
cd "retrospective"
cp -r "6L02" "6L38" "6M62" "retrospective.txt" -t "${srcdir}/inform7-ide/retrospective"
cd "${srcdir}/inform7-ide/"
meson --prefix=/usr build
ninja -C build
}

package() {
cd "${srcdir}/inform7-ide/"
meson install -C build --destdir "$pkgdir"
}
