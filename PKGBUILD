# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=gnome-shell-extension-soft-brightness-git
pkgver=52.r32.gf24df9a
pkgrel=1
epoch=1
pkgdesc='Manage your display brightness via an alpha overlay (instead of the backlight).'
url='https://github.com/jkitching/soft-brightness-plus'
license=(GPL-3.0-or-later)
arch=(any)
depends=('gnome-shell>=45')
makedepends=('git' 'nodejs>=20.6.0')
source=("$pkgname::git+$url"
        # PR #80: fix shader handling of window groups.
        "pr-80.patch::$url/commit/3c8c42f497d7a04b4b5e521542f66aa3b77567bd.patch"
        # PR #81: add GNOME Shell 51 support (depends on PR #80).
        "pr-81.patch::$url/commit/1ab5b7392747771970ce0a279e709f3f3d4b252a.patch")
sha256sums=('SKIP'
            'b42b0cb12bb5493ab1e9b43618a6b4eba2109fe8882a691c774b1414d2a978b3'
            'e2d32ea6cf541651a606c0dbc776620e1009f7c167ce9a70bfcac8de3769d4c8')
_uuid="soft-brightness-plus@joelkitching.com"
_schema="org.gnome.shell.extensions.soft-brightness-plus.gschema.xml"

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$pkgname"
  patch -Np1 -i "$srcdir/pr-80.patch"
  patch -Np1 -i "$srcdir/pr-81.patch"
}

build() {
  make -C "$pkgname"
}

check() {
  make -C "$pkgname" test
}

package() {
  make -C "$pkgname" install \
    INSTALL_DIR="$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
  install -Dm644 "$pkgdir"/usr/share/gnome-shell/extensions/$_uuid/schemas/$_schema -t \
    "$pkgdir"/usr/share/glib-2.0/schemas
  rm -rf "$pkgdir"/usr/share/gnome-shell/extensions/$_uuid/schemas/
}
