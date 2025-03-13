# Maintainer:  Michael (https://aur.archlinux.org/account/michael_wzq)
# Contributor: Eric Berquist <eric DOT berquist AT gmail>
# shellcheck disable=SC2034,SC2154

pkgname=iqmol-git
pkgver=v3.1.4.r2.g91ea521
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
provides=('iqmol')
conflicts=('iqmol' 'iqmol-bin')
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/nutjunkie/IQmol3.git"
	"iqmol.png"
	"iqmol.desktop"
	"CMakeLists.patch"
	"src-main-iqmolapplication-c.patch")
noextract=()
b2sums=('SKIP'
	'71e913daa9032326153f0af6fcd320718d9d6ad4487e1d5e4cca28d89b6311282c43fbb28cd89c9cb7ed9531ba1e552d7107c50518ca917177919b564a347c04'
	'c852ea5ab5673435647df0a016bb74234e3a3767c6425f8bb05aad1a11e02ddf2f752db0aee3d4346c3372b3b0e4491c2cba9afa1a882cbb84721b4b81034b35'
	'b15062d2fd0782759a465416b8e7b3276d5c80ad2d0d5afd95450be4ac5dc7a33c3cc41af2a79b3d623dce431aa190b9ccce2f4aa7de3940d8ebd799c8475ef4'
	'3fb49dd834a93abdb32eee1bdb3a46985989f2e2c013f4a86d8e0b89de052155465d11911140e2e882ce12d2627cae93adbf35e72597cce0452f25a54f781a2e')

prepare() {
	patch --forward -i "CMakeLists.patch" "IQmol3/CMakeLists.txt"
	patch --forward -i "src-main-iqmolapplication-c.patch" "IQmol3/src/Main/IQmolApplication.C"
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
	rm "${pkgdir}/usr/share/iqmol/man/man7/iqmol.7.gz"

	# man
	mkdir -p "${pkgdir}/usr/share/man/man7/"
	install -Dm644 "${srcdir}/IQmol3/share/man/man7/iqmol.7.gz" "${pkgdir}/usr/share/man/man7/"

	install -Dm644 "iqmol.png" "${pkgdir}/usr/share/pixmaps/iqmol.png"
	install -Dm644 "iqmol.desktop" "${pkgdir}/usr/share/applications/iqmol.desktop"
}
