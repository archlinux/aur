# Maintainer: Jonne Haß <me@jhass.eu>
pkgname=hub-git
pkgver=v2.7.0.r31.gddf0d825
pkgrel=1
pkgdesc="cli interface for Github"
url="https://hub.github.com"
arch=('x86_64' 'i686')
license=('MIT')
conflicts=('hub')
provides=('hub')
depends=('git')
makedepends=('go')
source=("git+https://github.com/github/hub.git")
sha256sums=('SKIP')

prepare() {
  cd "${pkgname/-git/}"
  mkdir -p "$srcdir/src/github.com/github/hub"
  cp -r . "$srcdir/src/github.com/github/hub"
  rm -rf "$srcdir/src/github.com/github/hub/.git"
  sed -i 's@.man-pages.stamp: bin/ronn@.man-pages.stamp:@;s@bin/ronn@ronn@' "$srcdir/src/github.com/github/hub/Makefile" 
}

pkgver() {
  cd "${pkgname/-git/}"
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/src/github.com/github/hub"

  export GOPATH="$srcdir"
  make -j1
  make -j1 man-pages
}

package() {
  cd "$srcdir/src/github.com/github/hub"

  make PREFIX="$pkgdir/usr" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname/-git/}/LICENSE"
  install -Dm644 etc/hub.bash_completion.sh "$pkgdir/usr/share/bash-completion/completions/hub"
  install -Dm644 etc/hub.zsh_completion "$pkgdir/usr/share/zsh/site-functions/_hub"
  install -Dm644 etc/hub.fish_completion "$pkgdir/usr/share/fish/vendor_completions.d/hub.fish"
}
