# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=apotris
pkgname=$_pkgname-git
pkgver=3.4.6.r648.g7cb1d73
pkgrel=1
pkgdesc="A block stacking puzzle game for the Game Boy Advance (Linux port)"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://apotris.com/"
license=('GPL-3.0-only')
depends=('bash' 'glibc' 'libopenmpt' 'sdl2')
makedepends=('git' 'libmodplug' 'meson' 'python' 'sdl2_mixer' 'xxd')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=(
	"$_pkgname::git+https://gitea.com/akouzoukos/apotris.git#branch=ports"
	'soloud::git+https://github.com/akouzoukos/soloud.git'
	'Tilengine::git+https://github.com/akouzoukos/Tilengine.git'
	'apotris.sh'
	'apotris-install.patch'
	'apotris-use-system-libs.patch'
	'soloud-use-system-libs.patch'

)
b2sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'6a5b652537461135895820391beb20bb2e64e312f08ddbd9ea8d313047118693556df26e89019e81b26c6650388597eebbc8ae4cf824739aadb41121d728ed80'
	'3af6d3c3b5434720fa7b4adce00f3e3ede6bfaa3824dd86372bacbfd101f84941ff30d969c6c40fa125d38870c4ed47aa0f1b9ce9701114d07290017338d3d4a'
	'3ef703d45b06cac59768c0e36ed09fe8238aef03d8a51893707aaf91c0efeb5518276e4985a0efc0bcec2370ce4abe1c7494a87327723779f0689550ebd9a8f6'
	'1c92929a34ddf8c85572c3f0ef02ba7310cb85e5b6f0f3f852aa069d340b11b25608d388a94df15ec5558243105b632fe48ce090f18a4d5e924473e1436bb7e7'
)

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd $_pkgname
	git config submodule.subprojects/SoLoud.url ../soloud
	git config submodule.tilengine.url ../Tilengine
	git -c protocol.file.allow=always submodule update
	patch -Np1 < ../apotris-use-system-libs.patch
	patch -Np1 < ../apotris-install.patch
	sed -i "s|assets|/usr/share/$_pkgname/&|" source/{audio_files,liba_window}.cpp
	sed -i 's/data_/apotris_&/' tools/callBin2S.py
	cd subprojects/SoLoud
	patch -Np1 < ../../../soloud-use-system-libs.patch
}

build() {
	arch-meson -D b_lto=false build-linux $_pkgname
	meson compile -C build-linux
}

package() {
	# shellcheck disable=SC2154
	meson install -C build-linux --destdir "$pkgdir"
	install -Dm755 $_pkgname.sh "$pkgdir"/usr/bin/$_pkgname
}
