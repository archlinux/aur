# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=b404dev
_gitname=gitm8
_appname=${_gitname}
pkgname=${_gitname}
pkgdesc="Git TUI for the masses!!"

pkgver=3.0.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')

url="https://github.com/${_gitauthor}/${_gitname}"
_urlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"

license=('MIT')

provides=("${_appname}")

makedepends=('go')
depends=('glibc' 'git')

source=("${pkgname}-${pkgver}.tgz::https://github.com/${_gitauthor}/${_gitname}/archive/${_gitversion}.tar.gz")
sha256sums=('6586c11d4c6c49e95be477371421214f4e47c0104304e8710e634f96277df6df')


prepare() {
	cd ${srcdir}/${pkgname}-${pkgver} || exit 1

	go mod tidy
}

build() {
	cd ${srcdir}/${pkgname}-${pkgver} || exit 1

	export CGO_LDFLAGS="${LDFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

	go build -o ${_appname} ./
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver} || exit 1

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "docs/man/${_appname}.1" "${pkgdir}/usr/share/man/man1/${_appname}.1"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "docs/FLOWS.md" "${pkgdir}/usr/share/doc/${pkgname}/FLOWS.md"
	install -Dm644 "docs/CODEBASE.md" "${pkgdir}/usr/share/doc/${pkgname}/CODEBASE.md"
	install -Dm644 "docs/ABSTRACTIONS.md" "${pkgdir}/usr/share/doc/${pkgname}/BSTRACTIONS.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
