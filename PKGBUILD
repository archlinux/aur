# Maintainer: Dustin Falgout <dustin@antergos.com>

pkgname=brisk-menu
pkgver=0.5.0
pkgrel=3
pkgdesc='Modern, efficient menu for the MATE Desktop Environment.'
arch=('i686' 'x86_64')
url='https://github.com/getsolus/brisk-menu'
license=('GPL2')
groups=('mate')
depends=('mate-panel' 'libnotify')
makedepends=('gnome-common' 'gettext' 'itstool' 'vala>=0.36' 'meson' 'ninja' )
source=("https://github.com/solus-project/${pkgname}/releases/download/v${pkgver}/${pkgname}-v${pkgver}.tar.xz"
mate-122.patch
fix-launch.patch)


prepare() {
    cd "$srcdir/${pkgname}-v${pkgver}"
    # This patch fixes building with mate 1.22.x
    patch -Np1 -i "${srcdir}/mate-122.patch"
    # This fixes starting with mate 1.22.x but removes categories icon for now
    patch -Np1 -i "${srcdir}/fix-launch.patch"
}


build() {
	cd "${srcdir}/${pkgname}-v${pkgver}"
	mkdir build

	meson build \
		--prefix=/usr \
		--bindir=/usr/bin \
		--libexecdir=/usr/lib/${pkgname}

	ninja -C build
}


package() {
	cd "${srcdir}/${pkgname}-v${pkgver}/build"

	DESTDIR="${pkgdir}" ninja install
}
sha256sums=('1377ffbb784e576c290bb4d11a2dd376bc0ad017bb9f56a080bccdbc4fbe88ce'
            '80326a5b98d0dfd6c7d9a362907edf576e24683032ffb62926f68e3f16abff71'
            '580f7f78b51107cb8e594b361d36eebbedb38b77a5248b9813dc4bc8961bd775')
