# Maintainer: WickedWizard3588 <coding.exhibiting@slmails.com>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: txtsd <aur.archlinux@ihavea.quest>
# Contributor: Elijah Gregg <lovetocode999 at tilde dot team>
# Contributor: Lenny McLennington <lennymclennington@protonmail.com>
# Contributor: Miko <mikoxyzzz@gmail.com>
# Contributor: Cheru Berhanu <aur attt cheru doot dev>

_pkgname=prismlauncher
pkgname=${_pkgname}-cracked
pkgver=6.3
pkgrel=1
pkgdesc="Cracked Minecraft launcher with ability to manage multiple instances."
arch=('i686' 'x86_64' 'aarch64')
url="https://prismlauncher.org"
license=('GPL3')
depends=('java-runtime' 'libgl' 'qt6-base' 'qt6-5compat' 'qt6-svg' 'qt6-imageformats' 'zlib' 'hicolor-icon-theme' 'quazip-qt6' 'cmark' 'tomlplusplus')
provides=('prismlauncher')
conflicts=('prismlauncher' 'prismlauncher-git')
makedepends=('cmake' 'extra-cmake-modules' 'git' 'java-environment' 'scdoc' 'ghc-filesystem' 'gamemode-git')
optdepends=('glfw: to use system GLFW libraries'
			'openal: to use system OpenAL libraries'
			'visualvm: Profiling support'
			'xorg-xrandr: for older minecraft versions'
)
# options=(debug)
source=("git+https://github.com/PrismLauncher/PrismLauncher.git"
		"git+https://github.com/PrismLauncher/libnbtplusplus.git")
sha256sums=('SKIP'
			'SKIP')

pkgver() {
	cd "PrismLauncher"
	git describe --tags $(git rev-list --tags --max-count=1)
}

prepare() {
	cd "PrismLauncher"
	git checkout $(git describe --tags $pkgver)

	git submodule init
	git config submodule.libraries/cmark.active false
	git config submodule.libraries/extra-cmake-modules.active false
	git config submodule.libraries/filesystem.active false
	git config submodule.libraries/libnbtplusplus.url "${srcdir}/libnbtplusplus"
	git config submodule.libraries/quazip.active false
	git config submodule.libraries/tomlplusplus.active false
	git config submodule.libraries/zlib.active false
	git -c protocol.file.allow=always submodule update

	git apply ../../Cracked.diff
}

build() {
	cmake -DCMAKE_BUILD_TYPE= \
		-DCMAKE_INSTALL_PREFIX="/usr" \
		-DLauncher_APP_BINARY_NAME="${_pkgname}" \
		-DLauncher_QT_VERSION_MAJOR="6" \
		-Bbuild -SPrismLauncher

	cmake --build build
}

check() {
	cd "build"
	ctest .
}

package() {
	cd "build"
	DESTDIR="${pkgdir}" cmake --install .
}
