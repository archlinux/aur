# Maintainer: Sam Mulvey <archlinux@sammulvey.com>
pkgname=xen-edk2
pkgver=202502
pkgrel=1
pkgdesc="UEFI firmware for xen hypervisor from edk2"
arch=("x86_64")
url="https://github.com/tianocore/edk2"
license=(
  Apache-2.0
  BSD-2-Clause-Patent
  MIT
)
#'git+https://xenbits.xen.org/git-http/ovmf.git'
makedepends=('git' 'nasm')
_projname=edk2

# The makefile is pulled from the Xen source in tools/firmware/ovmf-makefile
# Source and submodule stuff is pulled from Arch's edk2 PKGBUILD
source=(
	Makefile
	git+$url#tag=$_projname-stable$pkgver
	openssl::git+https://github.com/openssl/openssl.git  # also submodule for libspdm
	pyca-cryptography::git+https://github.com/pyca/cryptography.git  # submodule for openssl
	krb5::git+https://github.com/krb5/krb5.git  # submodule for openssl
	gost-engine::git+https://github.com/gost-engine/engine.git  # submodule for openssl
	libprov::git+https://github.com/provider-corner/libprov.git  # submodule for gost-engine
	wycheproof::git+https://github.com/google/wycheproof.git  # submodule for openssl
	berkeley-softfloat-3::git+https://github.com/ucb-bar/berkeley-softfloat-3.git
	$_projname-cmocka::git+https://github.com/tianocore/edk2-cmocka.git
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
	quiche::git+https://github.com/cloudflare/quiche # submodule for openssl
	corpora::git+https://github.com/openssl/fuzz-corpora # submodule or openssl
	oqs-provider::git+https://github.com/open-quantum-safe/oqs-provider.git # submodule for openssl
	python-ecdsa::git+https://github.com/tlsfuzzer/python-ecdsa # submodule for openssl
	tlsfuzzer::git+https://github.com/tlsfuzzer/tlsfuzzer # submodule for openssl
	tlslite-ng::git+https://github.com/tlsfuzzer/tlslite-ng # submodule for openssl
)

sha256sums=('53f8b4499acbfd7fe14fdab67df321faabcb97c2964ee5ac90d01e1434942224'
            '7b0bee1dc671daebc1657cb49314235c779915ac4e1bb49f931b30aebb57dcfe'
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
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')



prepare() {
	local submodule

	cd "${srcdir}/${_projname}"
	cp "${srcdir}/Makefile" .

	git submodule init
	git config submodule.CryptoPkg/Library/OpensslLib/openssl.url ../openssl
	git config submodule.SoftFloat.url ../berkeley-softfloat-3
	git config submodule.UnitTestFrameworkPkg/Library/CmockaLib/cmocka.url ../$_projname-cmocka
	git config submodule.MdeModulePkg/Universal/RegularExpressionDxe/oniguruma.url ../oniguruma
	git config submodule.MdeModulePkg/Library/BrotliCustomDecompressLib/brotli.url ../brotli
	git config submodule.BaseTools/Source/C/BrotliCompress/brotli.url ../brotli
	git config submodule.RedfishPkg/Library/JsonLib/jansson.url ../jansson
	git config submodule.UnitTestFrameworkPkg/Library/GoogleTestLib/googletest.url ../googletest
	git config submodule.UnitTestFrameworkPkg/Library/SubhookLib/subhook.url ../$_projname-subhook
	git config submodule.MdePkg/Library/BaseFdtLib/libfdt.url ../pylibfdt
	git config submodule.MdePkg/Library/MipiSysTLib/mipisyst.url ../public-mipi-sys-t
	git config submodule.CryptoPkg/Library/MbedTlsLib/mbedtls.url ../mbedtls
	git config submodule.SecurityPkg/DeviceSecurity/SpdmLib/libspdm.url ../libspdm
	git -c protocol.file.allow=always submodule update

	# submodule setup for CryptoPkg/Library/OpensslLib/openssl
	submodule=CryptoPkg/Library/OpensslLib/openssl
	git -C $submodule submodule init
	git -C $submodule config submodule.pyca.cryptography.url "$srcdir/pyca-cryptography"
	git -C $submodule config submodule.krb5.url "$srcdir/krb5"
	git -C $submodule config submodule.gost-engine.url "$srcdir/gost-engine"
	git -C $submodule config submodule.wycheproof.url "$srcdir/wycheproof"
	git -C $submodule config submodule.tlsfuzzer.url "$srcdir/tlsfuzzer"
	git -C $submodule config submodule.cloudflare-quiche.url "$srcdir/quiche"
	git -C $submodule config submodule.fuzz/corpora.url "$srcdir/corpora"
	git -C $submodule config submodule.oqs-provider.url "$srcdir/oqs-provider"
	git -C $submodule config submodule.python-ecdsa.url "$srcdir/python-ecdsa"
	git -C $submodule config submodule.tlslite-ng.url "$srcdir/tlslite-ng"
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

	# -Werror, not even once (apparently)
	sed -e 's/ -Werror//g' -i BaseTools/Conf/*.template BaseTools/Source/C/Makefiles/*.makefile
	
}

build() {
	cd "${srcdir}/${_projname}"
	make
}

package() {
	mkdir -p "${pkgdir}/usr/lib/xen/boot"
	install -m644 "${srcdir}/edk2/ovmf.bin" "${pkgdir}/usr/lib/xen/boot"
}
