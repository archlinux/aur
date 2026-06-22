# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor Amolith <amolith@secluded.site>

_pkgauthor=bmf-san
_pkgname=ggc
pkgname=${_pkgname}
pkgdesc="A modern Git CLI tool with both traditional command-line and interactive incremental-search UI"

pkgver=8.7.0
pkgrel=1
_ghversion=v${pkgver}

arch=('x86_64' 'aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_ghversion}"

license=('MIT')

depends=('glibc')
makedepends=('go')
provides=("${_pkgname}")
conflicts=("${_pkgname}"{-bin,-git})

source=("${_pkgname}-${pkgver}.tgz::${url}/archive/${_ghversion}.tar.gz")
sha256sums=('034e9645b980071dba922839e0878680ff1130fa3439115cfd525554e01a2340')


prepare() {
	cd "${pkgname}-${pkgver}" || exit

	export GOPATH="${srcdir}"
	go mod download -modcacherw
}

build() {
	cd "${pkgname}-${pkgver}" || exit

	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"

	VERSION="${_ghversion}"
	COMMIT="$(git rev-parse --short HEAD 2>/dev/null || echo 'unknown')"

	go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags "-linkmode external -extldflags \"${LDFLAGS}\" -X main.version=${VERSION} -X main.commit=${COMMIT}" \
		-o "${_pkgname}"

	mkdir -p "./completions/"
	./${_pkgname} completion bash > ./completions/${_pkgname}.bash
	./${_pkgname} completion zsh > ./completions/${_pkgname}.zsh
	./${_pkgname} completion fish > ./completions/${_pkgname}.fish
}

check() {
	cd "${pkgname}-${pkgver}" || exit

	go test
}

package() {
	cd "${pkgname}-${pkgver}" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -D -m644 "./completions/${_pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
	install -D -m644 "./completions/${_pkgname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
	install -D -m644 "./completions/${_pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
