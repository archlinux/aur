# Maintainer: Alexandre Iooss <alexandre.iooss@gmail.com>

pkgname=libarsdk3-git
pkgver=r22.305521e
pkgrel=5
pkgdesc="ARSDK3 C librairies to control Parrot devices"
arch=(x86_64)
url="http://developer.parrot.com/"
license=('custom')
groups=()
depends=(curl
         ffmpeg
         uthash
         libardiscovery-git
         libarmavlink-git
         libarmedia-git
         libarnetworkal-git
         libarnetwork-git
         libarsal-git
         libarstream2-git
         libarstream-git)
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
        '0002-products-Remove-libs_and_samples.patch'
        '0003-libARController-Fix-json-c.patch'
        '0004-libARController-Fix-uthash-path.patch'
        '0005-libARUpdater-Fix-json-c.patch'
        'local-dependencies-atom.mk'
        'Config-linux-config.h'
        'LICENSE')
sha256sums=('SKIP'
            'd5171cbf0c7385e608423a7ac426dbf017442a4625c5315cd3d7a75223354aad'
            'be3a8dda1aaff595656cd41c4c54dd939457217f05746f2d518bde6332216d8b'
            'be1bf8b1b8a4105d30a494b03cda6679d44ea207516bae03d9e5913882dd203f'
            '8c18e3bb918323b0445935649d60f95c6f2759173e881c5ea0d9dc51c07e3fdf'
            '69cbcc090ec8356adbd57461ef58c3b1fe18699647779232673315bce5663c72'
            '177305249ca17839bd590a287c7a4cb1abec721a95b85dc5505801f05becf877'
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
	patch -p1 -i "$srcdir/0002-products-Remove-libs_and_samples.patch"
	patch -p1 -i "$srcdir/0003-libARController-Fix-json-c.patch"
	patch -p1 -i "$srcdir/0004-libARController-Fix-uthash-path.patch"
	patch -p1 -i "$srcdir/0005-libARUpdater-Fix-json-c.patch"

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
