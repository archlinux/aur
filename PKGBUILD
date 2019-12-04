# Maintainer: Alex Dewar <alex.dewar@gmx.co.uk>
pkgname=arsdk3
pkgver=3.14.0
pkgrel=5
pkgdesc="The SDK for Parrot Bebop drones"
arch=('x86_64')
url="http://developer.parrot.com/docs/SDK3/"
license=('custom')
source=('git+https://github.com/Parrot-Developers/arsdk_manifests')
options=(!emptydirs staticlibs)
md5sums=('SKIP')
makedepends=('repo' 'python' 'python2')

prepare() {
	cd "$srcdir"
	repo init -u arsdk_manifests -b 4b50e865427e6f2f2f19be1d4c55ab87a03b804a \
			--no-clone-bundle --depth=1
	repo sync
}

build() {
	"$srcdir"/build.sh -p arsdk-native -t build-sdk -j
}

package() {
	cd "$srcdir"/out/arsdk-native/staging

	_target="$pkgdir"/opt/$pkgname
	install -d $_target
	install -Dm 755 native-wrapper.sh "$_target"

	cd usr
	cp -r bin include lib "$_target"

	cd share
	install -d "$pkgdir"/usr/share
	cp -r mavlink "$pkgdir"/usr/share/mavlink
	mkdir "$_target"/share
	cp -r aclocal "$_target"/share/aclocal

	# simplify directory structure, but add symlinks for compatibility
	cd "$_target"
	ln -s . usr
	install -d out/arsdk-native
	ln -s ../.. out/arsdk-native/staging

	# install license
	install -Dm 644 "$srcdir"/packages/ARSDKBuildUtils/LICENSE.md "$pkgdir"/usr/share/licenses/LICENSE

	# copy samples
	install -d samples
	cp -r "$srcdir"/packages/Samples/Unix/* samples

	# fix up hard-coded paths
	cd $_target
	_srcpath=`realpath "${srcdir}/out/arsdk-native/staging/usr"`
	sed -i "s|$_srcpath|/opt/$pkgname|g" bin/curl-config
	sed -i "s|`realpath "${srcdir}/out/arsdk-native/staging/"`|/opt/$pkgname|g" bin/curl-config
	for f in lib/pkgconfig/*; do
		sed -i "s|$_srcpath|/opt/$pkgname|g" "$f"
	done

    # set ARSDK_ROOT environment variable
    install -d "${pkgdir}"/etc/profile.d
    echo export ARSDK_ROOT=/opt/arsdk3 > "${pkgdir}"/etc/profile.d/arsdk3.sh
}
