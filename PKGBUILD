pkgname=ovenmediaengine
pkgver=v0.12.0.r15.g4ff7fdf1
pkgrel=1
pkgdesc='Open-source streaming video service with sub-second latency'
arch=('x86_64')
url='https://ovenmediaengine.com'
license=('GPL2')
# orderd by https://github.com/AirenSoft/OvenMediaEngine/blob/master/misc/prerequisites.sh
depends=('openssl' 'libsrtp' 'srt' 'opus' 'x264' 'x265' 'libvpx' 'fdkaac' 'nasm' 'ffmpeg' 'jemalloc' 'pcre2' 'libva' 'intel-gmmlib' 'intel-media-sdk' 'intel-media-driver' 'cuda-tools' 'ffnvcodec-headers')
makedepends=('bc' 'jemalloc')
source=(
	"git+https://github.com/AirenSoft/OvenMediaEngine"
	"ovenmediaengine.service"
)
sha512sums=(
	"SKIP"
	"25448de934d37f6fe13832201096645b069d65f3842f05d2188df71f3b4ea911f52d97ff4b5a38347364dc3d6224516105b872b722367f5d9fd64b41ed3ab181"
)

backup=('etc/ovenmediaengine/Server.xml' 'etc/ovenmediaengine/Logger.xml')

pkgver() {
	cd "${srcdir}/OvenMediaEngine"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/OvenMediaEngine/src"
	make release
}

package()  {
	install -D -m0644 "ovenmediaengine.service" "${pkgdir}/usr/lib/systemd/system/ovenmediaengine.service"

	cd "${srcdir}/OvenMediaEngine"

	install -D -m0755 "src/bin/RELEASE/OvenMediaEngine" "${pkgdir}/usr/bin/OvenMediaEngine"

	install -D -m0644 "misc/conf_examples/Origin.xml" "${pkgdir}/usr/share/ovenmediaengine/origin_conf/Server.xml"
	install -D -m0644 "misc/conf_examples/Logger.xml" "${pkgdir}/usr/share/ovenmediaengine/origin_conf/Logger.xml"
	install -D -m0644 "misc/conf_examples/Edge.xml" "${pkgdir}/usr/share/ovenmediaengine/edge_conf/Server.xml"
	install -D -m0644 "misc/conf_examples/Logger.xml" "${pkgdir}/usr/share/ovenmediaengine/edge_conf/Logger.xml"

	install -D -m0644 "misc/conf_examples/Origin.xml" "${pkgdir}/etc/ovenmediaengine/Server.xml"
	install -D -m0644 "misc/conf_examples/Logger.xml" "${pkgdir}/etc/ovenmediaengine/Logger.xml"
}
