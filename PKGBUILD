## Maintainer: rabfulton (GitHub) <noreply@github.com>

_pkgname=traymd
pkgname=traymd-git
pkgver=0.r5.geaf8aa2
pkgrel=1
pkgdesc="Lightweight markdown notes in the system tray"
arch=('x86_64')
url="https://github.com/rabfulton/TrayMD"
license=('MIT')
depends=('gtk3' 'libayatana-appindicator')
makedepends=('git' 'gcc' 'make' 'pkgconf')
provides=('traymd')
conflicts=('traymd')
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname" || {
    echo "0.r0.g0000000"
    return
  }

  local describe
  local rev
  local hash

  describe="$(git describe --tags --long 2>/dev/null || true)"
  if [[ -n "$describe" ]]; then
    sed 's/^v//;s/-/./g' <<<"$describe"
    return
  fi

  rev="$(git rev-list --count HEAD 2>/dev/null || echo 0)"
  hash="$(git rev-parse --short HEAD 2>/dev/null || echo 0000000)"
  echo "0.r${rev}.g${hash}"
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make install DESTDIR="$pkgdir" PREFIX=/usr
}
