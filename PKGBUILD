# Maintainer: Sergey Shatunov <me@aur.rocks>
pkgname=satisfactory-mod-manager-git
pkgver=3.0.1.r0.gd90106a
pkgrel=1
pkgdesc="A mod manager for easy installation of mods and modloader for Satisfactory"
arch=(x86_64)
url="https://github.com/satisfactorymodding/SatisfactoryModManager"
license=('GPL3')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
makedepends=('git' 'yarn' 'nodejs' 'node-gyp' 'python' 'wails' 'go-task' 'pnpm')
depends=('webkit2gtk' 'gst-plugins-good')
source=("git+https://github.com/satisfactorymodding/SatisfactoryModManager.git"
        "${pkgname%-git}.desktop")
sha512sums=('SKIP'
            '6271ba738cb17a787c33fede390aa86381e22ea3e7ffd44b7bef74f26d4a59c26bb803783ce61feec8d0eb596bd0d5bd5f2ad917fb0a684a091763d8f6ada1fe')

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
