# Maintainer: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>
_gitver=ec05cde34dd77678933c912a6b4abab5d81b9a5b
pkgbase=vtuner.apps
pkgdesc="access DVB devices over the network"
pkgname=('vtuner-client' 'vtuner-server')
pkgver=2.1_gec05cde
pkgrel=3
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://code.google.com/p/vtuner/"
license=('GPL2')
source=("${pkgbase}-${_gitver}.tar.gz::https://github.com/lecotex/vtuner.apps/archive/${_gitver}.tar.gz"
        'add_arm_targets.diff'
        'vtunerc@.service'
        'vtunerd.service'
        'vtunerc0'
        'vtunerd'
        'vtunerc-driver_kmod')
sha256sums=('7a8d3d6e8fc2c97b9f80c1a2208faecfac92aeb3bed863b9b98f66e0a25b1a4b'
            'f1662537ac1f6de48054bbf79e50a2c0e596e382fa466dca463c10c78cbfddf8'
            '870e48fb79b9065b5c98056df1aa6638c4dd3c5340331aed8a91af45f2162477'
            '9e4568a92caf05b5add190e792b788100aea3aac783ff1681c816a7ac87c631b'
            'd886e2aa59c122a4feebdcacbadeef8022b597c369d527328c0aea571f66f7a0'
            '42f3bb7ed053afa338535bd649b4738bf142a9d039010f6bd1a356cf51e80dbc'
            'd25fe328c78df500a96f593d9b030e0f5cd65ce476870ef7772598ef2a49415b')

prepare() {
	cd ${srcdir}/${pkgbase}-${_gitver}
	patch -p1 -i ${srcdir}/add_arm_targets.diff
	cp Make.config.sample Make.config
}

build() {
	cd ${srcdir}/${pkgbase}-${_gitver}
	make ${CARCH} LOCVER=${pkgver}
}

package_vtuner-client() {
	pkgdesc="VTuner client for virtual DVB's"
	depends=('vtunerc-dkms')
	backup=('etc/conf.d/vtunerc0')
	install -Dm744 ${srcdir}/${pkgbase}-${_gitver}/dist/${CARCH}/vtunerc.${CARCH} ${pkgdir}/usr/bin/vtunerc
	install -Dm644 ${srcdir}/vtunerc@.service ${pkgdir}/usr/lib/systemd/system/vtunerc@.service
	install -Dm744 ${srcdir}/vtunerc-driver_kmod ${pkgdir}/usr/lib/systemd/scripts/vtunerc-driver_kmod
	install -Dm644 ${srcdir}/vtunerc0 ${pkgdir}/etc/conf.d/vtunerc0
}

package_vtuner-server() {
	pkgdesc="VTuner server for broadcasting local DVB devices in network"
	backup=('etc/conf.d/vtunerd')
	install -Dm744 ${srcdir}/${pkgbase}-${_gitver}/dist/${CARCH}/vtunerd.${CARCH} ${pkgdir}/usr/bin/vtunerd
	install -Dm644 ${srcdir}/vtunerd.service ${pkgdir}/usr/lib/systemd/system/vtunerd.service
	install -Dm644 ${srcdir}/vtunerd ${pkgdir}/etc/conf.d/vtunerd
}
