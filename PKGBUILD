# Maintainer: Reinhold Gschweicher <pyro4hell@gmail.com>
pkgname=infinisim-git
pkgver=r31.7110fa0
pkgrel=1
pkgdesc="Simulator for InfiniTime user interface without needing a PineTime "
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/InfiniTimeOrg/InfiniSim"
license=('GPL')
groups=()
depends=('sdl2')
makedepends=('git' 'cmake') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=()
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=(
	"${pkgname}::git+https://github.com/InfiniTimeOrg/InfiniSim.git"
	"git+https://github.com/InfiniTimeOrg/InfiniTime.git"
	"git+https://github.com/glennrp/libpng.git"
	"git+https://github.com/lvgl/lv_drivers.git"
	"git+https://github.com/joaquimorg/lvgl.git"
	"git+https://github.com/laurencelundblade/QCBOR.git"
)
noextract=()
md5sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	)

pkgver() {
	cd "$srcdir/${pkgname}"

# Git, tags available
#	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname}"
	git submodule init
	git config submodule.InfiniTime.url "$srcdir/InfiniTime"
	git config submodule.libpng.url "$srcdir/libpng"
	git config submodule.lv_drivers.url "$srcdir/lv_drivers"
	git submodule update
	cd "$srcdir/${pkgname}/InfiniTime"
	git config submodule.src/libs/lvgl.url "${srcdir}/lvgl"
	git config submodule.src/libs/QCBOR.url "${srcdir}/QCBOR"
	git submodule update --init src/libs/lvgl
	git submodule update --init src/libs/QCBOR
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
