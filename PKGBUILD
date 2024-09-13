# Maintainer:  Michael (https://aur.archlinux.org/account/michael_wzq)
pkgname=iqmol-git
pkgver=v3.1.4.r1.gacfac32
pkgver() {
  cd IQmol3 || exit 1
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
pkgrel=1
pkgdesc="A molecular editor and visualization package with Q-Chem integration"
arch=('x86_64')
url="http://iqmol.org/"
license=('GPL-3.0-only')
groups=()
depends=(
	'gcc-libs'
	'glibc'
	'glu'
	'libglvnd'
	'libqglviewer-qt5'
	'libssh2'
	'openbabel-git'
	'openmesh'
	'qt5-base'
	'yaml-cpp'
)
makedepends=(
	'boost'
	'cairo'
	'cmake'
	'doxygen'
	'eigen'
	'gcc-fortran'
	'git'
	'glu'
	'libqglviewer-qt5'
	'libssh2'
	'maeparser'
	'openbabel2'
	'python'
	'qt5-base'
	'rapidjson'
	'texlive-basic'
	'wxwidgets-gtk3'
	'wxwidgets-qt5'	
)
optdepends=()
provides=()
conflicts=('iqmol')
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/nutjunkie/IQmol3.git")
noextract=()
b2sums=('SKIP')

prepare() {
	patch IQmol3/CMakeLists.txt ../cmakelists-txt.patch
	patch IQmol3/src/Main/IQmolApplication.C ../src-main-iqmolapplication-c.patch
}

build() {
	cmake -B build -S IQmol3 \
		-DCMAKE_BUILD_TYPE='None' \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-Wno-dev \
		-DALLOW_DUPLICATE_CUSTOM_TARGETS='True'
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	
	# bin
	install -D -m755 "${srcdir}/build/IQmol" "${pkgdir}/usr/bin/iqmol"

	# share
	mkdir -p "${pkgdir}/usr/share/iqmol/"
	cp -dr --no-preserve='ownership' "${srcdir}/IQmol3/share/." "${pkgdir}/usr/share/iqmol/"
}
