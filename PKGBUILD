pkgname=chibi-cli-git
_pkgname=chibi-cli
pkgver=1.2.0.42.gb7b9f7c
pkgrel=1
pkgdesc="Chibi for AniList - A lightweight anime & manga tracker CLI app powered by AniList."
arch=('x86_64')
url="https://chibi-cli.pages.dev/"
git_url="https://github.com/CosmicPredator/chibi-cli"
license=('GPL3')
depends=('glibc')
makedepends=('git' 'go>=1.25')
provides=('chibi')
conflicts=('chibi' 'chibi-cli-bin')
options=('!debug')

source=("git+$git_url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags --long | sed 's/^v//;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"

  LATEST_TAG=$(git describe --tags)
  LDFLAGS="-X main.VERSION=${LATEST_TAG}"

  GOOS=linux GOARCH=amd64 \
    go build -ldflags="$LDFLAGS" -o chibi
}

package() {
  install -Dm755 "$srcdir/$_pkgname/chibi" "$pkgdir/usr/bin/chibi"
}
