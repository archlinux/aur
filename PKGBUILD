# Maintainer: <zazaguichi@outlook.com>

pkgname=plantilla-git
pkgver=0.1.2
pkgrel=1
pkgdesc="A tool for cropping and applying branding to images"

provides=('plantilla')
conflicts=('plantilla')

arch=('arm' 'x86_64')
license=('MIT')
url='https://github.com/Azakidev/plantilla'
depends=('electron')
makedepends=('npm' 'git')
source=("git+https://github.com/Azakidev/plantilla.git")
sha256sums=("SKIP")

build(){
	cd "${srcdir}/plantilla"

	export SHELL=sh  # Workaround for https://github.com/electron-userland/electron-builder/issues/3494
	npm i && npm run build
}

package(){
	cd "${srcdir}/plantilla/release/${pkgver}"

    mv "Plantilla-Linux-${pkgver}.pacman" "Plantilla-Linux-${pkgver}.tar.xz"

    mkdir extract
    tar xf "Plantilla-Linux-${pkgver}.tar.xz" --directory=extract/

	cp -r ./extract/* "${pkgdir}"
	install -Dm644 "${pkgdir}/opt/Plantilla/resources/app.asar" "${pkgdir}/usr/lib/plantilla/app.asar"
	rm -rf "${pkgdir}/opt"
	sed -i -E 's|Exec=/opt/Plantilla/plantilla|Exec=/usr/bin/electron /usr/lib/plantilla/app.asar|' "${pkgdir}/usr/share/applications/plantilla.desktop"

	install -Dm755 "${srcdir}/plantilla/pacman/plantilla" "${pkgdir}/usr/bin/plantilla"
}
