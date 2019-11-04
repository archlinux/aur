# Maintainer: Arne Hoch <arne at derhoch dot de>

pkgname=t230c2-git
_pkgname=t230c2-git
pkgver=r1206.15144f1
pkgrel=1
pkgdesc="CrazyCat Geniatech T230C2 DVB-T/T2/C kernel modules"
arch=('i686' 'x86_64')
url="https://bitbucket.org/CrazyCat/media_build"
license=('GPL2')
makedepends=('linux-headers' 'perl-proc-processtable')
provides=('t230c2')
source=("${_pkgname}::git+https://bitbucket.org/CrazyCat/media_build.git"
        "https://github.com/osmc/dvb-firmware-osmc/raw/master/dvb-demod-si2168-d60-01.fw"
        "https://github.com/osmc/dvb-firmware-osmc/raw/master/dvb-tuner-si2141-a10-01.fw"
        "config")

sha512sums=('SKIP'
            '25d3f6ac7f194b39b7cde7a21abd4acea2fe62fd86e2329010d679537fac83f4b0ef40cb3fafe110bc1f922941a14f111b15c1142267ac69b779a8c093f7627d'
            'cbcbc2b9b5b1735e049f2dd57b01fed153a1ed173054ef324ce779f0ac98cbead7bc3883d3f69c2e4e4339a15a13ebaec2168c31e3a1c0982ecd86d9640279b9'
            'b5e2c2524a9410fab72bbd445fe1cd534dfb3f58edd14c17e247ca3c43baf86acf7fa24bf287f8a409b7b2fcb162c0fc8f2b23f6eabbc6d4bd0f79bd5abef71c')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	_v="$(</usr/src/linux/version)"
	cd "${srcdir}/${_pkgname}"

	cp ../config v4l/.config
	make -C linux download
	make -C linux untar
	make KERNELRELEASE="$_v" -C v4l
}

package() {
	_v="$(</usr/src/linux/version)"
	cd "${srcdir}/${_pkgname}"

	install -d "$pkgdir/usr/lib/modules/$_v/extramodules"
	install -m644 v4l/*.ko "$pkgdir/usr/lib/modules/$_v/extramodules/"
	install -Dm644 ../dvb-demod-si2168-d60-01.fw "$pkgdir/usr/lib/firmware/dvb-demod-si2168-d60-01.fw"
	install -Dm644 ../dvb-tuner-si2141-a10-01.fw "$pkgdir/usr/lib/firmware/dvb-tuner-si2141-a10-01.fw"
}

