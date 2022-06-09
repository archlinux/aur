# Maintainer: silverhikari <kerrickethan@gmail.com>
pkgname=inform7-ide-git
pkgver=0.5.r728.ge6ded50f
pkgrel=2
pkgdesc="a ide for the inform language/compiler"
arch=(x86_64)
url="https://github.com/ptomato/inform7-ide"
license=('GPL3')
depends=('libcanberra' 'python-virtualenv' 'libxml2' 'libgl' 'glibc' 'goocanvas2' 'webkit2gtk' 'gtksourceview4' 'gspell' 'libplist' 'desktop-file-utils' 'gstreamer' 'gst-plugins-bad' 'gst-plugins-good' 'gtk3' 'libratify-git' 'libchimara-git' 'rsync' 'vala')
makedepends=('meson' 'ninja')
provides=('inform7-ide')
options=(!buildflags !makeflags)
source=("git+https://github.com/ptomato/inform7-ide" "git+https://github.com/ganelson/inweb" "git+https://github.com/ganelson/intest" "git+https://github.com/ganelson/inform")
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
install "${srcdir}/inform7-ide/build-aux/make-integration-settings.mk" "${srcdir}/make-integration-settings.mk"

#setting up inweb build enviroment
install -D "inweb/Materials/platforms/linux.mk" "inweb/platform-settings.mk"
install -D "inweb/Materials/platforms/inweb-on-linux.mk" "inweb/inweb.mk"
make -f "inweb/inweb.mk" "initial"

#setting up intest build enviroment
inweb/Tangled/inweb intest -prototype "intest/scripts/intest.mkscript" -makefile "intest/intest.mk"
make -f "intest/intest.mk" "force"

#setting up inform build enviroment and installing retrospective and tools for inform7-ide build
cd "inform"
../inweb/Tangled/inweb -prototype "scripts/inform.mkscript" -makefile "makefile"
make "makers"
make "forcetools"
make "forcekits"
make "forceextensions"
make "localintegration"
make -f "inform6/inform6.mk" "interpreters"
make "forceintegration" "retrospective"
cp -r "retrospective" -t "${srcdir}/inform7-ide"

#building inform7-ide
cd "${srcdir}/inform7-ide/"
arch-meson build
ninja -C build
}

check() {
	cd "inform"
	"../intest/Tangled/intest" inform7 -show Acidity
}

package() {
# packaging inform7-ide
cd "${srcdir}/inform7-ide/"
meson install -C build --destdir "$pkgdir"
}
