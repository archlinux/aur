# Maintainer: tinywrkb <tinywrkb@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgname=polkit
pkgname=${_pkgname}-duktape
pkgver=0.120
pkgrel=2
pkgdesc="polkit with duktape as the javascript engine"
arch=(x86_64)
license=(LGPL)
url="https://www.freedesktop.org/wiki/Software/polkit/"
depends=(glib2 pam expat systemd duktape)
makedepends=(meson gtk-doc gobject-introspection git)
checkdepends=(python-dbusmock)
conflicts=(polkit)
provides=(polkit)
backup=(etc/pam.d/polkit-1)
_commit=92b910ce2273daf6a76038f6bd764fa6958d4e8e # tags/0.120
source=("git+https://gitlab.freedesktop.org/polkit/polkit.git#commit=$_commit"
        "0001-Add-duktape-as-javascript-engine.patch")
sha256sums=('SKIP'
            'a7f8925d074c3bc42b1e3bc09305d047014fc209724e4e9609a1275bf1f3c3a8')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $_pkgname
  patch -p1 -i ../0001-Add-duktape-as-javascript-engine.patch
}

build() {
  local meson_options=(
    --prefix=/usr
    -D session_tracking=libsystemd-login
    -D os_type=redhat
    -D examples=true
    -D tests=true
    -D gtk_doc=true
    -D man=true
    -D js_engine=duktape
  )
  arch-meson polkit build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"

  install -d -o root -g 102 -m 750 "$pkgdir"/{etc,usr/share}/polkit-1/rules.d
  mv "$pkgdir"/{etc,usr/share}/polkit-1/rules.d/50-default.rules

  install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/$pkgname.conf" <<END
u polkitd 102 "PolicyKit daemon"
m polkitd proc
END
}

# vim: ts=2 sw=2 et:
