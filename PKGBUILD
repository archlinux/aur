# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Michael Placzek <heymaikol@proton.me>

_gitauthor=heymaikol
_gitname=network-doctor
_appname=(netdoc{,-sim})
pkgname=${_gitname}
pkgdesc="A network troubleshooting TUI that turns interface, DNS, TCP, TLS, HTTP, proxy, and path-MTU checks into one plain-English diagnosis"

pkgver=2.2.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0')

provides=("${_appname[@]}")

makedepends=('git' 'go')

options=('!strip')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/${_gitversion}.tar.gz")
sha256sums=('267ad906f11b759c3341487a5a294e8c1085b83a0566e483ea60556d45d22009')


build() {
	cd "${pkgname}-${pkgver}/" || exit

	export CGO_ENABLED=0
	export GOFLAGS="-trimpath -mod=readonly -modcacherw"
	go build -ldflags "-s -w -X main.version=${pkgver}" -o ${_appname[0]} ./cmd/${_appname[0]}
	go build -ldflags "-s -w -X main.version=${pkgver}" -o ${_appname[1]} ./cmd/${_appname[1]}
}

package() {
	cd "${pkgname}-${pkgver}/" || exit

	install -Dm755 ${_appname[0]} -t "${pkgdir}/usr/bin/"
	install -Dm755 ${_appname[1]} -t "${pkgdir}/usr/bin/"

	install -Dm644 "./packaging/${_appname[0]}.1" "${pkgdir}/usr/share/man/man1/${_appname[0]}.1"
	install -Dm644 "./packaging/${_appname[1]}.1" "${pkgdir}/usr/share/man/man1/${_appname[1]}.1"

	install -Dm644 "./packaging/completions/${_appname[0]}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_appname[0]}"
	install -Dm644 "./packaging/completions/${_appname[1]}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_appname[1]}"
	install -Dm644 "./packaging/completions/${_appname[0]}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_appname[0]}"
	install -Dm644 "./packaging/completions/${_appname[1]}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_appname[1]}"
	install -Dm644 "./packaging/completions/${_appname[0]}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_appname[0]}.fish"
	install -Dm644 "./packaging/completions/${_appname[1]}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_appname[1]}.fish"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
