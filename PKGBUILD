# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=xemu
pkgname=$_pkgname-git
pkgver=0.5.4.r21.gf03015e20e
pkgrel=1
pkgdesc="Original Xbox emulator (fork of XQEMU)"
arch=('x86_64')
url="https://xemu.app/"
license=('GPL2')
depends=('sdl2')
makedepends=('git' 'glib2' 'glu' 'gtk3' 'libepoxy' 'libpcap' 'libsamplerate' 'libslirp' 'meson' 'ninja' 'openssl' 'pixman' 'python' 'xxhash')
provides=("$_pkgname")
conflicts=("$_pkgname")
install=$_pkgname.install
source=(
	'git+https://github.com/epezent/implot.git'
	'git+https://github.com/mborgerson/xemu.git'
	'git+https://github.com/ocornut/imgui.git'
	'git+https://gitlab.com/qemu-project/berkeley-softfloat-3.git'
	'git+https://gitlab.com/qemu-project/berkeley-testfloat-3.git'
	'git+https://gitlab.com/qemu-project/keycodemapdb.git'
	'unbundle-xxhash.patch'
)
b2sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'61cd11e6d3a50df9f885155a5847dc4c9b4e8c3a2fd3fb6cd2c207374554a849e49cda3cf80ac700c32d4638925fb715895238ac5d9963a4e9ff67999e54f713'
)

pkgver() {
	cd $_pkgname
	git describe --long | sed 's/^xemu-v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd $_pkgname
	git submodule init tests/fp/berkeley-{soft,test}float-3 ui/{imgui,implot,keycodemapdb}
	git config submodule.tests/fp/berkeley-softfloat-3.url ../berkeley-softfloat-3
	git config submodule.tests/fp/berkeley-testfloat-3.url ../berkeley-testfloat-3
	git config submodule.ui/imgui.url ../imgui
	git config submodule.ui/implot.url ../implot
	git config submodule.ui/keycodemapdb.url ../keycodemapdb
	git submodule update
	patch -Np1 < ../unbundle-xxhash.patch
	python scripts/gen-license.py > XEMU_LICENSE
}

build() {
	cd $_pkgname
	./configure \
		--audio-drv-list="sdl" \
		--enable-slirp=system \
		--extra-cflags="-DXBOX=1" \
		--target-list=i386-softmmu \
		--with-git-submodules=ignore
	make qemu-system-i386
}

package() {
	depends+=('libgdk-3.so' 'libglib-2.0.so' 'libgobject-2.0.so' 'libgtk-3.so' 'libpcap.so' 'libpixman-1.so' 'libsamplerate.so' 'libslirp.so')
	cd $_pkgname
	# shellcheck disable=SC2154
	install -Dm755 build/qemu-system-i386 "$pkgdir"/usr/bin/$_pkgname
	install -Dm644 ui/xemu.desktop "$pkgdir"/usr/share/applications/$_pkgname.desktop
	for size in 24 32 48 256 512; do
		install -Dm644 ui/icons/xemu_${size}x${size}.png "$pkgdir"/usr/share/icons/hicolor/${size}x${size}/apps/$_pkgname.png
	done
	install -Dm644 ui/icons/xemu.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg
	install -Dm644 XEMU_LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
