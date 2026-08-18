# Maintainer: Zadkiel AHARONIAN <hello@zadkiel.fr>
# Repository: https://github.com/aslafy-z/aur-packages

# No `# renovate:` annotation: pkgver() derives the version from the checkout at
# build time, so there is no pinned version for Renovate to bump.
pkgname=kprompt-git
_pkgname=kprompt
pkgver=0.11.0.r15.gb82db84
pkgrel=1
pkgdesc='AI Kubernetes CLI: natural language to a reviewable plan, applied after approval'
arch=('x86_64' 'aarch64')
url='https://kprompt.ai'
license=('Apache-2.0')
depends=('glibc')
makedepends=('git' 'go')
provides=("kprompt=${pkgver%%.r*}")
conflicts=('kprompt')
optdepends=('helm: plan Helm chart installs and upgrades')
# -trimpath rewrites every source path out of the binary, leaving the debug
# package with an empty usr/src/debug and a build-id symlink to nothing.
options=('!debug')
source=("${_pkgname}::git+https://github.com/kprompt/kprompt.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"

    git describe --long --tags --abbrev=7 |
        sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"

    # Upstream builds with CGO disabled. Arch's Go packaging guidelines are
    # followed instead, so the binary gets the distribution hardening flags.
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'

    go build \
        -ldflags "-linkmode=external -X main.version=${pkgver}" \
        -o build/kprompt \
        ./cmd/kprompt
}

check() {
    cd "${srcdir}/${_pkgname}"

    go test ./...
}

package() {
    cd "${srcdir}/${_pkgname}"

    install -D -m755 build/kprompt "${pkgdir}/usr/bin/kprompt"

    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 NOTICE "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
    install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    local _shell
    for _shell in bash zsh fish; do
        build/kprompt completion "${_shell}" > "build/completion.${_shell}"
    done

    install -D -m644 build/completion.bash \
        "${pkgdir}/usr/share/bash-completion/completions/kprompt"
    install -D -m644 build/completion.zsh \
        "${pkgdir}/usr/share/zsh/site-functions/_kprompt"
    install -D -m644 build/completion.fish \
        "${pkgdir}/usr/share/fish/vendor_completions.d/kprompt.fish"
}
