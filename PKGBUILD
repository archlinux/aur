# Maintainer: lightjunction
pkgname=lab-safety-system-git
pkgver=0.1.0.r26.g8296e6c
pkgrel=1
pkgdesc="Laboratory safety management information system"
arch=('x86_64' 'aarch64')
url="https://github.com/LIghtJUNction/lab-safety-system"
license=('AGPL-3.0-only')
depends=('gcc-libs' 'glibc' 'ca-certificates')
makedepends=('cargo' 'git' 'npm')
optdepends=(
  'postgresql: database server when running locally'
  'nginx: optional reverse proxy'
)
provides=('lab-safety-system')
conflicts=('lab-safety-system')
source=(
  "git+https://github.com/LIghtJUNction/lab-safety-system.git"
  "lab-safety-system.service"
  "lab-safety-system.env"
  "lab-safety-system.tmpfiles"
  "lab-safety-system.sysusers"
)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')
options=('!lto')

pkgver() {
  cd lab-safety-system
  git describe --long --tags --always | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
  cd lab-safety-system
  git submodule update --init --recursive
  cargo fetch --locked
  npm --prefix frontend ci
}

build() {
  cd lab-safety-system
  cargo build --release --locked
  npm --prefix frontend run build
}

package() {
  cd lab-safety-system

  install -Dm755 target/release/lab-safety-system "$pkgdir/usr/bin/lab-safety-system"
  install -dm755 "$pkgdir/usr/share/lab-safety-system/public"
  cp -a frontend/dist/. "$pkgdir/usr/share/lab-safety-system/public/"

  install -Dm644 "$srcdir/lab-safety-system.service" \
    "$pkgdir/usr/lib/systemd/system/lab-safety-system.service"
  install -Dm644 "$srcdir/lab-safety-system.env" \
    "$pkgdir/etc/lab-safety-system/lab-safety-system.env"
  install -Dm644 "$srcdir/lab-safety-system.tmpfiles" \
    "$pkgdir/usr/lib/tmpfiles.d/lab-safety-system.conf"
  install -Dm644 "$srcdir/lab-safety-system.sysusers" \
    "$pkgdir/usr/lib/sysusers.d/lab-safety-system.conf"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
