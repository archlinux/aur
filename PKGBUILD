# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=mastotool-git
_pkgname=mastotool
pkgver=0.2.4.43a1766
pkgrel=1
pkgdesc="A collection of tools to work with your Mastodon account"
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/muesli/${_pkgname}"
license=('MIT')
provides=($_pkgname)
conflicts=($_pkgname)
makedepends=('git' 'go')
source=("git+$url.git")
sha256sums=('SKIP')

prepare() {
    export GOPATH="$srcdir/gopath"
    go clean -modcache
}

build() {
    cd "$_pkgname"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"

    go build \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -ldflags "-X main.Version=$pkgver -linkmode external -extldflags \"${LDFLAGS}\"" \
        -o "$_pkgname" .

    go clean -modcache
}

package() {
  install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm755 "${srcdir}/${_pkgname}/$_pkgname" "${pkgdir}/opt/${_pkgname}/$_pkgname"

  # links binary to /usr/bin
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/$_pkgname "${pkgdir}/usr/bin"
}
