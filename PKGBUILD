# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_name=iris
pkgname=${_name}-autocomplete
pkgver=0.7.1
pkgrel=1
pkgdesc='Shell auto-completion tool that works like code editor''s IntelliSense.'
url="https://github.com/versenilvis/${_name}"
license=('0BSD')
depends=('glibc')
makedepends=('go')
arch=('x86_64')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d583c042e189648ece96b2ce2e533eb5be1eba23a11d7e76cafe2a9ef490f2b7')

_srcdir="IRIS-${pkgver}"

build() {
	cd "${_srcdir}"

	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"

	go build -v \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags "-linkmode external -extldflags \"${LDFLAGS}\" \
		-X github.com/elves/elvish/pkg/buildinfo.Reproducible=true \
		-X github.com/elves/elvish/pkg/buildinfo.Version=$pkgver" \
		-o "${srcdir}/${_name}" \
		"./cmd/${_name}"

	cd "${srcdir}"
	mkdir -p 'completions'
	./"${_name}" completion zsh > "completions/${_name}.zsh"
	./"${_name}" completion bash > "completions/${_name}.bash"
	./"${_name}" completion fish > "completions/${_name}.fish"
}

#check() {
#	cd "${_srcdir}"
#
#	go test -v './...'
#}

package() {
	optdepends+=('zsh' 'bash' 'fish')

	install -Dm755 "${_name}" -t "${pkgdir}/usr/bin"

	install -Dm644 "${_srcdir}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"

	install -Dm644 "completions/${_name}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_name}"
	install -Dm644 "completions/${_name}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_name}"
	install -Dm644 "completions/${_name}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_name}.fish"
}
