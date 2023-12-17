# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>

pkgname=k3s-git
pkgver=1.28.4+k3s2+r8+g231cb6ed20
pkgrel=1
pkgdesc='Lightweight Kubernetes'
arch=(x86_64)
url='https://k3s.io'
license=(Apache)
makedepends=(git go)
provides=(k3s)
conflicts=(k3s)
backup=(
  etc/systemd/system/k3s.service.env
)
source=(
  "git+https://github.com/k3s-io/k3s"
  'k3s.service.env'
)
sha256sums=(
  'SKIP'
  '667199fa6b811dde3aef3e626e2695a566ad64c9a03d19d0c94a1f104a7612d0'
)

pkgver() {
  cd k3s
  git describe --long --tags | sed 's/^v//;s/[^-]*-g/r&/;s/-/+/g'
}

build() {
  cd k3s
  mkdir -p build/data
  make download
  make generate
  make
}

package() {
  cd k3s

  install -Dm755 \
    dist/artifacts/k3s \
    dist/artifacts/hyperkube \
    -t "$pkgdir/usr/bin"

  install -Dm644 \
    k3s.service \
    -t "$pkgdir/usr/lib/systemd/system"

  install -Dm644 \
    k3s-rootless.service \
    -t "$pkgdir/usr/lib/systemd/user"

  install -Dm600 \
    "$srcdir/k3s.service.env" \
    -t "$pkgdir/etc/systemd/system"

  install -Dm644 \
    LICENSE \
    -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
