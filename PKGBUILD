# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=mastotool-git
_pkgname=mastotool
pkgver=v0.2.4.r15.g43a1766
pkgrel=1
pkgdesc="A collection of tools to work with your Mastodon account"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/muesli/${_pkgname}"
license=('MIT')
provides=($_pkgname)
conflicts=($_pkgname)
makedepends=('git' 'go')
source=("git+$url.git")
sha256sums=('SKIP')

# https://wiki.archlinux.org/title/VCS_package_guidelines
pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/-/.r/;s/-/./'
}

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
  install -Dm755 "${srcdir}/${_pkgname}/$_pkgname" "${pkgdir}/usr/bin/$_pkgname"
}
