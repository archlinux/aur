# Maintainer: Your Name <youremail@domain.com>
pkgname=inform7-ide
pkgver=2.0.0
_informpkgver=10.1.2
_inwebpkgver=7.2.0
_intestpkgver=2.1.0
pkgrel=1
pkgdesc="a ide for the inform language/compiler"
arch=('x86_64')
url="https://github.com/ptomato/inform7-ide"
license=('GPL3')
depends=('libcanberra' 'python-virtualenv' 'libxml2' 'libgl' 'glibc' 'goocanvas2' 'webkit2gtk' 'gtksourceview4' 'gspell' 'libplist' 'desktop-file-utils' 'gstreamer' 'gst-plugins-bad' 'gst-plugins-good' 'gtk3' 'libratify-git' 'libchimara-git' 'rsync' 'vala')
makedepends=('meson' 'ninja')
provides=('inform7-ide')
conflicts=('inform7-ide')
options=(!buildflags !makeflags)
source=("inform7-ide-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz" "inform-${_informpkgver}.tar.gz::https://github.com/ganelson/inform/archive/refs/tags/v${_informpkgver}.tar.gz" "inweb-${_inwebpkgver}.tar.gz::https://github.com/ganelson/inweb/archive/refs/tags/v${_inwebpkgver}.tar.gz" "intest-${_intestpkgver}.tar.gz::https://github.com/ganelson/intest/archive/refs/tags/v${_intestpkgver}.tar.gz")
sha256sums=('67cb1f571c8c811e8b45371886960392802ea6e8a34e6602867f5ee133e15457' '145cae27638c2dde4979f37b67d60de3243f6ee6456b808426fb9dcbda850dd0' '0fa772ed3b2e7c7242be6dbfad319bc213f49881eba56549248f90ea1a47fbcf' '3a5c86005212b3aa68064e133abed54529a83c7c6963a845afadbcc7db1d647e')

prepare() {
cd ${srcdir}

if [[ -d inform7-ide ]]
then
  rm -r "inform7-ide"
else
  mv "inform7-ide-${pkgver}" "inform7-ide"
fi

if [[ -d inform ]]
then
  rm -r "inform"
else
  mv "inform-${_informpkgver}" "inform"
fi

if [[ -d inweb ]]
then
  rm -r "inweb"
else
  mv "inweb-${_inwebpkgver}" "inweb"
fi

if [[ -d intest ]]
then
  rm -r "intest"
else
  mv "intest-${_intestpkgver}" "intest"
fi

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

make "forcetransfertools"
make "forcetransferpreform"
make "forcetransferindext"
make "forcetransferkits"
make "forcetransferextensions"
make "forcetransferlanguages"
make "forcetransferimages"
make "forcetransferotherinternals"
make "forcetransferdocumentation"
make "forcetransferoutcomepages"
make "forcetransfertemplates"

make "retrospective"
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
