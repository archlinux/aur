# Maintainer: Matthias Loibl <mail@matthiasloibl.com>
# Maintainer: Kemal Akkoyun <kakkoyun@gmail.com>

# Feel free to send a PR to https://github.com/parca-dev/parca-archlinux

pkgname=parca
pkgver=0.20.0
pkgrel=1

pkgdesc='Continuous profiling for analysis of CPU, memory usage over time, and down to the line number.'
url='https://parca.dev'
arch=('x86_64')
license=('Apache')

makedepends=('go' 'git' 'nodejs' 'yarn')

backup=('etc/parca/parca.yml' 'etc/conf.d/parca')

source=("parca-v$pkgver.tar.gz::https://github.com/parca-dev/parca/archive/refs/tags/v${pkgver}.tar.gz"
        parca.service
        parca.sysusers
        parca.conf)

sha256sums=('8269f4d24329d873374e4c8048123d20bcea2bb31bcf8826259aa501f96c59b8'
            '7ed83cee9ef9b186fdb26e48f19d1f0d37960afe6d983341e253db6a23bf7fe6'
            '4e3462335427c83919a58c6060f194e4c45b76234b24f330a06b1ecf16789de0'
            'd917730e72fc1db483fc7a64e4ade9c4cebb91df9199b3981a3a107232602e23')

build() {
  cd $srcdir/parca-$pkgver/ui
  yarn --prefer-offline
  yarn build

  cd $srcdir/parca-$pkgver

  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external" \
    ./cmd/parca
}

check() {
  cd $srcdir/parca-$pkgver
  go test -short ./...
}

package() {
  install -Dm644 parca.service "$pkgdir"/usr/lib/systemd/system/parca.service
  install -Dm644 parca.sysusers "$pkgdir"/usr/lib/sysusers.d/parca.conf
  install -Dm644 parca.conf "${pkgdir}"/etc/conf.d/parca

  cd $srcdir/parca-$pkgver

  install -Dm755 -t "$pkgdir"/usr/bin parca
  install -Dm640 -g parca -t "$pkgdir"/etc/parca parca.yaml
  install -dm750 -o parca -g parca "$pkgdir"/var/lib/parca
}
