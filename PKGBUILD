# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=k3s-git
pkgver=r1.f90cbed
pkgrel=1
pkgdesc='Lightweight Kubernetes'
arch=(x86_64)
url='https://github.com/rancher/k3s'
license=(APACHE)
makedepends=(docker git go setconf)

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  git clone --depth=1 "https://github.com/rancher/k3s" $pkgname 2>/dev/null || (cd $pkgname; git fetch origin; git reset --hard origin/master)
  setconf "$pkgname/k3s.service" ExecStart '/usr/bin/k3s server'
}

build() {
  make -C $pkgname
}

package() {
  install -Dm755 $pkgname/dist/artifacts/k3s "$pkgdir/usr/bin/k3s"
  install -Dm755 $pkgname/dist/artifacts/hyperkube "$pkgdir/usr/bin/hyperkube"
  install -Dm644 $pkgname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 $pkgname/k3s.service "$pkgdir/usr/lib/systemd/system/k3s.service"
}

# vim: ts=2 sw=2 et:

