
pkgname=uefi-sdk-git
pkgver=2.0.0.r1.g543c791
pkgrel=1
pkgdesc="UEFI SDK based on EDK II to make UEFI application development easy"
arch=(any)
url="https://github.com/davispuh/UEFI-SDK"
license=(
  Apache-2.0
  BSD-2-Clause-Patent
  MIT
  UNLICENSE
)
makedepends=(
  acpica
  git
  util-linux-libs
  nasm
  clang
  cmake
)
options=(!buildflags)
source=(
  git+https://github.com/davispuh/UEFI-SDK.git
  edk2::git+https://github.com/tianocore/edk2.git
  edk2-libc::git+https://github.com/tianocore/edk2-libc.git
  openssl::git+https://github.com/openssl/openssl.git  # also submodule for libspdm
  cryptography::git+https://github.com/pyca/cryptography.git  # submodule for openssl
  krb5::git+https://github.com/krb5/krb5.git  # submodule for openssl
  gost-engine::git+https://github.com/gost-engine/engine.git  # submodule for openssl
  libprov::git+https://github.com/provider-corner/libprov.git  # submodule for gost-engine
  wycheproof::git+https://github.com/google/wycheproof.git  # submodule for openssl
  berkeley-softfloat-3::git+https://github.com/ucb-bar/berkeley-softfloat-3.git
  edk2-cmocka::git+https://github.com/tianocore/edk2-cmocka.git
  oniguruma::git+https://github.com/kkos/oniguruma.git
  brotli::git+https://github.com/google/brotli.git
  jansson::git+https://github.com/akheron/jansson.git
  googletest::git+https://github.com/google/googletest.git  # also a submodule for public-mipi-sys-t
  edk2-subhook::git+https://github.com/tianocore/edk2-subhook.git
  pylibfdt::git+https://github.com/devicetree-org/pylibfdt.git
  public-mipi-sys-t::git+https://github.com/MIPI-Alliance/public-mipi-sys-t.git
  pugixml::git+https://github.com/zeux/pugixml.git  # submodule for public-mipi-sys-t
  mbedtls::git+https://github.com/Mbed-TLS/mbedtls.git  # also submodule for libspdm
  libspdm::git+https://github.com/DMTF/libspdm.git
  cmocka::git+https://gitlab.com/cmocka/cmocka.git  # submodule for libspdm
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "${srcdir}/UEFI-SDK"
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
  local submodule

  cd "$srcdir/edk2"

  git submodule init
  git config submodule.CryptoPkg/Library/OpensslLib/openssl.url ../openssl
  git config submodule.UnitTestFrameworkPkg/Library/CmockaLib/cmocka.url ../edk2-cmocka
  git config submodule.MdeModulePkg/Universal/RegularExpressionDxe/oniguruma.url ../oniguruma
  git config submodule.MdeModulePkg/Library/BrotliCustomDecompressLib/brotli.url ../brotli
  git config submodule.BaseTools/Source/C/BrotliCompress/brotli.url ../brotli
  git config submodule.RedfishPkg/Library/JsonLib/jansson.url ../jansson
  git config submodule.UnitTestFrameworkPkg/Library/GoogleTestLib/googletest.url ../googletest
  git config submodule.UnitTestFrameworkPkg/Library/SubhookLib/subhook.url ../edk2-subhook
  git config submodule.MdePkg/Library/BaseFdtLib/libfdt.url ../pylibfdt
  git config submodule.MdePkg/Library/MipiSysTLib/mipisyst.url ../public-mipi-sys-t
  git config submodule.CryptoPkg/Library/MbedTlsLib/mbedtls.url ../mbedtls
  git config submodule.SecurityPkg/DeviceSecurity/SpdmLib/libspdm.url ../libspdm
  git -c protocol.file.allow=always submodule update

  # submodule setup for CryptoPkg/Library/OpensslLib/openssl
  submodule=CryptoPkg/Library/OpensslLib/openssl
  git -C $submodule submodule init
  git -C $submodule config submodule.pyca.cryptography.url "$srcdir/cryptography"
  git -C $submodule config submodule.krb5.url "$srcdir/krb5"
  git -C $submodule config submodule.gost-engine.url "$srcdir/gost-engine"
  git -C $submodule config submodule.wycheproof.url "$srcdir/wycheproof"
  git -C $submodule -c protocol.file.allow=always submodule update

  # submodule setup for CryptoPkg/Library/OpensslLib/openssl/gost-engine
  submodule=CryptoPkg/Library/OpensslLib/openssl/gost-engine
  git -C $submodule submodule init
  git -C $submodule config submodule.libprov.url "$srcdir/libprov"
  git -C $submodule -c protocol.file.allow=always submodule update

  # submodule setup for MdePkg/Library/MipiSysTLib/mipisyst
  submodule=MdePkg/Library/MipiSysTLib/mipisyst
  git -C $submodule submodule init
  git -C $submodule config submodule.external/pugixml.url "$srcdir/pugixml"
  git -C $submodule config submodule.external/googletest.url "$srcdir/googletest"
  git -C $submodule -c protocol.file.allow=always submodule update

  # submodule setup for SecurityPkg/DeviceSecurity/SpdmLib/libspdm
  submodule=SecurityPkg/DeviceSecurity/SpdmLib/libspdm
  git -C $submodule submodule init
  git -C $submodule config submodule.os_stub/openssllib/openssl.url "$srcdir/openssl"
  git -C $submodule config submodule.os_stub/mbedtlslib/mbedtls.url "$srcdir/mbedtls"
  git -C $submodule config submodule.unit_test/cmockalib/cmocka.url "$srcdir/cmocka"
  git -C $submodule -c protocol.file.allow=always submodule update
}


build() {
  cd "$srcdir/UEFI-SDK"
  cmake -G Ninja -DCMAKE_TOOLCHAIN_FILE=./uefi-toolchain.cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DFETCHCONTENT_FULLY_DISCONNECTED=ON -DFETCHCONTENT_SOURCE_DIR_EDK2=../edk2 -DFETCHCONTENT_SOURCE_DIR_EDK2-LIBC=../edk2-libc -S . -B ../build
  cmake --build ../build
}

package() {
  cd "$srcdir/build"
  DESTDIR="$pkgdir" cmake --install .
}
