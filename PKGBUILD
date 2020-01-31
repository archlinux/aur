# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=distro
pkgver=1.2.0
pkgrel=1
pkgdesc='Drop-in replacment for the python-distro utility, written in Go'
conflicts=(python-distro)
arch=(x86_64)
url='https://github.com/xyproto/distrodetector'
license=(MIT)
makedepends=(git go)
source=("git+$url#tag=$pkgver")
sha256sums=('SKIP')

build() {
  cd "distrodetector/cmd/$pkgname"

  # Using gccgo gives a smaller size, but forces AUR users to juggle between go and gccgo, which is unfortunate
  #go build -buildmode=pie -gccgoflags="-s -w $LDFLAGS"

  go build -buildmode=pie -gcflags="all=-trimpath=$PWD" -asmflags "all=-trimpath=$PWD" -ldflags "-s -w -extldflags $LDFLAGS"
}

package() {
  install -Dm755 distrodetector/cmd/$pkgname/distro "$pkgdir/usr/bin/distro"
  install -Dm644 distrodetector/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
