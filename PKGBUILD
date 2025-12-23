pkgname=ot-br-posix-git
pkgver=20250612.r230.gafd7593
pkgrel=1
pkgdesc="OpenThread Border Router, a Thread border router for POSIX-based platforms."
arch=('x86_64')
url='https://github.com/openthread/ot-br-posix.git'
license=('BSD-3-Clause')
depends=(
	systemd-libs
)
makedepends=(
	git
	cmake
	ninja
	mbedtls
	cjson
	gtest
	)
source=(
	git+https://github.com/openthread/ot-br-posix.git
	git+https://github.com/openthread/openthread.git
	git+https://github.com/Mbed-TLS/mbedtls.git
	git+https://github.com/Mbed-TLS/mbedtls-framework.git
	git+https://github.com/yhirose/cpp-httplib.git
	fix-build.patch
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '494e9af44403b3fa2e13dc46a961770ed8615785f95d711aaea269abde419bca')

prepare() {
  cd ot-br-posix
  cat ../fix-build.patch | patch -p1

  git rm third_party/cJSON/repo
  git submodule init
  git config 'submodule.third_party/cpp-httplib/repo.url' "$srcdir/cpp-httplib"
  git config 'submodule.third_party/openthread/repo.url' "$srcdir/openthread"
  git -c protocol.file.allow=always submodule update

  cd third_party/openthread/repo
  git submodule init
  git config 'submodule.third_party/mbedtls/repo.url' "${srcdir}"/mbedtls
  git -c protocol.file.allow=always submodule update

  cd third_party/mbedtls/repo
  git submodule init
  git config submodule.framework.url "${srcdir}"/mbedtls-framework
  git -c protocol.file.allow=always submodule update
}

pkgver() {
  cd ot-br-posix
  git describe --long --abbrev=7 | sed 's/^thread-reference-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local cmake_options=(
    -B builddir
    -G Ninja
    -S ot-br-posix
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D BUILD_SHARED_LIBS=OFF
    -D OTBR_INFRA_IF_NAME="wlan0"
    -D OTBR_VENDOR_NAME="OpenThread"
    -D OTBR_PRODUCT_NAME="BorderRouter"
    -D OTBR_MDNS="openthread"
    -D OTBR_RADIO_URL="spinel+hdlc+uart:///dev/ttyACM0"
    -D OTBR_DOC=OFF
  )
  cmake "${cmake_options[@]}"
  cmake --build builddir
}

package() {
  DESTDIR="$pkgdir" cmake --install builddir
  mv "${pkgdir}"/usr/sbin ${pkgdir}/usr/bin
  install -Dm644 ot-br-posix/LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
