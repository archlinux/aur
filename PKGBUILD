# Maintainer: Sergey Shatunov <me@aur.rocks>
pkgname=satisfactory-mod-manager-git
pkgver=2.9.3
pkgrel=1
pkgdesc="A mod manager for easy installation of mods and modloader for Satisfactory"
arch=(x86_64)
url="https://github.com/satisfactorymodding/SatisfactoryModManager"
license=('GPL3')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
makedepends=('git' 'yarn' 'nodejs>=16' 'nodejs<19' 'node-gyp' 'python')
source=("git+https://github.com/satisfactorymodding/SatisfactoryModManager.git"
        "${pkgname%-git}.desktop")
sha512sums=('SKIP'
            '0168c97aca896f2f26b250b5644d88a02ceaff5d5fe1c1669cb4ed34f31f9d912d033d801abd368686ee0e81d583b7b6923359bad470fc4af3ae4179aa903c5b')

pkgver() {
        cd "${srcdir}/SatisfactoryModManager"
        printf "%s" "$(git describe --tags | sed 's/^v//')"
}

build() {
	cd "${srcdir}/SatisfactoryModManager"
	yarn install
	yarn dist
}


package() {
	cd "${srcdir}/SatisfactoryModManager"

	install -dm755 "${pkgdir}/usr/share/icons/hicolor"
	for i in 16 32 64 128 256 512; do
		install -Dm644 icons/${i}x${i}.png "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname%-git}.png"
	done

	install -dm755 "${pkgdir}/usr/bin"
	install -Dm755 build/Satisfactory-Mod-Manager.AppImage "${pkgdir}/usr/bin/satisfactory-mod-manager"

	install -Dm644 "${srcdir}/${pkgname%-git}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"
}
