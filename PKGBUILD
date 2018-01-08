pkgname=fastd
arch=(i686 x86_64)
pkgver=18
pkgrel=3
pkgdesc="Fast and secure tunneling daemon"

# Enabled for fast AES implementations
ENABLE_OPENSSL=1

makedepends=('cmake' 'bison' 'pkg-config')
depends=('libcap' 'gcc-libs' 'libuecc>=6' 'libsodium' 'json-c')

[ $ENABLE_OPENSSL -eq 0 ] || depends=(${depends[@]} 'openssl')

url="https://projects.universe-factory.net/projects/fastd"
license=('BSD')
source=(
	"https://projects.universe-factory.net/attachments/download/86/${pkgname}-${pkgver}.tar.xz"
	'0001-cipher-aes128-ctr-openssl-fix-compatiblity-with-Open.patch'
)
sha512sums=(
	'ec3a9f86bd539d7ffe751a81328f44671f0facca624e23ac273ac7e54da68de0dc0b50d1be490082bbb25f2896de0428802f74fc023f9acc986607875417bdae'
	'93c0e11a9d61effbd8a62e00e191e8a9bf29e39b7bb1ec2d40eb932403e679f94a106907a7dcbc89ca65e52ea3681b68961846079c179feb7ec65b261763b32e'
)


prepare() {
	cd "$srcdir/fastd-${pkgver}"
	patch -p1 < "$srcdir/0001-cipher-aes128-ctr-openssl-fix-compatiblity-with-Open.patch"
}

build() {
	mkdir -p "$srcdir/build-${pkgver}"
	cd "$srcdir/build-${pkgver}"

	opts=''
	[ $ENABLE_OPENSSL -eq 0 ] || opts="${opts} -D ENABLE_OPENSSL=ON"

	cmake \
		-D CMAKE_BUILD_TYPE=RELEASE \
		-D CMAKE_AR=/usr/bin/gcc-ar \
		-D CMAKE_NM=/usr/bin/gcc-nm \
		-D CMAKE_RANLIB=/usr/bin/gcc-ranlib \
		-D CMAKE_INSTALL_PREFIX=/usr \
		-D ENABLE_SYSTEMD=ON \
		-D ENABLE_LTO=ON \
		-D WITH_CIPHER_AES128_CTR_NACL=OFF \
		${opts} "../${pkgname}-${pkgver}"
	make
}

package() {
	cd "$srcdir/build-${pkgver}"
	make install DESTDIR="${pkgdir}"

	install -dm755 "${pkgdir}/etc/fastd/"

	install -Dm644	"$srcdir/${pkgname}-${pkgver}/COPYRIGHT" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
	install -Dm644 "$srcdir/${pkgname}-${pkgver}/doc/examples/fastd@.service" "${pkgdir}/usr/lib/systemd/system/fastd@.service"
	install -Dm644 "$srcdir/${pkgname}-${pkgver}/doc/fastd.1" "${pkgdir}/usr/share/man/man1/fastd.1"
}
