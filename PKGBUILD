# Maintainer: karboncore

pkgname=netns-exec-git
pkgver=4.aa346fd
pkgrel=1
pkgdesc="Run commands in a network namespace as a normal user"
arch=(x86_64)
url="https://github.com/pekman/netns-exec"
license=(GPL)
depends=(glibc)
makedepends=(git)
optdepends=('socat: for dbus proxy')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=("git+https://github.com/pekman/netns-exec.git"
        "git+https://git.kernel.org/pub/scm/network/iproute2/iproute2.git")
sha256sums=(SKIP
            SKIP)

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  cp -r ../iproute2 ./
  rm -r ../iproute2
  sed -ni '/int netns_id_from_name/q;p' iproute2/lib/namespace.c
}

build() {
  cd "$srcdir/${pkgname%-git}"
  make
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -Dm4755 "$srcdir/${pkgname%-git}/netns-exec" "$pkgdir/usr/bin/"
  install -Dm755 "$srcdir/${pkgname%-git}/netns-exec-dbus" "$pkgdir/usr/bin/"
}
