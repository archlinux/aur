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

#setting up inweb build enviroment
install -D "inweb/Materials/platforms/linux.mk" "inweb/platform-settings.mk"
cp -f "inweb/Materials/platforms/inweb-on-linux.mk" "inweb/inweb.mk"
make -f "inweb/inweb.mk" "initial"

#setting up intest build enviroment
inweb/Tangled/inweb intest -prototype "intest/scripts/intest.mkscript" -makefile "intest/intest.mk"
make -f "intest/intest.mk" "force"

#setting up inform build enviroment and installing retroppective and tools for inform7-ide build
cd "inform"
../inweb/Tangled/inweb -prototype "scripts/inform.mkscript" -makefile "makefile"
make "makers"
make "forcetools"
make "force"
make -f "inform6/inform6.mk" "interpreters"
make "integration" "retrospective"
cd "retrospective"
cp -r "6L02" "6L38" "6M62" "retrospective.txt" -t "${srcdir}/inform7-ide/retrospective"

#building inform7-ide
cd "${srcdir}/inform7-ide/"
meson --prefix=/usr build
ninja -C build
}

package() {
cd "${srcdir}/inform7-ide/"
meson install -C build --destdir "$pkgdir"
}
