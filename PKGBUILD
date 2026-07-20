# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=nooga
_gitname=let-go
_appname=lg
pkgname=${_gitname}-bin
pkgdesc="Almost Clojure written in Go"

pkgver=1.12.2
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

makedepends=('git')
depends=('glibc' 'bash')

options=(!strip)

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums_x86_64=('4a866916f005f044207ecebb6b95ef27d0240d4defc99ddfb8ae1fe8d2e3c077')
sha256sums_aarch64=('4fa187c41322991f9cf58f91ccc0638da3d6f87dd392aa3960271361588b581b')


prepare() {
	cd "${srcdir}/" || exit

	rm -rf git && git clone -n --depth=1 --filter=tree:0 "${_ghurl}" git && cd git

	git sparse-checkout set --no-cone /docs /examples && git checkout
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -dm755 "${pkgdir}/usr/share/${pkgname%-bin}/examples"
	cp -rf "git/examples/"* "${pkgdir}/usr/share/${pkgname%-bin}/examples/"

	install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/docs"
	cp -rf "git/docs/"* "${pkgdir}/usr/share/doc/${pkgname}/docs/"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
