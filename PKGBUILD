# Maintainer: Batuhan Bulguroglu <batuhan at bulguroglu dot org>
pkgname='kwin-scripts-open-window-on-active-screen-git'
_gitname='p6-owac'
_gitowner='MagiusCHE'
pkgver=0.1.a.r0.gace1c1e
pkgrel=1
pkgdesc='Plasma 6 Plugin useful to open new windows on the monitor that has the mouse cursor'
arch=(any)
url="https://github.com/${_gitowner}/${_gitname}"
license=('GPL-3.0-only')
makedepends=('git' 'sed') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}" "$_gitname")
conflicts=("${pkgname%-git}" "$_gitname")
install="${pkgname%-git}.install"
_gitsrc="${_gitowner}.${_gitname}"
source=("${_gitsrc}::git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_gitsrc}" || exit 1
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$_gitsrc" || exit 1
	sed "s/\"Version\": \"[a-zA-Z0-9.-:#_]*\"/\"Version\": \"${pkgver}\"/" -i metadata.json
}

package() {
	cd "$_gitsrc" || exit 1
	local _kwin_script_id
	_kwin_script_id=$(grep '"Id"' metadata.json | sed 's/.*"Id": "\([^"]*\)".*/\1/')
	install -Dm644 contents/code/main.js "${pkgdir}/usr/share/kwin/scripts/${_kwin_script_id}/contents/code/main.js"
	install -m644 metadata.json "${pkgdir}/usr/share/kwin/scripts/${_kwin_script_id}/metadata.json"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname%-git}/README.md"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}
