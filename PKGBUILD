pkgname=ot-commissioner-git
pkgver=20230622.r57.g46c1a00
pkgrel=1
pkgdesc="a Thread commissioner for joining new Thread devices and managing Thread networks."
arch=('x86_64')
url='https://github.com/openthread/ot-commissioner.git'
license=('BSD-3-Clause')
depends=(
	python-pexpect
	fmt
	libevent
)
makedepends=(
	git
	cmake
	ninja
	mbedtls
	nlohmann-json
	gtest
	)
source=(
	git+https://github.com/openthread/ot-commissioner.git
	git+https://github.com/Mbed-TLS/mbedtls.git
	git+https://github.com/Mbed-TLS/mbedtls-framework.git
	git+https://github.com/wgtdkp/mdns.git
	fix-build.patch
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'a1d1af95e864c71a480fe8a74957dc3963034dad446cfe4a1e9d3fe2312928e5')

prepare() {
  cd ot-commissioner
  cat ../fix-build.patch | patch -p1

  git rm third_party/{json,libevent,COSE-C,cn-cbor,fmtlib,googletest}/repo
  git submodule init
  git config 'submodule.third_party/mbedtls/repo.url' "$srcdir/mbedtls"
  git config 'submodule.third_party/mdns/repo.url' "$srcdir/mdns"
  git -c protocol.file.allow=always submodule update

  cd third_party/mbedtls/repo
  git submodule init
  git config submodule.framework.url "${srcdir}"/mbedtls-framework
  git -c protocol.file.allow=always submodule update
}

pkgver() {
  cd ot-commissioner
  git describe --long --abbrev=7 | sed 's/^thread-reference-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local cmake_options=(
    -B builddir
    -G Ninja
    -S ot-commissioner
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D BUILD_SHARED_LIBS=OFF
    -D OT_COMM_ANDROID=OFF
    -D OT_COMM_APP=ON
    -D OT_COMM_CCM=OFF
    -D OT_COMM_REFERENCE_DEVICE=OFF
    -D OT_COMM_JAVA_BINDING=OFF
    -D OT_COMM_TEST=OFF
    -D OT_COMM_WARNING_AS_ERROR=OFF
  )
  cmake "${cmake_options[@]}"
  cmake --build builddir
}

package() {
  DESTDIR="$pkgdir" cmake --install builddir
  mv "${pkgdir}"/usr/etc/* ${pkgdir}/etc/.
  rm -r "${pkgdir}"/usr/etc
  mkdir -p "${pkgdir}/usr/lib/systemd/system/"
  mv "${pkgdir}/etc/systemd"/system/* "${pkgdir}/usr/lib/systemd/system/."
  rm -r "${pkgdir}/etc/systemd"
  install -Dm644 ot-commissioner/LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
