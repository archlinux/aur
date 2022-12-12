# Maintainer: Laurin Neff <laurin at laurinneff dot ch>
pkgname=satisfactory-mod-manager
pkgver=2.9.3
pkgrel=1
pkgdesc="A mod manager for easy installation of mods and modloader for Satisfactory"
arch=(x86_64)
url="https://github.com/satisfactorymodding/SatisfactoryModManager"
license=('GPL3')
makedepends=('yarn' 'nodejs>=16' 'nodejs<19' 'node-gyp' 'python')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/satisfactorymodding/SatisfactoryModManager/archive/v${pkgver}.tar.gz"
        "${pkgname}.desktop")
sha512sums=('aed7f231564361259d1fd93d11be19d6b1a388a8251a49a3253108b7bc60b7d54ccd30fb3abd25d4b035ffb5c1a11d5c0e25716c6c7462adc8450408e593a1a7'
            '0168c97aca896f2f26b250b5644d88a02ceaff5d5fe1c1669cb4ed34f31f9d912d033d801abd368686ee0e81d583b7b6923359bad470fc4af3ae4179aa903c5b')


build() {
	cd "${srcdir}/SatisfactoryModManager-${pkgver}"
	yarn install
	yarn dist
}


package() {
	cd "${srcdir}/SatisfactoryModManager-${pkgver}"

	install -dm755 "${pkgdir}/usr/share/${pkgname}"
	cp -r build/linux-unpacked/resources "${pkgdir}/usr/share/${pkgname}/"

	install -dm755 "${pkgdir}/usr/share/icons/hicolor"
	for i in 16 32 64 128 256 512; do
		install -Dm644 icons/${i}x${i}.png "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png"
	done

	install -dm755 "${pkgdir}/usr/bin"
	install -Dm755 build/Satisfactory-Mod-Manager.AppImage "${pkgdir}/usr/bin/satisfactory-mod-manager"

	install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
