# Maintainer: GalaxyLJGD <pentestian [at] airmail [dot] com>
pkgname=('harmonist' 'harmonist-tk')
pkgbase=harmonist
pkgver=0.3.0
pkgrel=1
pkgdesc="A stealth coffee-break roguelike game."
arch=('x86_64')
url='https://harmonist.tuxfamily.org/index.html'
license=('ISC')
depends=('tk')
makedepends=('go')
source=("https://download.tuxfamily.org/harmonist/releases/harmonist-$pkgver.tar.gz"
        'harmonist-tk.desktop')
sha256sums=('95a294ea9a3d96d81e6a137f72411cdf05e426d58b0c9b0267fceb83ff277099'
            '9c2fd2630d6db891b975c4ceb2eaa0be1d84af714f7506ca3df8e081f47d24f0')

prepare() {
  mkdir -p "$srcdir/harmonist-$pkgver/build"
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS='-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw'
  export GOPATH="$srcdir"

  go get github.com/nsf/{gothic,termbox-go} github.com/mattn/go-runewidth

  cd "$srcdir/harmonist-$pkgver"
  go build -o build/harmonist ./...
  go build -o build/harmonist-tk --tags tk ./...
}

package_harmonist() {
  depends=('glibc')
  cd "$srcdir/harmonist-$pkgver"
  install -Dm644 harmonist.6 "$pkgdir/usr/share/man/man6/harmonist.6"
  install -Dm755 build/harmonist "$pkgdir/usr/bin/harmonist"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_harmonist-tk() {
  pkgdesc="$pkgdesc (Graphical version)"
  cd "$srcdir/harmonist-$pkgver"
  install -Dm644 harmonist.6 "$pkgdir/usr/share/man/man6/harmonist-tk.6"
  install -Dm755 build/harmonist-tk "$pkgdir/usr/bin/harmonist-tk"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/harmonist-tk.desktop" "$pkgdir/usr/share/applications/harmonist-tk.desktop"
}
