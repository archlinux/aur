# Maintainer: Alexandre Iooss <alexandre.iooss@gmail.com>

# Everything works except libARController because of uthash
# The Parrot's uthash seems to be patched a lot, if you know what to do, please help

pkgname=libarsdk3-git
pkgver=r22.305521e
pkgrel=2
pkgdesc="ARSDK3 C librairies to control Parrot devices"
arch=(x86_64)
url="http://developer.parrot.com/"
license=('custom')
groups=()
depends=(curl json-c avahi ffmpeg uthash libarsal-git)
optdepends=()
makedepends=(git repo python2-virtualenv)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('arsdk_manifests::git+https://github.com/Parrot-Developers/arsdk_manifests'
        '0001-arsdk_manifests-Remove-libs_and_samples.patch'
        '0002-Use-local-json-and-curl.patch'
        '0003-Fix-json-c.patch'
        '0004-libARController-Fix-uthash-path.patch'
        '0005-libARDiscovery-Fix-some-warnings.patch'
        'local-dependencies-atom.mk'
        'Config-linux-config.h'
        'LICENSE')
sha256sums=('SKIP'
            'c5132126585bfce6f2b5ca2e4fa0494a2f389e2c431060041346eca4eddf8d09'
            'ab927129737e5db58f0f86ef6df5ec1cb86bf2b20f146b8d2658b756d6e3ee19'
            '0b630509176de0ceb48480cde0489095fd58632abeded9e7211de706ab20c926'
            '2a103ea898e987ee5dfdb111e2dd594ec432e9262db1ba8fdd68ba095ad01857'
            '82268abab9af48726993b82c7c9ab9a978c13cbddd4ecc4ab4588c0f4e323cc8'
            '1d41f55e8b86dff248579bacd0f1edb49e3bb643a44fe41ade0e150ff3abb375'
            '5956b54ef47ad26df51991a4aa7002abdcb524a51b455d040f55b4d11a4f44a7'
            '1771e95329e9cb2bed04e023e330af3d558d0f13c0c1c5de0581f2880f149deb')

pkgver() {
	cd "$srcdir/arsdk_manifests"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	# Clean
	rm -rf "$srcdir/.repo" "$srcdir/packages" "$srcdir/products"

	# Init repo
	cd "$srcdir/"
	repo init -u "$srcdir/arsdk_manifests"

	# Remove unused libs and samples from manifest
	patch -p1 -i "$srcdir/0001-arsdk_manifests-Remove-libs_and_samples.patch"

	# Download the sdk
	repo sync

	# Patch files
	patch -p1 -i "$srcdir/0002-Use-local-json-and-curl.patch"
	patch -p1 -i "$srcdir/0003-Fix-json-c.patch"
	patch -p1 -i "$srcdir/0004-libARController-Fix-uthash-path.patch"
	patch -p1 -i "$srcdir/0005-libARDiscovery-Fix-some-warnings.patch"

	# Add build settings to use archlinux libs
	mkdir -p "$srcdir/packages/ArchlinuxLibs/Config/linux"
	cp "$srcdir/local-dependencies-atom.mk" "$srcdir/packages/ArchlinuxLibs/atom.mk"
	cp "$srcdir/Config-linux-config.h" "$srcdir/packages/ArchlinuxLibs/Config/linux/config.h"
}

build() {
	virtualenv2 venv
	source venv/bin/activate
	./build.sh -p arsdk-native -t build-sdk -j
}

package() {
	cp -r "$srcdir/out/arsdk-native/staging/"* "$pkgdir"

	# Clean
	rm -f "$pkgdir/native-wrapper.sh"
	rm -rf "$pkgdir/etc"
	rm -rf "$pkgdir/usr/include/x86_64-pc-linux-gnu"

	# Install license
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	cp "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
