# Maintainer: Justin Kromlinger <hashworks@archlinux.org>
# Contributor: genofire

pkgname=ovenmediaengine
pkgver=0.14.14
pkgrel=1
pkgdesc='Open-source streaming video service with sub-second latency'
arch=('x86_64')
url='https://ovenmediaengine.com'
license=('GPL2')
# See https://github.com/AirenSoft/OvenMediaEngine/blob/master/misc/prerequisites.sh#L455
depends=(
	'openssl-3.0'
	'libsrtp'
	'srt'
	'opus'
	'ffmpeg'
	'pcre2'
	'hiredis'
)
optdepends=(
	'libva'
	'intel-gmmlib'
	'intel-media-sdk'
	'intel-media-driver'
	'cuda-tools'
	'ffnvcodec-headers'
)
makedepends=(
	'bc'
	'nasm'
	'jemalloc'
	'x264'
	'x265'
	'libvpx'
	'fdkaac'
)
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/AirenSoft/OvenMediaEngine/archive/refs/tags/v${pkgver}.tar.gz"
	"ovenmediaengine.service"
)
sha512sums=('fdca32da83614fc7201cff96f98f0365a104c6f135e5235e1dd82b1fbd863cb15de5153a8bb8ca31400fe0b6f77cf8923c2282b139f72b43dd772bc8d23b0900'
            'c5c4615d4c50a55c6fea177a1bc73b13d1365224c4e102067e45ce956741cb95366ec3b16cdec8932083c923910794e9164b0f9a25a6b0e2f186557fac3e42f1')

backup=(
	'etc/ovenmediaengine/Server.xml'
	'etc/ovenmediaengine/Logger.xml'
)

prepare() {
	cd "OvenMediaEngine-${pkgver}"

	# Assets take up ~13MB of space
	rm -Rf docs/.gitbook
	find docs -type f -name "*.md" -exec sed -i "s|.gitbook/assets|https://raw.githubusercontent.com/AirenSoft/OvenMediaEngine/v${pkgver}/docs/.gitbook/assets|g" {} +

	cd "src/core"

	# https://github.com/AirenSoft/OvenMediaEngine/pull/927
	sed 's|^__EXTRA_CFLAGS :=$|__EXTRA_CFLAGS := $(CPPFLAGS)|' -i global_config.mk
	sed 's|^__EXTRA_LDFLAGS :=$|__EXTRA_LDFLAGS := $(LDFLAGS)|' -i global_config.mk

	# https://github.com/AirenSoft/OvenMediaEngine/pull/928
	sed 's|^CONFIG_LIBRARY_PATHS := /opt/ovenmediaengine/lib:/opt/ovenmediaengine/lib64$|CONFIG_LIBRARY_PATHS :=|' -i config.mk
	sed 's|^CONFIG_PKG_PATHS := /opt/ovenmediaengine/lib/pkgconfig:/opt/ovenmediaengine/lib64/pkgconfig$|CONFIG_PKG_PATHS :=|' -i config.mk
}

build() {
	cd "OvenMediaEngine-${pkgver}/src"

	CPPFLAGS+=" -I/usr/include/openssl-3.0" \
	LDFLAGS+=" -L/usr/lib/openssl-3.0" \
	make release
}

package()  {
	install -D -m0644 "ovenmediaengine.service" "${pkgdir}/usr/lib/systemd/system/ovenmediaengine.service"

	cd "OvenMediaEngine-${pkgver}"

	install -D -m0755 "src/bin/RELEASE/OvenMediaEngine" "${pkgdir}/usr/bin/OvenMediaEngine"

	install -D -m0644 "misc/conf_examples/Origin.xml" "${pkgdir}/etc/ovenmediaengine/Server.xml"
	install -D -m0644 "misc/conf_examples/Logger.xml" "${pkgdir}/etc/ovenmediaengine/Logger.xml"

	install -D -m0644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	mkdir -p "${pkgdir}/usr/share/doc"
	cp -a docs "${pkgdir}/usr/share/doc/${pkgname}"
	cp -a misc/conf_examples "${pkgdir}/usr/share/doc/${pkgname}/conf_examples"
}
