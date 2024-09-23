# Maintainer: Echo J. <aidas957 at gmail dot com>
# Contributor: mars <gzhqyz at gmail dot com>
# Contributor: Sébastien Luttringer <seblu@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Joel Teichroeb <joel@teichroeb.net>

pkgbase=wayland-chromium
_pkgbase=wayland
pkgname=(wayland-chromium wayland-chromium-docs)
pkgver=1.23.1
pkgrel=1
pkgdesc='A computer display server protocol (with Chromium patches)'
arch=('x86_64')
url='https://wayland.freedesktop.org/'
license=('MIT')
depends=('glibc' 'libffi' 'expat' 'libxml2' 'default-cursors')
makedepends=('meson' 'libxslt' 'doxygen' 'xmlto' 'graphviz' 'docbook-xsl')
validpgpkeys=('C7223EBE4EF66513B892598911A30156E0E67611'  # Bryce Harrington
              'C0066D7DB8E9AC6844D728715E54498E697F11D7'  # Derek Foreman
              '34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48') # emersion <contact@emersion.fr>
source=("https://gitlab.freedesktop.org/wayland/wayland/-/releases/$pkgver/downloads/wayland-$pkgver.tar.xz"{,.sig})
sha256sums=('864fb2a8399e2d0ec39d56e9d9b753c093775beadc6022ce81f441929a81e5ed'
            'SKIP')
source+=(0002-Set-the-default-max-buffer-size-to-unbounded.patch
         0003-Log-the-object-and-methods-when-marshalling-or-sendi.patch)
sha256sums+=('9a35928d3c7461ccae37327a210c7c7ade9159f7cc8138ba3ba04e9d312d659f'
             'a4a5b6f84ea243aec1389d16fa34cb1ab50bf71a03927ab5ee6b20271a0f1b95')

prepare() {
  cd $_pkgbase-$pkgver
  patch -Np1 -i ../0002-Set-the-default-max-buffer-size-to-unbounded.patch
  patch -Np1 -i ../0003-Log-the-object-and-methods-when-marshalling-or-sendi.patch
}

build() {
  arch-meson --reconfigure $_pkgbase-$pkgver build
  meson compile -C build
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
