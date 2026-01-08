# Maintainer: zerkawei <zkw@zerkawei.fr>
pkgname=beeflang-git
pkgver=r5491.e006a24
pkgrel=1
pkgdesc="High-performance multi-paradigm programming language focused on developer productivity"
arch=(x86_64)
url="https://www.beeflang.org/"
license=('MIT')

depends=('llvm19-libs' 'gcc-libs' 'glibc')
makedepends=('llvm19' 'cmake>=3.15' 'ninja' 'git')
provides=('beeflang=${pkgver}')

options=(!buildflags)

source=('git+https://github.com/beefytech/Beef.git')
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/Beef"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "${srcdir}/Beef"
	bin/build.sh
}

package() {
	cd "${srcdir}/Beef"

	find jbuild/Release/bin/*.a -type f -exec install -Dm644 -t "${pkgdir}/opt/BeefLang/bin/" "{}" \;
	find jbuild/Release/bin/*.so -type f -exec install -Dm644 -t "${pkgdir}/opt/BeefLang/bin/" "{}" \;
	find jbuild_d/Debug/bin/*.a -type f -exec install -Dm644 -t "${pkgdir}/opt/BeefLang/bin/" "{}" \;
	find jbuild_d/Debug/bin/*.so -type f -exec install -Dm644 -t "${pkgdir}/opt/BeefLang/bin/" "{}" \;
	
	install -Dm755 -t "${pkgdir}/opt/BeefLang/bin/" "IDE/dist/BeefBuild"
	install -Dm755 -t "${pkgdir}/opt/BeefLang/bin/" "IDE/dist/BeefBuild_d"

	install -d "${pkgdir}/usr/bin"
	ln -s "/opt/BeefLang/bin/BeefBuild" "${pkgdir}/usr/bin/beefbuild"

	install -Dm644 "IDE/dist/BeefConfig_install.toml" "${pkgdir}/opt/BeefLang/bin/BeefConfig.toml"

	find BeefLibs -type f -exec install -Dm644 "{}" "${pkgdir}/opt/BeefLang/{}" \;

	install -Dm644 -t "${pkgdir}/opt/BeefLang" "LICENSE.TXT"
	install -Dm644 -t "${pkgdir}/opt/BeefLang" "LICENSES.TXT"
	install -Dm644 -t "${pkgdir}/opt/BeefLang" "README.md"

	install -d "${pkgdir}/usr/share/licenses/beeflang-git"
	ln -s "/opt/BeefLang/LICENSES.TXT" "${pkgdir}/usr/share/licenses/beeflang-git/LISENCE"
}
