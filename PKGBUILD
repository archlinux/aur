# Maintainer: zerkawei <zkw@zerkawei.fr>
pkgname=beeflang-ide-git
pkgver=r5687.86d3eb2
pkgrel=1
pkgdesc="High-performance multi-paradigm programming language focused on developer productivity with experimental IDE"
arch=(x86_64)
url="https://www.beeflang.org/"
license=('MIT')

depends=('llvm-libs>=22.0.0' 'gcc-libs' 'glibc' 'sdl3' 'systemd' 'curl' 'xdg-desktop-portal' 'noto-fonts' 'hicolor-icon-theme')
makedepends=('llvm>=22.0.0' 'cmake>=3.15' 'ninja' 'git')
provides=('beeflang=${pkgver}')
conflicts=('beeflang')

options=(!buildflags)

source=('git+https://github.com/beefytech/Beef.git' 'git+https://github.com/beefytech/Beef_website.git')
sha256sums=('SKIP' 'SKIP')

pkgver() {
    cd "${srcdir}/Beef"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "${srcdir}/Beef"
	bin/build.sh ide package
}

package() {
	cd "${srcdir}/Beef"

	bin/install.sh "${pkgdir}/opt/BeefLang"

	install -d "${pkgdir}/usr/bin"
	ln -s "/opt/BeefLang/bin/BeefBuild" "${pkgdir}/usr/bin/beefbuild"
	ln -s "/opt/BeefLang/bin/BeefIDE" "${pkgdir}/usr/bin/beefide"

	install -d "${pkgdir}/usr/share/licenses/beeflang-ide-git"
	ln -s "/opt/BeefLang/LICENSES.TXT" "${pkgdir}/usr/share/licenses/beeflang-ide-git/LISENCE"

	install -Dm644 -t "${pkgdir}/usr/share/applications/" "IDE/Resources/BeefIDE.desktop"
	install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/128x128/apps/" "IDE/Resources/beeflang.png"

	cd "${srcdir}/Beef_website"

	find Samples -type f -exec install -Dm644 "{}" "${pkgdir}/opt/BeefLang/{}" \;
}
