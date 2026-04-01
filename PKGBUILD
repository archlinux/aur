# Maintainer: Mika Hyttinen <mika dot hyttinen+arch ät gmail dot com>
pkgname=cellframe-node
pkgver=5.7.31
pkgrel=1
pkgdesc='Cellframe blockchain node with a powerful SDK'
arch=('x86_64' 'aarch64')
url='https://cellframe.net'
license=('LGPL-3.0-or-later')
makedepends=(git cmake libxslt)
depends=(libxcrypt-compat gcc-libs glibc sqlite python3)
optdepends=('logrotate: For using logrotate to rotate log files')
provides=('cellframe-node' 'cellframe-node-cli' 'cellframe-node-tool' 'cellframe-node-config')
replaces=('cellframe-node-debug')
sha256sums=('SKIP'
            'aa4d7955f11237b26fc33de444547b3125f07cae957c489c5baacbf3e67ccd14'
            'd2b4ab803ca9df63052b4c3ae85c469271abd1257ce6d463ac280b7363e1dec3'
            '5fab0cfadc8366ebd2be9d06ff36dbd3a84b18f679ea3babb3c739e7e13acefd'
            '50e65fe5407024a71c2fa27d379901ece965e0fb788070665cf3a194b402d901'
            '9b7be4cb912290ed1164dbc3c5f6714c5a9525cc41a4d7ba3115cdbe312a9320'
            'a6b504ce331ef5953f38db6f2b3c18c3d5ed796eed29381bbe76a931cf3f9fa5')
source=(git+https://gitlab.demlabs.net/cellframe/$pkgname.git#commit=4699999cc69dc5275750238579046a30588bd55c
		https://pub.cellframe.net/python/python-cellframe/pycfhelpers/master/pycfhelpers-1.0.11-py3-none-any.whl
		https://pub.cellframe.net/python/python-cellframe/pycftools/master/pycftools-1.0.0-py3-none-any.whl
		cellframe-node.logrotate
		cellframe-node.service
		cellframe-node-tmpfiles.conf
		cellframe-node-sysusers.conf)
options=(!debug !strip)
install=$pkgname.install
_executables=("$pkgname-cli" "$pkgname-tool" "$pkgname" "$pkgname-config")

prepare() {
	local patchver="${pkgver##*.}"
	sed -i "s|^VERSION_PATCH=.*|VERSION_PATCH=$patchver|" "$srcdir/$pkgname/version.mk"
	sed -i 's|url = \.\./\.\./|url = https://gitlab.demlabs.net/|g' "$srcdir/$pkgname/.gitmodules"
	sed -i 's|url = \.\./|url = https://gitlab.demlabs.net/cellframe/|g' "$srcdir/$pkgname/.gitmodules"
	cd "$pkgname" && git submodule update --init --recursive --progress
	find "$srcdir/$pkgname" -name 'OS_Detection.cmake' -exec \
		sed -i '/add_compile_options(-Werror)/d' {} +
}

build() {
	cp "$srcdir/$pkgname.service" "$srcdir/$pkgname/dist.linux/share/$pkgname.service"
	cd "$pkgname"

	cmake -B build \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo \
		-DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
		-DDAP_MANAGE_CFLAGS=OFF \
		-DCELLFRAME_NO_OPTIMIZATION=OFF \
		-Wno-dev

	cmake --build build --clean-first
}

package() {
	cd "$pkgname"
	DESTDIR="$pkgdir" cmake --install build

	install -Dm644 "$srcdir/$pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 "$srcdir/$pkgname.logrotate" "$pkgdir/etc/logrotate.d/$pkgname"
	install -Dm644 "$srcdir/$pkgname-tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
	install -Dm644 "$srcdir/$pkgname-sysusers.conf" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

	install -d "$pkgdir/usr/bin"
	for executable in "${_executables[@]}"; do
		ln -sf "/opt/$pkgname/bin/$executable" "$pkgdir/usr/bin/$executable"
	done

	install -d "$pkgdir/opt/$pkgname/share/wheels/"
  	for wheel in "$srcdir"/*.whl; do
    	install -Dm644 "$wheel" "$pkgdir/opt/$pkgname/share/wheels/"
  	done
}
