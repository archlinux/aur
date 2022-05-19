# Maintainer: David Herrmann <dh.herrmann@gmail.com>

_pkgorg=bus1
_pkgname=dbus-broker
pkgdesc='Linux D-Bus Message Broker'
pkgver=31.14.g5d475cf
pkgrel=1

pkgname=$_pkgname-git
arch=('x86_64')
url="https://github.com/$_pkgorg/$_pkgname"
license=('Apache')
depends=('audit>=3.0' 'expat>=2.2' 'libcap-ng>=0.6' 'linux>=4.17' 'systemd-libs>=230')
makedepends=('git' 'meson>=0.60.0' 'systemd' 'python-docutils')
provides=("$_pkgname")
conflicts=("$_pkgname")

source=("$pkgname::git+https://github.com/$_pkgorg/$_pkgname"
        "c-dvar-1::git+https://github.com/c-util/c-dvar#branch=v1"
        "c-ini-1::git+https://github.com/c-util/c-ini#branch=v1"
        "c-list-3::git+https://github.com/c-util/c-list#branch=v3"
        "c-rbtree-3::git+https://github.com/c-util/c-rbtree#branch=v3"
        "c-shquote-1::git+https://github.com/c-util/c-shquote#branch=v1"
        "c-stdaux-1::git+https://github.com/c-util/c-stdaux#branch=v1"
        "c-utf8-1::git+https://github.com/c-util/c-utf8#branch=v1")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/^v//;s/-/./g'
}

prepare() {
  cd $pkgname

  local sp
  for sp in {dvar-1,ini-1,list-3,rbtree-3,shquote-1,stdaux-1,utf8-1}; do
    ln -fs "$(realpath --relative-to "subprojects" "$srcdir/c-$sp")" "subprojects/libc$sp"
  done
}

build() {
  arch-meson $pkgname build \
    -D audit=true \
    -D docs=true \
    -D linux-4-17=true \
    -D system-console-users=gdm,sddm,lightdm,lxdm
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

# vim:set sw=2 et:
