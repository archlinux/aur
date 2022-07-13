# Contributor: aksr <aksr at t-com dot me>
# Maintainer: naruto522ru <itachi522ru@gmail.com>
# Contributor: error_Ident <>

pkgname=wingo-git
pkgver=r434.30b336c
pkgrel=2
pkgdesc="A fully-featured window manager written in Go."
arch=('i686' 'x86_64')
url="https://github.com/BurntSushi/wingo"
license=('WTFPL')
makedepends=('git' 'go')
install=${pkgname}.install
source=("git+${url}.git")
sha256sums=("SKIP")

pkgver() {
  cd "${srcdir}/wingo/"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/wingo/"
  go mod init "${url#https://}" # strip https:// from canonical URL
  go mod tidy
}

build() {
  cd "${srcdir}/wingo/"
  mkdir build
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o ./build/wingo
#Wingo-cmd build
  cd wingo-cmd
  go build -o ../build/wingo-cmd
}

package() {
  cd "${srcdir}/wingo"
  install -Dm755 build/wingo "$pkgdir/usr/bin/wingo"
  install -Dm755 build/wingo-cmd "$pkgdir/usr/bin/wingo-cmd"
  install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname%-*}/README.md"
  install -Dm644 COMPLIANCE "$pkgdir/usr/share/doc/${pkgname%-*}/COMPLIANCE"
  install -Dm644 HOWTO-COMMANDS "$pkgdir/usr/share/doc/${pkgname%-*}/HOWTO-COMMANDS"
  install -Dm644 HOWTO-CONFIGURE "$pkgdir/usr/share/doc/${pkgname%-*}/HOWTO-CONFIGURE"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/${pkgname%-*}/COPYING"
  mkdir -p $pkgdir/{/usr/share/${pkgname%-*},etc/xdg/${pkgname%-*}}
  cp config/*.wini "$pkgdir/etc/xdg/${pkgname%-*}"
  cd data
  cp *.png "$pkgdir/usr/share/${pkgname%-*}"
  install -Dm644 wingo.wav "$pkgdir/usr/share/${pkgname%-*}/wingo.wav"
  install -Dm644 DejaVuSans.ttf "$pkgdir/usr/share/${pkgname%-*}/DejaVuSans.ttf"
  install -Dm644 archlinux/wingo-git/wingo.desktop "$pkgdir/usr/share/xsessions/wingo.desktop"
}
