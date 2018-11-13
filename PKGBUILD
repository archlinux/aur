# Submitter: katoh <katoh_at_mikage.ne.jp>
#

pkgname=azpainter
pkgver=2.1.3
pkgrel=1
pkgdesc="Painting software"
arch=('i686' 'x86_64')
url="https://osdn.net/projects/azpainter/"
license=('GPL3')
depends=('hicolor-icon-theme' 'fontconfig' 'libjpeg-turbo' 'libxi')
makedepends=('libxfixes')
source=("https://osdn.net/dl/${pkgname}/${pkgname}-${pkgver}.tar.xz"
        "${pkgname}-${pkgver}-1-translations.patch")
sha256sums=('8716a47f3695ba3c6e230415c0d19f082bc2d900213ff1271bfd81496e02e300'
            'ce2a36e67928d4875a963f6a6d6f3eae123bc3f5c1b3778ee4fbcc6c61ed6dfc')

prepare() {
	cd ${pkgname}-${pkgver}
	# fixing translations
	
	patch -Np1 -i ../"${pkgname}-${pkgver}-1-translations.patch"
	
	cd translation
	make
	./mtrconv en en.mtr
	./mtrconv be be.mtr
	./mtrconv ru ru.mtr
	./mtrconv uk uk.mtr
	./mtrconv ja ja.mtr
	./mtrconv pt_BR pt_BR.mtr
	./mtrconv es_ES es_ES.mtr
	./mtrconv zh_CN zh_CN.mtr
}

build() {
	cd ${pkgname}-${pkgver}
	./configure --prefix=/usr
	# make -j1
	make
}

package() {
	cd ${pkgname}-${pkgver}
	make DESTDIR=${pkgdir} install-strip

	cp -f translation/*.mtr ${pkgdir}/usr/share/azpainter/tr/
}
