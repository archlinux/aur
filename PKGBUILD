# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=unixshells
_gitname=latch
_appname=${_gitname}
pkgname=${_appname}
pkgdesc="Terminal multiplexer with built-in remote access"

pkgver=1.0.41
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")

makedepends=('go')

options=('!strip')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('dd5d343e02fea89b47899b3e3f1f1b882e3633b44bf803297521b1eda4a74448')


prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}/" || exit

	go mod tidy
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}/" || exit

	export CGO_ENABLED=0

	if [[ -f .ldflags ]]; then
		ldflags=$(<.ldflags)
	else
		# interim until commit fix is released
		ldflags="-checklinkname=0"
	fi

	go build -trimpath -ldflags "${ldflags}" -o "${pkgname}" ./cmd/${pkgname}
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/" || exit

	install -Dm755 "${_appname}" -t "${pkgdir}/usr/bin/"

	install -Dm644 "doc/${_appname}.1" -t "${pkgdir}/usr/share/man/man1/"
	install -Dm644 "doc/${_appname}.conf.5" -t "${pkgdir}/usr/share/man/man5/"

	install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
