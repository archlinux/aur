#Maintainer: Daniel Lehmann <daniellehmann28@outlook.de>
pkgname=sliver-git
pkgver=1.5.39.r1104.gc7cd14e
pkgrel=1
pkgdesc="Sliver is a an opensource C2 framework designed by bishop fox"
url="https://github.com/BishopFox/sliver"
arch=('any')
depends=()
makedepends=('git' 'go>=1.18' 'make' 'sed' 'tar' 'curl' 'zip' 'unzip' 'which' 'coreutils')
optdepends=()
license=('BSD-3-Clause')
provides=("${pkgname%-git}")
install=
source=("${pkgname%-git}::git+https://github.com/BishopFox/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname%-git}"
	printf "%s" "$(git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
    make --directory "${srcdir}/${pkgname%-git}"
}

package() {
    install -Dm755 "${srcdir}/${pkgname%-git}/${pkgname%-git}-server" "${pkgdir}/usr/bin/${pkgname%-git}-server"
    install -Dm755 "${srcdir}/${pkgname%-git}/${pkgname%-git}-client" "${pkgdir}/usr/bin/${pkgname%-git}-client"

    # Making completions
    install -dm755 "${pkgdir}/usr/share/bash-completion/completions/"
    "${srcdir}/${pkgname%-git}"/${pkgname%-git}-server completion bash > "${pkgdir}/usr/share/bash-completion/completions/${pkgname%-git}-server"
    "${srcdir}/${pkgname%-git}"/${pkgname%-git}-client completion bash > "${pkgdir}/usr/share/bash-completion/completions/${pkgname%-git}-client"

    install -dm755 "${pkgdir}/usr/share/fish/vendor_completions.d/"
    "${srcdir}/${pkgname%-git}"/${pkgname%-git}-server completion fish > "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname%-git}-server.fish"
    "${srcdir}/${pkgname%-git}"/${pkgname%-git}-client completion fish > "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname%-git}-client.fish"

    install -dm755 "${pkgdir}/usr/share/zsh/site-functions/"
    "${srcdir}/${pkgname%-git}"/${pkgname%-git}-server completion zsh > "${pkgdir}/usr/share/zsh/site-functions/_${pkgname%-git}-server"
    "${srcdir}/${pkgname%-git}"/${pkgname%-git}-client completion zsh > "${pkgdir}/usr/share/zsh/site-functions/_${pkgname%-git}-client"
}
