# Maintainer: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>

# All my PKGBUILDs are managed at https://github.com/tmn505/AUR

_gitver=ec05cde34dd77678933c912a6b4abab5d81b9a5b
pkgbase=vtuner.apps
pkgname=('vtuner-client' 'vtuner-server')
pkgver=2.1_gec05cde
pkgrel=4
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='http://code.google.com/p/vtuner'
license=('GPL2')
source=("${pkgbase}-${_gitver}.tar.gz::https://github.com/lecotex/vtuner.apps/archive/${_gitver}.tar.gz"
        'add-arm-targets.patch'
        'vtunerc@.service'
        'vtunerd.service'
        'vtunerc0'
        'vtunerd'
        'vtunerc-driver_kmod')
sha256sums=('7a8d3d6e8fc2c97b9f80c1a2208faecfac92aeb3bed863b9b98f66e0a25b1a4b'
            '95b6f060a508995d2d11062951963c48435af05f946907b7782982a1213e3631'
            '870e48fb79b9065b5c98056df1aa6638c4dd3c5340331aed8a91af45f2162477'
            '9e4568a92caf05b5add190e792b788100aea3aac783ff1681c816a7ac87c631b'
            'ebbc555c1995d9f504f404a671cf36908c59dcd8ab73b0f9886bce9bde985620'
            '0e443b9c820f8438fb4bdec50a0888269ca6c1e2dd890f50ccbbb353b8dc0a00'
            '222de6d13132dcde7748cac31b318643fb184e6ebac17d8e9d7602a1d842ea2d')

prepare() {
	cd ${srcdir}/${pkgbase}-${_gitver}
	patch -p1 -i ${srcdir}/add-arm-targets.patch
	cp Make.config.sample Make.config
}

build() {
	cd ${srcdir}/${pkgbase}-${_gitver}
	make ${CARCH} LOCVER=${pkgver}
}

package_vtuner-client() {
	pkgdesc='VTuner client for the network shared DVB devices'
	depends=('vtunerc-dkms')
	backup=('etc/conf.d/vtunerc0')
	install -Dm744 ${srcdir}/${pkgbase}-${_gitver}/dist/${CARCH}/vtunerc.${CARCH} ${pkgdir}/usr/bin/vtunerc
	install -Dm644 ${srcdir}/vtunerc@.service ${pkgdir}/usr/lib/systemd/system/vtunerc@.service
	install -Dm744 ${srcdir}/vtunerc-driver_kmod ${pkgdir}/usr/lib/systemd/scripts/vtunerc-driver_kmod
	install -Dm644 ${srcdir}/vtunerc0 ${pkgdir}/etc/conf.d/vtunerc0
}

package_vtuner-server() {
	pkgdesc='VTuner server for sharing local DVB devices over the network'
	backup=('etc/conf.d/vtunerd')
	install -Dm744 ${srcdir}/${pkgbase}-${_gitver}/dist/${CARCH}/vtunerd.${CARCH} ${pkgdir}/usr/bin/vtunerd
	install -Dm644 ${srcdir}/vtunerd.service ${pkgdir}/usr/lib/systemd/system/vtunerd.service
	install -Dm644 ${srcdir}/vtunerd ${pkgdir}/etc/conf.d/vtunerd
}
