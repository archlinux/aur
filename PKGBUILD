# Maintainer: Ersei <contact@ersei.net>
# Contributor: Yellow <yellow@example.com>
# Contributor: Lenny McLennington <lennymclennington@protonmail.com>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Elijah Gregg <lovetocode999@tilde.team>
# Contributor: Miko <mikoxyzzz@gmail.com>
# Contributor: Cheru Berhanu <aur attt cheru doot dev>
# Contributor: dada513 <dada513@protonmail.com>

pkgname=placeholdermc
pkgver=1.4.2
pkgrel=4
pkgdesc="Minecraft launcher with ability to manage multiple instances."
arch=('i686' 'x86_64')
url="https://github.com/PlaceholderMC/PlaceholderMC"
license=('GPL3')
provides=('polymc') # For now...
conflicts=('polymc') # For now...
depends=('java-runtime' 'libgl' 'qt6-base' 'qt6-5compat' 'qt6-svg' 'qt6-imageformats' 'zlib' 'hicolor-icon-theme' 'quazip-qt6')
makedepends=('cmake' 'extra-cmake-modules' 'git' 'java-environment' 'scdoc')
optdepends=('glfw: to use system GLFW libraries'
            'openal: to use system OpenAL libraries'
            'visualvm: Profiling support'
            'xorg-xrandr: for older minecraft versions'
)

# There are weird sources here because submodules aren't downloaded when downloading from Github tagged archive
source=("https://github.com/PlaceholderMC/PlaceholderMC/archive/refs/tags/$pkgver.tar.gz"
        "fix-qt6-4.patch::https://github.com/PlaceholderMC/PlaceholderMC/commit/7ccafdc99321e82ee0f504a573a5c978480374a2.patch"
		"https://github.com/gulrak/filesystem/archive/cd6805e94dd5d6346be1b75a54cdc27787319dd2.zip"
		"https://github.com/stachenov/quazip/archive/6117161af08e366c37499895b00ef62f93adc345.zip"
		"https://github.com/marzer/tomlplusplus/archive/4b166b69f28e70a416a1a04a98f365d2aeb90de8.zip"
		"https://github.com/PolyMC/libnbtplusplus/archive/2203af7eeb48c45398139b583615134efd8d407f.zip"
		)
sha256sums=('0b0d03df46470f4847169f4d50804f6714d1ace746b4bb31cc0b0b4dccc82ca4'
            'ea03b0bef6df242c111b19f650d9cdfdb198b10e08e6ce33b73f5de494eefd76'
			'5a3f8d89553f2ab1807efba6ca4a64531db6b262e64a7662179de4fbc98cf62d'
			'da7ec41f73e01eb51116eb5a6904f52c3143dfbcc26deb05e73902cd2d4cdccf'
			'544c84d9d7785ce8bc1d62f5c8a9df0d1d595d2be65508e7ac9aa2bd4001c015'
			'67f60dc25471b398105c29bfe0660881123bf5f303df5e28397a06137766961c'
			)

prepare() {
	# I'm sure there's a better way to clean old libraries
	rm -rf "PlaceholderMC-$pkgver/libraries/quazip"
	rm -rf "PlaceholderMC-$pkgver/libraries/tomlplusplus"
	rm -rf "PlaceholderMC-$pkgver/libraries/filesystem"
	rm -rf "PlaceholderMC-$pkgver/libraries/libnbtplusplus"
	mv quazip-6117161af08e366c37499895b00ef62f93adc345 "PlaceholderMC-$pkgver/libraries/quazip"
	mv tomlplusplus-4b166b69f28e70a416a1a04a98f365d2aeb90de8 "PlaceholderMC-$pkgver/libraries/tomlplusplus"
	mv filesystem-cd6805e94dd5d6346be1b75a54cdc27787319dd2 "PlaceholderMC-$pkgver/libraries/filesystem"
	mv libnbtplusplus-2203af7eeb48c45398139b583615134efd8d407f "PlaceholderMC-$pkgver/libraries/libnbtplusplus"

    cd "PlaceholderMC-$pkgver"

    patch -Np1 -i "../fix-qt6-4.patch"
}

build() {

  cmake -DCMAKE_BUILD_TYPE= \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DLauncher_BUILD_PLATFORM="archlinux" \
    -DLauncher_QT_VERSION_MAJOR="6" \
	-DLauncher_APP_BINARY_NAME="PlaceholderMC" \
	-DLauncher_META_URL="https://meta.scrumplex.rocks/v1/" \
	-DLauncher_NEWS_RSS_URL="" \
	-DLauncher_NEWS_OPEN_URL="" \
	-DLauncher_HELP_URL="" \
    -Bbuild -SPlaceholderMC-$pkgver
  cmake --build build
}

check() {
  cd "build"
  ctest .
}

package() {
  cd "build"
  DESTDIR="$pkgdir" cmake --install .
}
