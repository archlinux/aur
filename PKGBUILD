# Maintainer: tarball <bootctl@gmail.com>
# Contributor: dalz <aur @t alsd d0t eu>

pkgname=gemget
pkgver=1.9.0
pkgrel=1
pkgdesc='Command line downloader for the Gemini protocol'
arch=('x86_64')
url='https://github.com/makew0rld/gemget'
license=('MIT')
makedepends=('go' 'git')
source=(git+$url.git#tag=v$pkgver)
sha256sums=('SKIP')

prepare() {
  cd $pkgname
  go mod download
}

build() {
  cd $pkgname
  GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw" \
    make BUILDER=gemget-AUR
}

check() {
  cd $pkgname

  # verify version
  diff \
    <(./gemget --version) \
    <(
      cat <<EOF
$pkgname v$pkgver
Commit: $(git rev-parse HEAD)
Built by: gemget-AUR
EOF
    )
}

package() {
  cd $pkgname
  install -D gemget "$pkgdir/usr/bin/gemget"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
