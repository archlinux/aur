# Maintainer: Mika Hyttinen <mika dot hyttinen+arch ät gmail dot com>
pkgname=cellframe-node
pkgver=5.7.0
pkgrel=3
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
            '4930420b4921791b0d14c1e5ce1630c79a9dc3114a89d0f7d4327b611028ff29'
            'd2b4ab803ca9df63052b4c3ae85c469271abd1257ce6d463ac280b7363e1dec3'
            '5fab0cfadc8366ebd2be9d06ff36dbd3a84b18f679ea3babb3c739e7e13acefd'
            '50e65fe5407024a71c2fa27d379901ece965e0fb788070665cf3a194b402d901'
            '23ac94f40a185dcd829bd71220056c0591cf50e640b787ec26bb832c3de6f055'
            '9b7be4cb912290ed1164dbc3c5f6714c5a9525cc41a4d7ba3115cdbe312a9320'
            'a6b504ce331ef5953f38db6f2b3c18c3d5ed796eed29381bbe76a931cf3f9fa5')
source=(git+https://gitlab.demlabs.net/cellframe/$pkgname.git#commit=880a51eda17b797298a5389c8387c9ae6d0e9483
		https://pub.cellframe.net/python/python-cellframe/pycfhelpers/master/pycfhelpers-1.0.6-py3-none-any.whl
		https://pub.cellframe.net/python/python-cellframe/pycftools/master/pycftools-1.0.0-py3-none-any.whl
		cellframe-node.logrotate
		cellframe-node.service
		cellframe-node-asan.service
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
}

build() {
	if [ -n "$CELLFRAME_ASAN" ]; then
		cp "$srcdir/$pkgname-asan.service" "$srcdir/$pkgname/dist.linux/share/$pkgname.service"
	else
		cp "$srcdir/$pkgname.service" "$srcdir/$pkgname/dist.linux/share/$pkgname.service"
	fi

	cd "$pkgname"

	if [ -n "$CELLFRAME_DEBUG" ]; then
		BUILD_TYPE="Debug"
	else
		BUILD_TYPE="RelWithDebInfo"
	fi

	if [ -n "$CELLFRAME_NO_OPTIMIZATION" ]; then
		if [ -n "$CELLFRAME_ASAN" ]; then
			echo ":: Building with Address Sanitizer (ASAN) enabled, without optimization..."
			cmake -B build \
				-DDAP_CRYPTO_XKCP_PLAINC=ON \
				-DCMAKE_BUILD_TYPE=Debug \
				-DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
				-DCMAKE_C_FLAGS="-Wno-error=incompatible-pointer-types -fsanitize=address -fsanitize-address-use-after-scope -fno-omit-frame-pointer -fno-common -O1" \
				-DCMAKE_LINKER_FLAGS="-fsanitize=address" \
				-Wno-dev
		else
			echo ":: Building without optimization..."
			cmake -B build \
				-DDAP_CRYPTO_XKCP_PLAINC=ON \
				-DCMAKE_BUILD_TYPE=$BUILD_TYPE \
				-DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
				-DCMAKE_C_FLAGS="-Wno-error=incompatible-pointer-types" \
				-DCELLFRAME_NO_OPTIMIZATION=OFF \
				-Wno-dev
		fi
	elif [ -n "$CELLFRAME_ASAN" ]; then
		echo ":: Building with Address Sanitizer (ASAN) enabled..."
		cmake -B build \
			-DCMAKE_BUILD_TYPE=Debug \
			-DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
			-DCMAKE_C_FLAGS="-Wno-error=incompatible-pointer-types -fsanitize=address -fsanitize-address-use-after-scope -fno-omit-frame-pointer -fno-common -O1" \
			-DCMAKE_LINKER_FLAGS="-fsanitize=address" \
			-DCELLFRAME_NO_OPTIMIZATION=OFF \
			-Wno-dev \
			-Wno-error=incompatible-pointer-types
	else
		echo ":: Building with normal optimization..."
		cmake -B build \
			-DCMAKE_BUILD_TYPE=$BUILD_TYPE \
			-DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
			-DCELLFRAME_NO_OPTIMIZATION=OFF \
			-DCMAKE_C_FLAGS="-Wno-error=incompatible-pointer-types" \
			-Wno-dev \
			-Wno-error=incompatible-pointer-types
	fi

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
