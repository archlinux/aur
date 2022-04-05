# Maintainer: ForumPlayer <fp@forumplayer.dev>

pkgname=dvdts-fp-git
pkgver=r26.b763660
pkgrel=3
pkgdesc="Terminal screensaver similar to dvd bouncing logo; Uses the distro/OS name/custom text instead"
arch=('any')
license=('Unlicense')
url="https://github.com/forumplayer/dvdts"
makedepends=('git' 'go')
conflicts=("${pkgname%-fp-git}" "${pkgname%-fp-git}-git")
provides=("${pkgname%-fp-git}")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-fp-git}"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
  ##git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-fp-git}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o "${pkgname%-fp-git}" .
}

package() {
  install -v -Dm 755 "$srcdir/${pkgname%-fp-git}/${pkgname%-fp-git}" -t "$pkgdir/usr/bin"
}
