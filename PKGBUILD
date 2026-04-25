# Maintainer: Sandwich <sandwich@archworks.co>
pkgname=mautrix-teams
pkgver=26.04.2
pkgrel=1
pkgdesc="A Matrix-Microsoft Teams puppeting bridge"
arch=('x86_64' 'aarch64')
url="https://github.com/YourSandwich/mautrix-teams"
license=('AGPL-3.0-or-later')
depends=('libolm')
makedepends=('go' 'git')
optdepends=('ffmpeg: voice message and video transcoding')
backup=('etc/mautrix-teams/mautrix-teams.yaml'
        'etc/mautrix-teams/registration.yaml')
install=mautrix-teams.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'mautrix-teams.service'
        'mautrix-teams.sysusers'
        'mautrix-teams.tmpfiles')
sha256sums=('SKIP'
            'aacb178c68e066e344a66a852fac5ee0bddb4ba5c28d3fe12dd5b3a38926444f'
            '06455386eb56393054ae9b467ebe9d78026d0e92d07e58040e6afd7ffaf0a0ba'
            '17c329e362b7caa7670f063461324db6f625b98043bad82b6c2db7544a37802c')

prepare() {
  cd "$pkgname-$pkgver"
  mkdir -p build
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  ./build.sh -o build/mautrix-teams
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/mautrix-teams "$pkgdir/usr/bin/mautrix-teams"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 LICENSE.exceptions "$pkgdir/usr/share/licenses/$pkgname/LICENSE.exceptions"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 ROADMAP.md "$pkgdir/usr/share/doc/$pkgname/ROADMAP.md"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"

  install -Dm644 "$srcdir/mautrix-teams.service" "$pkgdir/usr/lib/systemd/system/mautrix-teams.service"
  install -Dm644 "$srcdir/mautrix-teams.sysusers" "$pkgdir/usr/lib/sysusers.d/mautrix-teams.conf"
  install -Dm644 "$srcdir/mautrix-teams.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/mautrix-teams.conf"

  install -dm755 "$pkgdir/etc/mautrix-teams"
}
