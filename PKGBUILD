# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=kunchenguid
_pkgname=treehouse
pkgname=${_pkgname}
pkgdesc="Manage worktrees without managing worktrees"

pkgver=3.1.1
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
sha256sums=('5c05e2dfa67a4c185ceabe5fab189c6df70d224a1f6b40488de54a52702bccf5')


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
