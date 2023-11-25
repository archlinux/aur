# Maintainer: Reinhold Gschweicher <pyro4hell@gmail.com>
pkgname=infinisim-git
pkgver=v1.13.0.r13.g43880fd
pkgrel=1
pkgdesc="Simulator for InfiniTime user interface without needing a PineTime "
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/InfiniTimeOrg/InfiniSim"
license=('GPL')
groups=()
depends=('sdl2')
makedepends=('git' 'cmake' 'npm') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=()
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=(
	"${pkgname}::git+https://github.com/InfiniTimeOrg/InfiniSim.git"
	"git+https://github.com/InfiniTimeOrg/InfiniTime.git"
	"git+https://github.com/lvgl/lv_drivers.git"
	"git+https://github.com/InfiniTimeOrg/lvgl.git"
	"git+https://github.com/littlefs-project/littlefs.git"
	"git+https://github.com/laurencelundblade/QCBOR.git"
	"git+https://github.com/kosme/arduinoFFT.git"
)
noextract=()
md5sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	)

pkgver() {
# Git, tags available
	cd "$pkgname"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/${pkgname}"
	# install lv_font_conv dependency to local directory
	npm install lv_font_conv@1.5.2
	git submodule init
	git config submodule.lv_drivers.url "$srcdir/lv_drivers"
	git config submodule.InfiniTime.url "$srcdir/InfiniTime"
	git -c protocol.file.allow=always submodule update
	cd "$srcdir/${pkgname}/InfiniTime"
	git config submodule.src/libs/lvgl.url "${srcdir}/lvgl"
	git config submodule.src/libs/littlefs.url "${srcdir}/littlefs"
	git config submodule.src/libs/QCBOR.url "${srcdir}/QCBOR"
	git config submodule.src/libs/arduinoFFT.url "${srcdir}/arduinoFFT"
	git -c protocol.file.allow=always submodule update --init src/libs/lvgl
	git -c protocol.file.allow=always submodule update --init src/libs/littlefs
	git -c protocol.file.allow=always submodule update --init src/libs/QCBOR
	git -c protocol.file.allow=always submodule update --init src/libs/arduinoFFT
}

build() {
	cd "$srcdir/${pkgname}"
	cmake -S . -B "build" -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE=RelWithDebInfo
	cmake --build "build"
}

package() {
	cd "$srcdir/${pkgname}"
	DESTDIR="${pkgdir}" cmake --build "build" --target install
}
