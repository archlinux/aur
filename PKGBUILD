# Maintainer: Mika Hyttinen <mika dot hyttinen+arch ät gmail dot com>
pkgname=cellframe-node
pkgver=5.7.34
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
            'ff01e188b169720d6222cac739786da61496dddb7ff270d68af4b34aae4d3434'
            '5fab0cfadc8366ebd2be9d06ff36dbd3a84b18f679ea3babb3c739e7e13acefd'
            '50e65fe5407024a71c2fa27d379901ece965e0fb788070665cf3a194b402d901'
            '9b7be4cb912290ed1164dbc3c5f6714c5a9525cc41a4d7ba3115cdbe312a9320'
            'a6b504ce331ef5953f38db6f2b3c18c3d5ed796eed29381bbe76a931cf3f9fa5'
            '88c4b5f4f6907e1db8a415540dcce699b4c5ef7034b064dbe760b7f1027f4ba3')
source=(git+https://gitlab.demlabs.net/cellframe/$pkgname.git#commit=9192fdbe164bf6699b5eeb43f0e215d5bd139e8b
		https://pub.cellframe.net/python/python-cellframe/pycfhelpers/master/pycfhelpers-1.0.13-py3-none-any.whl
		cellframe-node.logrotate
		cellframe-node.service
		cellframe-node-tmpfiles.conf
		cellframe-node-sysusers.conf
		cellframe-node-cli.bash)
options=(!debug !strip)
install=$pkgname.install
_executables=("$pkgname-cli" "$pkgname-tool" "$pkgname" "$pkgname-config")

prepare() {
	local patchver="${pkgver##*.}"
	sed -i "s|^VERSION_PATCH=.*|VERSION_PATCH=$patchver|" "$srcdir/$pkgname/version.mk"
	sed -i 's|url = \.\./\.\./|url = https://gitlab.demlabs.net/|g' "$srcdir/$pkgname/.gitmodules"
	sed -i 's|url = \.\./|url = https://gitlab.demlabs.net/cellframe/|g' "$srcdir/$pkgname/.gitmodules"
	cd "$pkgname" && git submodule update --init --recursive --progress
	# temporary, remove after merge..........
	local _sdk_commit="dc2004cc32e5d3aa5d8999c0290ddd8b4c2fb96c"
	for _sdk in cellframe-sdk python-cellframe/cellframe-sdk; do
		git -C "$_sdk" fetch origin block_list_perf
		git -C "$_sdk" checkout "$_sdk_commit"
	done
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

	install -Dm644 "$srcdir/cellframe-node-cli.bash" \
		"$pkgdir/usr/share/bash-completion/completions/cellframe-node-cli"
}
