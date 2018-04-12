# Maintainer: Alex Dewar <alex.dewar@gmx.co.uk>
pkgname=arsdk3
pkgver=3.11.1
pkgrel=1
pkgdesc="The SDK for Parrot Bebop drones"
arch=('x86_64')
url="http://developer.parrot.com/docs/SDK3/"
license=('custom')
source=('git+https://github.com/Parrot-Developers/arsdk_manifests')
md5sums=('SKIP')
makedepends=('repo' 'python' 'python2')

prepare() {
	cd "$srcdir"
	repo init -u arsdk_manifests -b refs/tags/ARSDK3_version_3_13_1 \
			--no-clone-bundle --depth=1
	repo sync
}

build() {
	"$srcdir"/build.sh -p arsdk-native -t build-sdk -j
}

package() {
	cd "$srcdir"/out/arsdk-native/staging

	_target="$pkgdir"/opt/$pkgname
	mkdir -p $_target
	install -Dm 755 native-wrapper.sh "$_target"

	cd usr
	cp -r bin include lib "$_target"

	cd share
	mkdir -p "$pkgdir"/usr/share
	cp -r mavlink "$pkgdir"/usr/share/mavlink
	mkdir "$_target"/share
	cp -r aclocal "$_target"/share/aclocal

	# simplify directory structure, but add symlinks for compatibility
	cd "$_target"
	ln -s . usr
	mkdir -p out/arsdk-native
	ln -s ../.. out/arsdk-native/staging

	# install license
	install -Dm 644 "$srcdir"/packages/ARSDKBuildUtils/LICENSE.md "$pkgdir"/usr/share/licenses/LICENSE

	# fix up hard-coded paths
	cd $_target
	_srcpath=`realpath "${srcdir}/out/arsdk-native/staging/usr"`
	sed -i "s|$_srcpath|/opt/$pkgname|g" bin/curl-config
	sed -i "s|`realpath "${srcdir}/out/arsdk-native/staging/"`|/opt/$pkgname|g" bin/curl-config
	for f in lib/pkgconfig/*; do
		sed -i "s|$_srcpath|/opt/$pkgname|g" "$f"
	done
}
