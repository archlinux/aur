# Maintainer: jenya sovetkin <e dot sovetkin at gmail>

pkgname=hyprspace-git
pkgver=v0.1.6.r7.c81dcf2
pkgrel=2
pkgdesc="A Lightweight VPN Built on top of Libp2p for Truly Distributed Networks"
arch=('any')
url="https://github.com/hyprspace/hyprspace"
license=('Apache')
depends=('go')
makedepends=('git')
source=('hyprspace@.service'
        "$pkgname::git+https://github.com/hyprspace/hyprspace")
sha1sums=('5bb28108bcddb56d5e3d031bd459ff4de9336b98'
          'SKIP')

pkgver() {
    cd "$pkgname"
    local tag=$(git tag --sort=-v:refname | grep '^v[0-9]' | head -1)
    local commits_since=$(git rev-list $tag..HEAD --count)
    local pkgtag=$(echo "$tag" | tr '-' '.')
    echo "$pkgtag.r$commits_since.$(git log --pretty=format:'%h' -n 1)"

}

prepare() {
    cd "$pkgname"
    mkdir -p build/
}

build() {
    cd "$pkgname"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o build
}

# check() {
#     cd "$pkgname"

#     go test
# }

package() {
  cd "$pkgname"

  install -Dm755 "build/hyprspace" "$pkgdir/usr/bin/hyprspace"
  install -Dm644 "$srcdir/hyprspace@.service" "$pkgdir/usr/lib/systemd/system/hyprspace@.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
