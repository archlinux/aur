# Maintainer: Laurin Neff <laurin at laurinneff dot ch>
pkgname=satisfactory-mod-manager
pkgver=2.8.1
pkgrel=1
pkgdesc="A mod manager for easy installation of mods and modloader for Satisfactory"
arch=(x86_64)
url="https://github.com/satisfactorymodding/SatisfactoryModManager"
license=('GPL3')
depends=('electron')
makedepends=('yarn' 'python2' 'node-gyp')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/satisfactorymodding/SatisfactoryModManager/archive/v${pkgver}.tar.gz"
        "${pkgname}.sh"
        "${pkgname}.desktop")
sha512sums=('1b31f5865b05cab416b9cda450acbc872730ee068f3c10da8135de04aedc6368f3eaab644a70b00f56eca65fa486075af0a2ed744ba8e919421c642a00a5d0c6'
            '42f8a3c7a3b88dc6deb14003830e0381dc90425aaf3be016430654611f0d9b7b35fbe63703d3bac8d4f2274c7175e7088cbbf808c08cf24f754ebc4d21729db4'
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
	install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/satisfactory-mod-manager"

	install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
