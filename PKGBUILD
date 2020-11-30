# Maintainer: BrainDamage <>

pkgname=konfyt
pkgver=1.1.2
pkgrel=1
pkgdesc="Konfyt is a digital keyboard workstation for Linux which allows you to set up patches, each with multiple layers, and instantly switch between these patches for live keyboard playing."
arch=('x86_64')
url='http://www.noedig.co.za/konfyt'
license=('GPL3')
depends=('fluidsynth' 'carla' 'liblscp' 'qt5-base')
source=("https://github.com/noedigcode/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('f1385c24f3815a880d5448b9e51d7c28f78e64f3243b766b2d8dca29e59d07d2')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	sed --in-place s@/home/gideon/bin/@@g desktopentry/konfyt.desktop
}

# template start; name=qmake; version=1;
build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	qmake PREFIX=/usr \
		QMAKE_CFLAGS="${CFLAGS}" \
		QMAKE_CXXFLAGS="${CXXFLAGS}" \
		QMAKE_LFLAGS="${LDFLAGS}"
	make
}

# template start; name=make_install; version=1;
package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm 755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
	install -Dm 644 "desktopentry/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	for icon in icons/konfyt\ *.png; do
		size=$(echo "${icon}" | cut -d ' ' -f 2 | cut -d '.' -f 1)
		if [[ "$size" != 'yellow' ]]; then
			install -Dm 644 "${icon}" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/${pkgname}.png"
		fi
	done
}