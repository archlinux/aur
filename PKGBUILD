# Maintainer: Romain Dura <romain "at" shazbits "dot" com>

pkgname=beacon
pkgver=1.1.0
pkgrel=1
pkgdesc='Tiny system utility reporting CPU, memory, uptime to logs, cloudwatch, http'
arch=('x86_64')
url="https://github.com/shazbits/$pkgname"
license=('MIT')
makedepends=('go')
install=beacon.install
source=("$url/archive/v$pkgver.tar.gz"
        'beacon.service')
sha256sums=('ac309ac8419fe4ee02b204421a8462ce28308c77d9fc42358d2d94504176d1c1'
            'c1e33e6fbb2320fe0ea13e3ca95edbbf779686785a0f6304f32a49dbed97ed9f')

build() {
  cd $pkgname-$pkgver
  go build \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-extldflags $LDFLAGS" \
    -o $pkgname .
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 config.yml.example "$pkgdir/etc/beacon/config.yml"
  install -Dm644 "$srcdir/beacon.service" "$pkgdir/usr/lib/systemd/system/beacon.service"
}
