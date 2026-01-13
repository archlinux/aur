# Maintainer: yum13241 <coolcrew45 at disroot dot org>

pkgname=elyprismlauncher
pkgver=10.0.2
pkgrel=1
pkgdesc="Prism Launcher fork with integrated support for Ely.by accounts"
arch=('x86_64')
url="https://github.com/ElyPrismLauncher/ElyPrismLauncher"
license=('GPL-3.0-only AND LGPL-3.0-or-later AND LGPL-2.0-or-later AND Apache-2.0 AND MIT AND LicenseRef-Batch AND OFL-1.1')
depends=('java-runtime=17' 'libgl' 'qt6-base' 'qt6-svg' 'qt6-imageformats' 'qt6-networkauth' 'libarchive' 'zlib' 'hicolor-icon-theme' 'tomlplusplus' 'cmark' 'gcc-libs' 'glibc' 'hicolor-icon-theme' 'qrencode' 'qt6-wayland')
provides=('elyprismlauncher')
conflicts=('elyprismlauncher')
optdepends=('glfw: to use system GLFW libraries'
            'openal: to use system OpenAL libraries'
            'visualvm: Profiling support'
            'xorg-xrandr: for older minecraft versions'
            'java-runtime=8: support for Minecraft versions < 1.17'
            'flite: minecraft voice narration'
)
source=("https://github.com/ElyPrismLauncher/ElyPrismLauncher/releases/download/${pkgver}/ElyPrismLauncher-${pkgver}.tar.gz")
sha256sums=('SKIP')

build()
{
	#tar -xvf ElyPrismLauncher-${pkgver}.tar.gz --strip-components=1
	# Force SSSE3 CPU extensions maximum for better compatibility. A Minecraft launcher won't benefit much, if at all from these.
	cd ElyPrismLauncher-${pkgver}
	cmake -DCMAKE_INSTALL_PREFIX=/usr --preset linux -DCMAKE_CXX_FLAGS="-march=x86-64 -mtune=generic -mmmx -msse -msse2 -msse3 -mssse3 -mno-sse4 -mno-sse4a -mno-sse4.1 -mno-sse4.2 -mno-sse5 -mno-popcnt -mno-abm"
	cmake --build build --config Release -j$(nproc)
}

package()
{
	cd ElyPrismLauncher-${pkgver}
	DESTDIR="${pkgdir}" cmake --install build --config Release
}
