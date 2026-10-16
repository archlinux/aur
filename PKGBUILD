# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=kunchenguid
_pkgname=treehouse
pkgname=${_pkgname}
pkgdesc="Manage worktrees without managing worktrees"

pkgver=3.1.4
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

makedepends=('go')
depends=('git')

provides=("${_pkgname}")

source=("${pkgname}-${pkgver}.tgz::${url}/archive/${_pkgvername}.tar.gz")
sha256sums=('f56be997c91032c986fa7b9597ee1aaccc887321ea57a52503fb21d0ddb6c342')


prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}/" || exit 1

	go mod tidy
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}/" || exit 1

	export CGO_ENABLED=0

	if [[ -f .ldflags ]]; then
		ldflags=$(<.ldflags)
	else
		# interim until commit fix is released
		ldflags="-checklinkname=0"
	fi

	go build -trimpath -ldflags "${ldflags}" -o "build/${pkgname}" ./cmd
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/" || exit 1

	install -Dm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "${pkgname}.toml.example" "${pkgdir}/usr/share/doc/${pkgname}/config/${pkgname}.example.toml"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
