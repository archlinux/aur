# Maintainer: Niklas Schönberg <niklas@foonly.dev>

pkgname=foonver
pkgver=0.13.0
pkgrel=1
pkgdesc="A lightweight CLI utility for automated Semantic Versioning (SemVer) management."
url="https://github.com/foonly/${pkgname}"
license=("GPL-3.0-only")
arch=("x86_64")
provides=("foonver")
conflicts=("foonver")
depends=("git")
makedepends=("go")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
options=(!debug !lto)
sha256sums=('c257de0b77a0439577115a6a65814ce10c191bcaf727490d788624c711ac8722')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	go build -ldflags="-s -w -X github.com/foonly/foonver/internal/config.AppVersion=${pkgver}" ./cmd/foonver

	export XDG_CONFIG_HOME="${srcdir}/config"
	export XDG_DATA_HOME="${srcdir}/data"
	export XDG_CACHE_HOME="${srcdir}/cache"

	./foonver completion bash > foonver.bash
	./foonver completion zsh > _foonver
	./foonver completion fish > foonver.fish
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -Dm755 foonver "${pkgdir}/usr/bin/foonver"
	install -Dm644 foonver.bash "${pkgdir}/usr/share/bash-completion/completions/foonver"
	install -Dm644 _foonver "${pkgdir}/usr/share/zsh/site-functions/_foonver"
	install -Dm644 foonver.fish "${pkgdir}/usr/share/fish/vendor_completions.d/foonver.fish"
}
