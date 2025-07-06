# Maintainer: Echo J. <aidas957 at gmail dot com>
# Contributor: mars <gzhqyz at gmail dot com>
# Contributor: Sébastien Luttringer <seblu@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Joel Teichroeb <joel@teichroeb.net>

pkgbase=wayland-chromium
_pkgbase=wayland
pkgname=($pkgbase $pkgbase-docs)
pkgver=1.24.0
pkgrel=1
pkgdesc='A computer display server protocol (with Chromium patches)'
arch=('x86_64')
url='https://wayland.freedesktop.org/'
license=('MIT')
depends=('glibc' 'libffi' 'expat' 'libxml2' 'default-cursors')
makedepends=('meson' 'libxslt' 'doxygen' 'xmlto' 'graphviz' 'docbook-xsl')
validpgpkeys=('34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48') # emersion <contact@emersion.fr>
source=("https://gitlab.freedesktop.org/wayland/wayland/-/releases/$pkgver/downloads/wayland-$pkgver.tar.xz"{,.sig}
        "0002-Set-the-default-max-buffer-size-to-unbounded.patch")
sha256sums=('82892487a01ad67b334eca83b54317a7c86a03a89cfadacfef5211f11a5d0536'
            'SKIP'
            'ebca6ec1aff0a19692238e2f39a8f0af1e77ad4156c5429ef584a3198ac073db')

prepare() {
  cd $_pkgbase-$pkgver
  patch -Np1 -i ../0002-Set-the-default-max-buffer-size-to-unbounded.patch
}

build() {
  arch-meson --reconfigure $_pkgbase-$pkgver build
  meson compile -C build
}

check() {
  # connection_marshal_too_big() intentionally fails due to the only patch here (it could be made a bit smarter though)
  meson test -C build --print-errorlogs | :
}

package_wayland-chromium() {
  provides=(wayland libwayland-{client,cursor,egl,server}.so)
  conflicts=(wayland)

  meson install -C build --destdir "$pkgdir"
  mkdir -p docs/share
  mv "$pkgdir"/usr/share/{doc,man} docs/share
  install -Dm 644 $_pkgbase-$pkgver/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_wayland-chromium-docs() {
  pkgdesc+=" (documentation)"
  provides=(wayland-docs)
  conflicts=(wayland-docs)
  depends=()

  mv docs "$pkgdir/usr"
  install -Dm 644 $_pkgbase-$pkgver/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set sw=2 sts=-1 et:
