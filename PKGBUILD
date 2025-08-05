# Maintainer: VCalV

_pkgname="crush"
pkgname="${_pkgname}-git"
_user="charmbracelet"
pkgver=0.2.1r30.g889b1765
pkgrel=2
pkgdesc="A powerful terminal-based AI assistant for developers, providing intelligent coding assistance directly in your terminal - git version"
arch=('x86_64')
url="https://github.com/${_user}/${_pkgname}"
license=('FSL-1.1-MIT')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}-bin" "${_pkgname}")
makedepends=('go' 'git')
source=("${_pkgname}::git+${url}.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    # Use number of commits and latest short hash as version
    git describe --long --tags --match "v*" 2>/dev/null | sed 's/^v//;s/-/r/;s/-/./'
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    mkdir -p ./completions
    mkdir -p ./manpages
}

build() {
    cd "${srcdir}/${_pkgname}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build

    for ext in bash zsh fish ; do
        go run . completion "$ext" > "./completions/crush.$ext"
    done

    go run . man | gzip -9 -c > "./manpages/crush.1.gz"
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -Dm755 crush "${pkgdir}/usr/bin/crush"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" *.md

    install -Dm644 "./completions/crush.bash" "${pkgdir}/usr/share/bash-completion/completions/crush"
    install -Dm644 "./completions/crush.zsh" "${pkgdir}/usr/share/zsh/site-functions/_crush"
    install -Dm644 "./completions/crush.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/crush.fish"

    install -Dm644 "./manpages/crush.1.gz" "${pkgdir}/usr/share/man/man1/crush.1.gz"
}
