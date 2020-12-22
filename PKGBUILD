# Maintainer: Laurin Neff <laurin at laurinneff dot ch>
pkgname=satisfactory-mod-manager
pkgver=2.3.1
pkgrel=1
pkgdesc="A mod manager for easy installation of mods and modloader for Satisfactory"
arch=(x86_64) # Probably works on other architectures, haven't tested yet.
url="https://github.com/satisfactorymodding/SatisfactoryModManager"
license=('GPL3')
depends=('electron9')
makedepends=('yarn' 'python2' 'node-gyp')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/satisfactorymodding/SatisfactoryModManager/archive/v${pkgver}.tar.gz"
        "${pkgname}.sh"
        "${pkgname}.desktop")
sha512sums=("8b7e27da3cda069977be52a96966e01f0141efe37bf657708a4fa7349392b6e3a1f78b4b59d2858e5b4815bb752112ca311e9a66f6f6165d788c8940dfb55624"
			"39b7de172ff924182d233174ce7a7517e12d83e87bae9df387601681ee6f7e4cc63b1d834ea12fb414d20c13d18663c4c4ad795580d09e756b0b9f09fa7911e7"
			"0168c97aca896f2f26b250b5644d88a02ceaff5d5fe1c1669cb4ed34f31f9d912d033d801abd368686ee0e81d583b7b6923359bad470fc4af3ae4179aa903c5b")


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
	install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/satisfactory-mod-manager"

	install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
