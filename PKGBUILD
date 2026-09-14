# Maintainer: Oleh Sheremeta <me@olehsheremeta.com>
pkgname=simple-pomodoro
pkgver=1.3.r2.g0c1ee12
pkgrel=1
pkgdesc="Simple to use Qt6 Pomodoro timer"
arch=('x86_64')
url="https://github.com/spikest3r/Pomodoro"
license=('GPL-3.0')

depends=('qt6-base')
makedepends=('qt6-base' 'git')

source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "Pomodoro"
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
    || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "Pomodoro"
  /usr/lib/qt6/bin/qmake PREFIX=/usr CONFIG+=release
  make -j$(nproc)
}

package() {
  cd "Pomodoro"
  make INSTALL_ROOT="$pkgdir" install

  # Move binary to /usr/bin
  install -Dm755 "$pkgdir/opt/PomodoroTimer/bin/PomodoroTimer" \
                 "$pkgdir/usr/bin/simple-pomodoro"

  # Remove the /opt mess
  rm -rf "$pkgdir/opt"
}
