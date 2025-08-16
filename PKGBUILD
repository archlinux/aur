# Maintainer: FirstAirBender <noblechuk5[at]web[dot]de>
# Contributor: Aleksey Filippov <sarum9in@gmail.com>
# Contributor: Friedrich Weber <fred@reichbier.de>

pkgname=czmq
pkgver=4.2.1
pkgrel=4
pkgdesc="High-level C Binding for ZeroMQ"
arch=('i686' 'x86_64')
url="http://czmq.zeromq.org"
license=('MPL2')
provides=('czmq' 'libczmq.so')
depends=('zeromq' 'curl' 'lz4' 'libmicrohttpd' 'systemd-libs' 'util-linux-libs')
makedepends=('pkg-config' 'cmake')
sha256sums=('83457cd32a2c2615b8d7ebcf91b198cb0d8df383a2072b96835ab250164d8a83')
source=("https://github.com/zeromq/czmq/archive/v${pkgver}.tar.gz")

build() {
	msg2 'Building...'
	cmake -B build -S "$pkgname-$pkgver" \
		-DCZMQ_BUILD_STATIC:BOOL='OFF' \
		-DCZMQ_WITH_NSS:BOOL='OFF' \
		-DCMAKE_BUILD_TYPE:STRING='None' \
		-DCMAKE_SKIP_INSTALL_RPATH:BOOL='YES' \
		-DCMAKE_INSTALL_PREFIX:PATH='/usr' \
		-DBUILD_TESTING:BOOL='ON' \
		-DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
		-Wno-dev
	cmake --build build
}

check() {
	msg2 'Running tests...'
	ctest --test-dir build --output-on-failure
}

package() {
	msg2 'Installing...'
	DESTDIR="$pkgdir" cmake --install build
	cd "$pkgname-$pkgver"

	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/czmq"

	# For some reason, CMAKE installation also includes
	# many files that are not needed. The following line
	# removes them. See https://github.com/microsoft/vcpkg/pull/24434/files
	rm -f "${pkgdir}/usr/include/"{readme.txt,sha1.h,sha1.inc_c,slre.h,slre.inc_c,zgossip_engine.inc,zgossip_msg.h,zhash_primes.inc,zsock_option.inc}
}
