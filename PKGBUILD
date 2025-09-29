pkgname=cosmic-applet-package-updater-git
pkgver=0.1.r3.g7cb09d9
pkgrel=1
pkgdesc="Package Updater control applet for the COSMIC panel - git"
arch=('x86_64' 'aarch64')
url="https://github.com/Ebbo/cosmic-applet-package-updater"
license=('GPL3')
provides=('cosmic-applet-package-updater')
conflicts=('cosmic-applet-package-updater')
depends=('dbus' 'openssl' 'cosmic-panel')
makedepends=('git' 'rust' 'cargo' 'just' 'clang' 'mold' 'pkgconf')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/cosmic-applet-package-updater"
  if git describe --tags --long >/dev/null 2>&1; then
    git describe --tags --long | sed 's/^v//;s/-/./g'
  else
    printf "0.1.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

prepare() {
  cd "$srcdir/cosmic-applet-package-updater"
}

build() {
  cd "$srcdir/cosmic-applet-package-updater"
  nice just build-release
}

package() {
  cd "$srcdir/cosmic-applet-package-updater"
  just rootdir="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
