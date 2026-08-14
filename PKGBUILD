# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=eugenioenko
_gitname=ttt
_appname=${_gitname}
pkgname=${_appname}
pkgdesc="A terminal text editor IDE"

pkgver=1.2.2
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")

makedepends=('make' 'go')
optdepends=('git: Source Control Features' 'ripgrep: Workspace Search')

options=(!strip)

source=("${pkgname}-${pkgver}.tgz::https://github.com/${_gitauthor}/${_gitname}/archive/${_gitversion}.tar.gz")
sha256sums=('ce5303900065865a5ddb6261eee53817fc7e6581c3f94cadb107953c3d105006')


prepare() {
	cd ${srcdir}/${_appname}-${pkgver} || exit 1

	go mod tidy
}

build() {
	cd ${srcdir}/${_appname}-${pkgver} || exit 1

	make VERSION="${pkgver}" build
}

check() {
	cd ${srcdir}/${_appname}-${pkgver} || exit 1

	make test
}

package() {
	cd ${srcdir}/${_appname}-${pkgver} || exit 1

	install -Dm755 "bin/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -dm755 "${pkgdir}/usr/share/${_appname}/"
	cp -rf "./config/" "${pkgdir}/usr/share/${_appname}/"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
