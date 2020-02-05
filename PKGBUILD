# Maintainer: David Herrmann <dh.herrmann@gmail.com>

_pkgorg=bus1
_pkgname=dbus-broker
pkgdesc='Linux D-Bus Message Broker'
pkgver=r1379.191f135
pkgrel=1

pkgname=$_pkgname-git
arch=('x86_64')
url="https://github.com/$_pkgorg/$_pkgname"
license=('Apache')
depends=('audit' 'expat' 'systemd-libs')
makedepends=('git' 'meson' 'systemd' 'python-docutils')
provides=("$_pkgname")
conflicts=("$_pkgname")

source=("$pkgname::git+https://github.com/$_pkgorg/$_pkgname"
        git+https://github.com/c-util/c-{dvar,ini,list,rbtree,shquote,stdaux,utf8})
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $pkgname

  git submodule init

  local sm
  for sm in c-{dvar,ini,list,rbtree,shquote,stdaux,utf8}; do
    git config --local submodule.subprojects/$sm.url "$srcdir/$sm"
  done

  git submodule update
}

build() {
  arch-meson $pkgname build \
    -D audit=true \
    -D docs=true \
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
