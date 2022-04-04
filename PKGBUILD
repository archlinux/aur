# Maintainer: Pavle Portic <archlinux@theedgeofrage.com>

pkgname=zeitgeist-dependencies-git
name=zeitgeist
pkgver=349.0c1ed03
pkgrel=1
pkgdesc='The language-agnostic dependency checker'
arch=('x86_64')
url='https://github.com/kubernetes-sigs/zeitgeist'
license=('Apache')
makedepends=('go')
source=("$pkgname"::git+https://github.com/kubernetes-sigs/zeitgeist)
sha256sums=('SKIP')
conflicts=("zeitgeist-dependencies")
options=(!lto)

pkgver() {
    cd "$pkgname"
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -ldflags "-X main.version=$pkgver -X main.prerelease="
}

package() {
    cd "$pkgname"
    install -Dm755 "$name" "$pkgdir"/usr/bin/"$name"
}
