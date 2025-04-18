# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=distro
pkgver=1.3.1
pkgrel=1
pkgdesc='Drop-in replacment for the python-distro utility, written in Go'
conflicts=(python-distro)
arch=(x86_64)
url='https://github.com/xyproto/distrodetector'
license=(BSD-3-Clause)
depends=(glibc)
makedepends=(git go)
source=("git+$url#tag=v$pkgver")
b2sums=('c921fd0c4278c2238dca1babd8b3532db268269c6ef55f244a2c0586f11c659d0de67538fb6e179d74b4864023814468fd46bf1510b18bb0e97fe7065930e2cf')

build() {
  cd "distrodetector/cmd/$pkgname"
  export LDFLAGS="$(echo $LDFLAGS | sed 's/ -Wl//g;s/,--sort-common//')"
  go build -buildmode=pie -trimpath -mod=readonly -modcacherw -ldflags="-s -w -linkmode=external -extldflags '$LDFLAGS'"
}

package() {
  install -Dm755 distrodetector/cmd/$pkgname/distro "$pkgdir/usr/bin/distro"
  install -Dm644 distrodetector/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
