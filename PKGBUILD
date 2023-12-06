# Maintainer: mars <gzhqyz at gmail dot com>
# Contributor: Sébastien Luttringer <seblu@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Joel Teichroeb <joel@teichroeb.net>

pkgbase=wayland-chromium
_pkgbase=wayland
pkgname=(wayland-chromium wayland-docs-chromium)
pkgver=1.21.0
pkgrel=3
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
sha256sums=('6dc64d7fc16837a693a51cfdb2e568db538bfdc9f457d4656285bb9594ef11ac'
            'SKIP')
source=(${source[@]}
        0001-Apply-WIP-CL-from-upstream-wayland.patch
        0002-Set-the-default-max-buffer-size-to-unbounded.patch
        0003-Log-the-object-and-methods-when-marshalling-or-sendi.patch
        0004-wayland-Fix-buffer-resize-crash.patch
        0005-Only-sort-types-if-they-have-size-0.patch
        0006-connection-avoid-calling-memcpy-on-NULL-0.patch)
sha256sums=(${sha256sums[@]}
            '8e2b814e187f397d630581c10f4da6c1de412a473491b01bba1b06948c84f02d'
            '65a26422be2cd3b4ff3f3a97f35c975bee513330cba7833add465cdab29e9422'
            'a4a5b6f84ea243aec1389d16fa34cb1ab50bf71a03927ab5ee6b20271a0f1b95'
            'b6d0fdc6d081becbc08e8dd8141e9f65a3459d0662e4f5571b757ef4d2382906'
            '249ecb34ad1385440887af54a29709f68e6198257cc798773b35b4860bd6a4be'
            'bd8516b6049cdda08cef939296735ff35ce9b00be043fcf8059d8d3fa51a0cee')

prepare() {
  cd $_pkgbase-$pkgver
  patch -Np1 -i ../0001-Apply-WIP-CL-from-upstream-wayland.patch
  patch -Np1 -i ../0002-Set-the-default-max-buffer-size-to-unbounded.patch
  patch -Np1 -i ../0003-Log-the-object-and-methods-when-marshalling-or-sendi.patch
  patch -Np1 -i ../0004-wayland-Fix-buffer-resize-crash.patch
  patch -Np1 -i ../0005-Only-sort-types-if-they-have-size-0.patch
  patch -Np1 -i ../0006-connection-avoid-calling-memcpy-on-NULL-0.patch
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
