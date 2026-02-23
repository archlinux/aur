# Maintainer: Carlo Wood <carlo@alinoe.com>

pkgname=remountd-git
pkgver=r47.c930ff2
pkgrel=1
pkgdesc="Daemon to remount preconfigured mount points ro/rw; from an unprivileged client."
arch=('x86_64')
options=(!debug)
url="https://github.com/CarloWood/remountd.git"
license=('MIT')
depends=('systemd-libs')
backup=(
  'etc/remountd/config.yaml'
)
source=("$pkgname::git+$url"
        "$pkgname.install")
sha256sums=('SKIP' '420b484254f4f743db0adf1214c29fb9647e2fe2a8b4862bbbc64a16d0e744e5')
install="${pkgname}.install"

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$pkgname"
  git submodule update --init --recursive
}

build() {
  cmake -B build -S "$pkgname" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
