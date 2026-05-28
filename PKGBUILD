# Maintainer: David Hrabě <david.hrabe12@seznam.cz>
pkgname=awsd-git
pkgver=0.2.0.r2.g9e48453
pkgrel=2
pkgdesc="AWS Profile Switcher — interactively select and export AWS_PROFILE from ~/.aws/config"
arch=('x86_64' 'aarch64')
url="https://github.com/radiusmethod/awsd"
license=('MIT')
depends=('bash' 'glibc')
makedepends=('go>=1.23' 'git')
provides=('awsd')
conflicts=('awsd')
install=awsd.install
options=('!debug')
source=("${pkgname}::git+https://github.com/radiusmethod/awsd.git")
b2sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    git describe --long --tags --abbrev=7 2>/dev/null \
        | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
        || printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "${pkgname}"
    go mod download
}

build() {
    cd "${pkgname}"
    export CGO_ENABLED=0
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build \
        -ldflags "-X main.version=${pkgver}" \
        -o _awsd_prompt \
        ./main.go
}

check() {
    cd "${pkgname}"
    go test ./...
}

package() {
    cd "${pkgname}"
    install -Dm755 _awsd_prompt                   "${pkgdir}/usr/bin/_awsd_prompt"
    install -Dm755 scripts/_awsd                  "${pkgdir}/usr/bin/_awsd"
    install -Dm755 scripts/_awsd_autocomplete     "${pkgdir}/usr/bin/_awsd_autocomplete"
    install -Dm644 LICENSE                        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md                      "${pkgdir}/usr/share/doc/awsd/README.md"
}
