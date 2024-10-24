# Maintainer: Mika Hyttinen <mika dot hyttinen+arch ät gmail dot com>
pkgname=cellframe-node
pkgver=5.3.r3032.a018d95
pkgrel=1
pkgdesc='Cellframe blockchain node with a powerful SDK'
arch=('x86_64' 'aarch64')
url='https://cellframe.net'
license=('LGPL3')
makedepends=(git cmake python3 libxslt)
depends=(logrotate libxcrypt-compat)
provides=('cellframe-node' 'cellframe-node-cli' 'cellframe-node-tool' 'cellframe-node-config')
replaces=('cellframe-node-debug')
source=(git+https://gitlab.demlabs.net/cellframe/$pkgname.git#commit=a018d95af6b9a909959a668f89bdc437c72b95af
		cellframe-node.logrotate
		cellframe-node.service
		cellframe-node-asan.service
		cellframe-node-tmpfiles.conf
		cellframe-node-sysusers.conf)
md5sums=('SKIP'
		'a10650eb138f6fe0c4bbefa6557ffb4f'
        '4bf9cc7596903ffa5aba7fa7922d9016'
        'da837da689d3741cae9366eefc86d9b3'
        'e334310bf6cd6c4bbe612733eee928e0'
        'ecead745d3492224d2a5a2f7d9d561b0')
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
				-DCMAKE_C_FLAGS="-Wno-error=incompatible-pointer-types -fsanitize=address -fsanitize-address-use-after-scope -fno-omit-frame-pointer -fno-common -O1" \
				-DCMAKE_LINKER_FLAGS="-fsanitize=address" \
				-Wno-dev
		else
			echo ":: Building without optimization..."
			cmake -B build \
				-DDAP_CRYPTO_XKCP_PLAINC=ON \
				-DCMAKE_BUILD_TYPE=$BUILD_TYPE \
				-DCMAKE_C_FLAGS="-Wno-error=incompatible-pointer-types" \
				-DCELLFRAME_NO_OPTIMIZATION=OFF \
				-Wno-dev
		fi
	elif [ -n "$CELLFRAME_ASAN" ]; then
		echo ":: Building with Address Sanitizer (ASAN) enabled..."
		cmake -B build \
			-DCMAKE_BUILD_TYPE=Debug \
			-DCMAKE_C_FLAGS="-Wno-error=incompatible-pointer-types -fsanitize=address -fsanitize-address-use-after-scope -fno-omit-frame-pointer -fno-common -O1" \
			-DCMAKE_LINKER_FLAGS="-fsanitize=address" \
			-DCELLFRAME_NO_OPTIMIZATION=OFF \
			-Wno-dev
	else
		echo ":: Building with normal optimization..."
		cmake -B build \
			-DCMAKE_BUILD_TYPE=$BUILD_TYPE \
			-DCMAKE_C_FLAGS="-Wno-error=incompatible-pointer-types" \
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
	install -Dm644 "$srcdir/$pkgname.logrotate" "$pkgdir/etc/logrotate.d/$pkgname"
	install -Dm644 "$srcdir/$pkgname-tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
	install -Dm644 "$srcdir/$pkgname-sysusers.conf" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

	for _executables in cellframe-node-cli cellframe-node-tool cellframe-node cellframe-node-config; do
		ln -sf "/opt/cellframe-node/bin/$_executables" "$pkgdir/usr/bin/$_executables"
	done
}
