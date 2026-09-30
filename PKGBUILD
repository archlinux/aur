# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=jongio
_gitname=grut
_appname=${_gitname}
pkgname=${_appname}
pkgdesc="A terminal file explorer with full Git and GitHub integration, AI chat, and reactive panels that stay in sync as you navigate"

pkgver=0.10.0
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

makedepends=('go')
depends=('git' 'github-cli')

options=('!strip')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/${_gitversion}.tar.gz")
sha256sums=('791467840f9b3740ad2097614dcc17c527c61d2b1d367ddc2ebd609c23a7a681')


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

	go build -trimpath -ldflags "${ldflags}" -o "build/${_appname}" .

	chmod +x "./build/${_appname}"

	mkdir -p "./completions"

	"./build/${_appname}" completion zsh > "./completions/${_appname}.zsh"
	"./build/${_appname}" completion bash > "./completions/${_appname}.bash"
	"./build/${_appname}" completion fish > "./completions/${_appname}.fish"
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}/" || exit

	go test -v ./...
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/" || exit 1

	install -Dm755 "build/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "completions/${_appname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_appname}"
	install -Dm644 "completions/${_appname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_appname}"
	install -Dm644 "completions/${_appname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_appname}.fish"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
