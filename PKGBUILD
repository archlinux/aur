# Maintainer: Zadkiel AHARONIAN <hello@zadkiel.fr>
# Repository: https://github.com/aslafy-z/aur-packages

# No `# renovate:` annotation: pkgver() derives the version from the checkout at
# build time, so there is no pinned version for Renovate to bump.
pkgname=kprompt-dash-git
_pkgname=kprompt-dash
pkgver=0.1.0.r0.g96f5e58
pkgrel=1
pkgdesc='Localhost read-only Kubernetes inventory UI for kprompt'
arch=('x86_64' 'aarch64')
url='https://github.com/kprompt/kprompt-dash'
license=('Apache-2.0')
depends=('glibc')
makedepends=('git' 'go')
provides=("kprompt-dash=${pkgver%%.r*}")
conflicts=('kprompt-dash')
optdepends=('xdg-utils: open the UI in a browser with --open')
# -trimpath rewrites every source path out of the binary, leaving the debug
# package with an empty usr/src/debug and a build-id symlink to nothing.
options=('!debug')
source=("${_pkgname}::git+https://github.com/kprompt/kprompt-dash.git")
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
        -ldflags '-linkmode=external' \
        -o build/kprompt-dash \
        ./cmd/kprompt-dash
}

check() {
    cd "${srcdir}/${_pkgname}"

    go test ./...
}

package() {
    cd "${srcdir}/${_pkgname}"

    install -D -m755 build/kprompt-dash "${pkgdir}/usr/bin/kprompt-dash"

    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
