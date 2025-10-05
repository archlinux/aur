# Maintainer: silverhikari <kerrickethan@gmail.com>
pkgname=inform7-ide-git
pkgver=2.0.0.r178.g4dcec50e
pkgrel=2
pkgdesc="a ide for the inform language/compiler"
arch=(x86_64)
url="https://github.com/ptomato/inform7-ide"
license=('GPL-3.0-or-later')
depends=('libcanberra' 'python-virtualenv' 'libxml2' 'libgl' 'glibc' 'goocanvas2' 'webkit2gtk' 'gtksourceview4' 'gspell' 'libplist' 'desktop-file-utils' 'gstreamer' 'gst-plugins-bad' 'gst-plugins-good' 'gtk3' 'libratify-git' 'libchimara-git' 'rsync' 'vala' 'clang')
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

export CC=clang

install "${srcdir}/inform7-ide/build-aux/make-integration-settings.mk" "${srcdir}/make-integration-settings.mk"

#setting up inweb build enviroment
install -D "inweb/Materials/platforms/linux.mk" "inweb/platform-settings.mk"
install -D "inweb/Materials/platforms/inweb-on-linux.mk" "inweb/inweb.mk"
make -f "inweb/inweb.mk" "initial"

#setting up intest build enviroment
inweb/Tangled/inweb make-makefile intest -script "intest/scripts/intest.mkscript" -to "intest/intest.mk"
make -f "intest/intest.mk" "force"

#setting up inform build enviroment and installing retrospective and tools for inform7-ide build
cd "inform"
../inweb/Tangled/inweb make-makefile -script "scripts/inform.mkscript" -to "makefile"
make "makers"
make "forcetools"
make "forcekits"
make "localintegration"
make -f "inform6/inform6.mk" "interpreters"

make "forcetransfertools"
make "forcetransferpreform"
make "forcetransferindext"
make "forcetransferkits"
make "forcetransferextensions"
make "forcetransferinwebresources"
make "forcetransferimages"
make "forcetransferotherinternals"
make "forcetransferdocumentation"
make "forcetransferoutcomepages"
make "forcetransfertemplates"
make "forcetransferdelia"

make "retrospective"
cp -r "retrospective" -t "${srcdir}/inform7-ide"

#building inform7-ide
cd "${srcdir}/inform7-ide/"
CC=clang arch-meson build
 meson compile -C build
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
