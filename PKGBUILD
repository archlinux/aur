# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Det <nimetonmaili@gmail.com>
# Contributor: Godane aka Christopher Rogers <slaxemulator@gmail.com>
# Contributor: Michai Coman <mihai@m1x.ro>

pkgname=unetbootin
pkgver=661
pkgrel=1
arch=('x86_64')
license=('GPL')
pkgdesc='Create bootable Live USB drives'
url='https://unetbootin.github.io'
depends=('syslinux' 'p7zip' 'qt4' 'mtools' 'zenity')
makedepends=('setconf')
optdepends=('polkit: run unetbootin directly from menu'
            'zenity: display an error if no authentication agent is found')
source=("https://github.com/unetbootin/unetbootin/archive/${pkgver}.tar.gz"
        'org.archlinux.pkexec.unetbootin.policy'
        'unetbootin.sh')
sha256sums=('d4402a6c1003de0bf5eff60e9d6194f418efdc94c7e30a0da7b209fe4d71a0e4'
            'fa9bb53d90cb10a0ab8dd317ed6a3506b228b0e26ed2ed8b108b5990f641641a'
            '6399c6a44b270a4ec67a36e3914c7c2f47a9008efb0133a33f92d9ad4284cc57')

prepare() {
	cd "${pkgname}-${pkgver}/src/${pkgname}"

	setconf unetbootin.desktop Exec /usr/bin/unetbootin
}

build() {
	cd "${pkgname}-${pkgver}/src/${pkgname}"

	./build-nostatic
}

package() {
	cd "${pkgname}-${pkgver}/src/${pkgname}"

	install -d "${pkgdir}/usr/share/${pkgname}"
	install -m644 "${pkgname}"_*.qm "${pkgdir}/usr/share/${pkgname}/"
	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}.elf"

	# Application shortcut
	install -Dm644 "${pkgname}.desktop" \
		"${pkgdir}/usr/share/applications/${pkgname}.desktop"
	for i in 16 22 24 32 48 256; do
		install -Dm644 "${pkgname}_${i}.png" \
			"${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png"
	done

	cd "$srcdir"

	install -m755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

	# Polkit policy
	install -Dm644 'org.archlinux.pkexec.unetbootin.policy' \
		"${pkgdir}/usr/share/polkit-1/actions/org.archlinux.pkexec.unetbootin.policy"
}
