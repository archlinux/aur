# Maintainer: sfs <sfslinux@gmail.com>

# labhotkey — upstream lxhotkey patched for labwc (GUI + CLI keybinding editor).
# The two patches and the bundled rc.xml reference doc live next to this
# PKGBUILD; keep pkgrel in sync with the labwc-patch marker embedded in
# lxhotkey-labwc.patch (currently pkgrel=33).

pkgname=labhotkey
_pkgname=lxhotkey
pkgver=0.1.2
pkgrel=33
pkgdesc='LabWC Keyboard shortcuts configurator'
arch=(x86_64)
license=(GPL-2.0-or-later)
url='https://github.com/lxde/lxhotkey'
depends=(
  glib2
  glibc
  gtk3
  libxml2
  libx11
)
makedepends=(
  git
  intltool
  pkgconf
)
provides=("lxhotkey=$pkgver")
conflicts=('lxhotkey-gtk3' 'lxhotkey')
source=(
  "git+https://github.com/lxde/lxhotkey.git#tag=$pkgver"
  lxhotkey-notshowin.patch
  lxhotkey-labwc.patch
  labwc-desktops-windows.ru.md
)
b2sums=(
  aea9a58096f46bd24eeae1e9cf592d37e929d36fac7b61a7aecaf47be3f7934e008d7b9ad467c5dc74c46593f64add84eb84774f8729f3a5e6252e849b1d303e
  9b7781504cea4c7e3af4c52da979a6b206e3678423670c70f2a3a46e74262c9ba0679cbd76534ae9039ed220885b704748665c722ad5c6feae60d30ca3415b28
  1f07880daac631b32c775b7e269127b6a314c10e679ba1e5194c15694c55f90647ecb739c98fc3075fdf27f12d611a448e9d724c229c94c37a1dccf2e45c291f
  0513e0c6853ddd1321b93782887e9034ef2218bc17c5ad0a6efdacacd344e7ef58361fcd3c3929c4bf9408ac6b7b60f38f49b53a5323a3dcf66de219eba63143
)

prepare() {
  cd $_pkgname

  # https://github.com/lxde/lxhotkey/pull/16
  git apply -3 ../lxhotkey-notshowin.patch
  git apply -3 ../lxhotkey-labwc.patch

  autoreconf -fi
}

build() {
  cd $_pkgname
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --with-gtk=3
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
  ln -sf lxhotkey "$pkgdir/usr/bin/labhotkey"
  ln -sf lxhotkey.1 "$pkgdir/usr/share/man/man1/labhotkey.1"
  install -Dm644 "$srcdir/labwc-desktops-windows.ru.md" \
    "$pkgdir/usr/share/doc/$pkgname/labwc-desktops-windows.ru.md"
}
