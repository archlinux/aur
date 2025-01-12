# Maintainer: Mika Hyttinen <mika dot hyttinen+arch ät gmail dot com>
pkgname=cellframe-node
pkgver=5.3.r3184.83b5448
pkgrel=2
pkgdesc='Cellframe blockchain node with a powerful SDK'
arch=('x86_64' 'aarch64')
url='https://cellframe.net'
license=('LGPL-3.0-or-later')
makedepends=(git cmake libxslt)
depends=(qt5-declarative qt5-base libxcrypt-compat gcc-libs glibc sqlite qt5-quickcontrols2 python3)
optdepends=('logrotate: For using logrotate to rotate log files')
provides=('cellframe-node' 'cellframe-node-cli' 'cellframe-node-tool' 'cellframe-node-config')
replaces=('cellframe-node-debug')
source=(git+https://gitlab.demlabs.net/cellframe/$pkgname.git#commit=83b5448a7eac3b61676ec9c7738335ce3ea07ec5
		cellframe-node.logrotate
		cellframe-node.service
		cellframe-diagtool.service
		cellframe-node-asan.service
		cellframe-node-tmpfiles.conf
		cellframe-node-sysusers.conf
		so_reuseport_fix.patch)
md5sums=('SKIP'
         'a10650eb138f6fe0c4bbefa6557ffb4f'
         '4bf9cc7596903ffa5aba7fa7922d9016'
         'ee2424d674f7806a0a6caaff7cc5fa26'
         '3962e50d7c9c1c2b42876fa376457a44'
         'e334310bf6cd6c4bbe612733eee928e0'
         'ecead745d3492224d2a5a2f7d9d561b0'
         '1fd0d507162fa8f79afeb2f71f7d6419')
options=(!debug !strip)
install=$pkgname.install

prepare() {
	sed -i 's|url = \.\./\.\./|url = https://gitlab.demlabs.net/|g' "$srcdir/$pkgname/.gitmodules"
	sed -i 's|url = \.\./|url = https://gitlab.demlabs.net/cellframe/|g' "$srcdir/$pkgname/.gitmodules"
	cd "$pkgname" && git submodule update --init --recursive --progress
	VERSION_MAJOR=$(echo "$pkgver" | cut -d '.' -f1)
	VERSION_MINOR=$(echo "$pkgver" | cut -d '.' -f2)
	VERSION_PATCH=$(echo "$pkgver" | cut -d '.' -f3,4)
	sed -i "s|^VERSION_MAJOR=.*|VERSION_MAJOR=$VERSION_MAJOR|" "$srcdir/$pkgname/version.mk"
	sed -i "s|^VERSION_MINOR=.*|VERSION_MINOR=$VERSION_MINOR|" "$srcdir/$pkgname/version.mk"
	sed -i "s|^VERSION_PATCH=.*|VERSION_PATCH=$VERSION_PATCH|" "$srcdir/$pkgname/version.mk"
	patch -p1 < "$srcdir/so_reuseport_fix.patch"
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
				-DBUILD_DIAGTOOL=ON \
				-DDAP_CRYPTO_XKCP_PLAINC=ON \
				-DCMAKE_BUILD_TYPE=Debug \
				-DCMAKE_C_FLAGS="-fsanitize=address -fsanitize-address-use-after-scope -fno-omit-frame-pointer -fno-common -O1" \
				-DCMAKE_LINKER_FLAGS="-fsanitize=address" \
				-Wno-dev
		else
			echo ":: Building without optimization..."
			cmake -B build \
				-DBUILD_DIAGTOOL=ON \
				-DDAP_CRYPTO_XKCP_PLAINC=ON \
				-DCMAKE_BUILD_TYPE=$BUILD_TYPE \
				-DCELLFRAME_NO_OPTIMIZATION=OFF \
				-Wno-dev
		fi
	elif [ -n "$CELLFRAME_ASAN" ]; then
		echo ":: Building with Address Sanitizer (ASAN) enabled..."
		cmake -B build \
			-DBUILD_DIAGTOOL=ON \
			-DCMAKE_BUILD_TYPE=Debug \
			-DCMAKE_C_FLAGS="-fsanitize=address -fsanitize-address-use-after-scope -fno-omit-frame-pointer -fno-common -O1" \
			-DCMAKE_LINKER_FLAGS="-fsanitize=address" \
			-DCELLFRAME_NO_OPTIMIZATION=OFF \
			-Wno-dev
	else
		echo ":: Building with normal optimization..."
		cmake -B build \
			-DBUILD_DIAGTOOL=ON \
			-DCMAKE_BUILD_TYPE=$BUILD_TYPE \
			-DCELLFRAME_NO_OPTIMIZATION=OFF \
			-Wno-dev
	fi

	cmake --build build --clean-first
}

package() {
	cd "$pkgname"
	DESTDIR="$pkgdir" cmake --install build
	mkdir -p "$pkgdir/usr/bin"

	install -Dm644 "$srcdir/$pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 "$srcdir/cellframe-diagtool.service" -t "$pkgdir/usr/lib/systemd/system/"
	install -Dm644 "$srcdir/$pkgname.logrotate" "$pkgdir/etc/logrotate.d/$pkgname"
	install -Dm644 "$srcdir/$pkgname-tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
	install -Dm644 "$srcdir/$pkgname-sysusers.conf" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

	for _executables in cellframe-node-cli cellframe-node-tool cellframe-node cellframe-node-config; do
		ln -sf "/opt/cellframe-node/bin/$_executables" "$pkgdir/usr/bin/$_executables"
	done
}
