# Maintainer: Alexandre Iooss <alexandre.iooss@gmail.com>

# Everything works except libARController because of uthash
# The Parrot's uthash seems to be patched a lot, if you know what to do, please help

pkgname=libarsdk3-git
pkgver=r22.305521e
pkgrel=1
pkgdesc="ARSDK3 C librairies to control Parrot devices"
arch=(x86_64)
url="http://developer.parrot.com/"
license=('custom')
groups=()
depends=(curl json-c avahi ffmpeg uthash)
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
        'LICENSE')
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

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
	mkdir "$srcdir/packages/ArchlinuxLibs"
	cp "$srcdir/local-dependencies-atom.mk" "$srcdir/packages/ArchlinuxLibs/atom.mk"
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
