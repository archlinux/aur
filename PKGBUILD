# Maintainer: Iru Cai <mytbk920423@gmail.com>
# Maintainer: phoepsilonix <phoepsilonix@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Paul Préfontaine <paul+archlinuxaur@prefontaine.name>
# Contributor: HLFH
# Contributor: Wilhelm Schuster <wilhelm [aT] wilhelm [.] re>
# Contributor: The_Decryptor

pkgname=h2o-git
pkgver=2.2.0.7218
pkgrel=1
pkgdesc="Optimized HTTP server with support for HTTP/1.x and HTTP/2"
arch=('i686' 'x86_64' 'aarch64')
# if you want websocket support, you'll also need aur/wslay
depends=('libuv' 'zlib' 'libwslay' 'libcap' 'brotli' 'bcc' 'sh' 'glibc' 'gcc-libs' 'openssl')
makedepends=('bison' 'cmake' 'libtool' 'make' 'pkg-config' 'ruby')
url="https://github.com/h2o/h2o"
license=('MIT')
options=('lto')

_commit=9d3f45e09da05858737790fb9acb7cb8b9e9e443
source=(git+https://github.com/h2o/h2o.git?commit=${_commit}?signed
	'h2o.service')
sha256sums=('SKIP'
            '7fccdeb1a89134b48674764dc243f8967eb1234679e401af93e210fbf0934b62')
backup=('etc/h2o.conf')
provides=('h2o' 'libh2o')
conflicts=('h2o' 'libh2o')

pkgver() {
	cd "$srcdir/h2o"
	git describe --tags | sed -e 's/^v//g' -e 's/-g.*$//g' -e 's/-/./g'
}

prepare() {
	cd "$srcdir/h2o"

        git submodule update --init --recursive
	# set CMake minimal version to 3.9 to set CMP0039 to new
	sed -i 's/VERSION 2.8.11/VERSION 3.9/g' CMakeLists.txt

	sed -i 's|example|/usr/share/doc/h2o/example|' examples/h2o/h2o.conf

        if [[ "$CC" == "clang" ]] ;then
            export LD=clang
        fi

        cmake \
                -DCMAKE_BUILD_TYPE=Release \
                -DCMAKE_INSTALL_PREFIX=/usr \
                -DCMAKE_INSTALL_LIBDIR=/usr/lib \
                -DCMAKE_INSTALL_SYSCONFDIR=/etc \
                -DCMAKE_LINKER="$LD" \
                -DCMAKE_C_FLAGS="$CPPFLAGS $CLAGS" \
                -DCMAKE_CXX_FLAGS="$CPPFLAGS $CXXFLAGS" \
                -DCMAKE_EXE_LINKER_FLAGS="$LDFLAGS" \
                -DCMAKE_MODULE_LINKER_FLAGS="$LDFLAGS" \
                -DWITH_MRUBY=on \
                -DWITHOUT_LIBS=off \
                -DWITH_H2OLOG=on \
                -DBUILD_SHARED_LIBS=on \
                -DOPENSSL_ROOT_DIR=/usr/lib/ \
                .
}

build() {
	cd "$srcdir/h2o"
        if [[ "$CC" == "clang" ]] ;then
            export LD=clang
        fi
	make -j
}

package() {
	cd "$srcdir/h2o"

	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/h2o-git/LICENSE"
	install -Dm 644 "$srcdir/h2o.service" "$pkgdir/usr/lib/systemd/system/h2o.service"
	install -Dm 644 examples/h2o/h2o.conf "$pkgdir/etc/h2o.conf"
	make DESTDIR="$pkgdir" install
}
