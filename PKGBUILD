# Maintainer: Sergey A. <murlakatamenka@disroot.org>

_pkgname=replay-sorcery
pkgname=$_pkgname-git
pkgver=r80.b70061f
pkgrel=3
pkgdesc="Open-source, instant-replay solution for Linux"
url="https://github.com/matanui159/ReplaySorcery"
arch=("i686" "x86_64")
license=(GPL3)
makedepends=(git cmake nasm)
provides=("$_pkgname")
source=("$_pkgname::git+${url}.git"
        "replay-sorcery.conf")
sha256sums=('SKIP'
            '47eda70a2347fcc0c020c27392e88bda93a1a6ab269ec8101bc68283105de2ba')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  git submodule update --init --recursive --depth=1
}

build() {
  cd "$srcdir/$_pkgname"
  cmake -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DRS_SYSTEMD_DIR=/usr/lib/systemd/user
  make -C build
}

package() {
  cd  "$srcdir/$_pkgname/build"

  install -Dm 755 $_pkgname "$pkgdir/usr/bin/$_pkgname"

  install -Dm 644 $_pkgname.service -t "$pkgdir/usr/lib/systemd/user/"

  install -Dm 644 "$srcdir/$_pkgname.conf" -t "$pkgdir/etc/xdg/"
}
