# Maintainer: mars <gzhqyz at gmail dot com>
# Contributor: Sébastien Luttringer <seblu@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Joel Teichroeb <joel@teichroeb.net>

pkgbase=wayland-chromium
_pkgbase=wayland
pkgname=(wayland-chromium wayland-docs-chromium)
pkgver=1.21.0
pkgrel=1
pkgdesc='A computer display server protocol (chromium version)'
arch=('x86_64')
url='https://wayland.freedesktop.org/'
license=('MIT')
depends=('glibc' 'libffi' 'expat' 'libxml2' 'default-cursors')
makedepends=('meson' 'libxslt' 'doxygen' 'xmlto' 'graphviz' 'docbook-xsl')
validpgpkeys=('C7223EBE4EF66513B892598911A30156E0E67611'  # Bryce Harrington
              'C0066D7DB8E9AC6844D728715E54498E697F11D7'  # Derek Foreman
              '34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48') # emersion <contact@emersion.fr>
source=("https://gitlab.freedesktop.org/wayland/wayland/-/releases/$pkgver/downloads/wayland-$pkgver.tar.xz"{,.sig})
source=(${source[@]}
        0001-Apply-WIP-CL-from-upstream-wayland.patch
        0002-Set-the-default-max-buffer-size-to-unbounded.patch)
sha256sums=('6dc64d7fc16837a693a51cfdb2e568db538bfdc9f457d4656285bb9594ef11ac'
            'SKIP'
            '4b2ae0f3c663ae82dc9c40500ebead4e2094afa074e2c4a3251cff57f97508a3'
            'ab7fdd3dfe3e9a82cc466bb095a93714fc11638392dc00d6952b61ae8ef961fe')

prepare() {
  cd $_pkgbase-$pkgver
  patch -Np1 -i ../0001-Apply-WIP-CL-from-upstream-wayland.patch
  patch -Np1 -i ../0002-Set-the-default-max-buffer-size-to-unbounded.patch
}

build() {
  arch-meson $_pkgbase-$pkgver build
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

package_wayland-docs-chromium() {
  pkgdesc+=" (documentation)"
  provides=(wayland-docs)
  conflicts=(wayland-docs)
  depends=()

  mv docs "$pkgdir/usr"
  install -Dm 644 $_pkgbase-$pkgver/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set sw=2 sts=-1 et:
