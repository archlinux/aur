# Maintainer: Sergey Shatunov <me@aur.rocks>
pkgname=satisfactory-mod-manager-git
pkgver=3.0.0.beta.4.r48.gd8a3236
pkgrel=1
pkgdesc="A mod manager for easy installation of mods and modloader for Satisfactory"
arch=(x86_64)
url="https://github.com/satisfactorymodding/SatisfactoryModManager"
license=('GPL3')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
makedepends=('git' 'yarn' 'nodejs' 'node-gyp' 'python' 'wails' 'go-task')
source=("git+https://github.com/satisfactorymodding/SatisfactoryModManager.git"
        "${pkgname%-git}.desktop")
sha512sums=('SKIP'
            '0168c97aca896f2f26b250b5644d88a02ceaff5d5fe1c1669cb4ed34f31f9d912d033d801abd368686ee0e81d583b7b6923359bad470fc4af3ae4179aa903c5b')

pkgver() {
    cd "${srcdir}/SatisfactoryModManager"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/SatisfactoryModManager"
	go-task build
}


package() {
	cd "${srcdir}/SatisfactoryModManager"

	install -dm755 "${pkgdir}/usr/share/icons/hicolor"
	for i in 16 32 64 128 256 512; do
		install -Dm644 icons/${i}x${i}.png "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname%-git}.png"
	done

	install -dm755 "${pkgdir}/usr/bin"
	install -Dm755 build/bin/SatisfactoryModManager "${pkgdir}/usr/bin/satisfactory-mod-manager"

	install -Dm644 "${srcdir}/${pkgname%-git}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"
}
