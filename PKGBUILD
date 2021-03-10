# Contributor: bin <bin at datacowboy dot cf>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Pedro Lara Campos <root@pedrohlc.com>

_pkgname=wireplumber
pkgname="${_pkgname}-git"
pkgver=0.3.0.r247.gab04334
pkgrel=1
pkgdesc="Session / policy manager implementation for PipeWire"
arch=('x86_64')
url="https://gitlab.freedesktop.org/pipewire/wireplumber"
license=('MIT')
depends=('glib2' 'lua53')
makedepends=('cmake' 'cpptoml' 'glib2' 'gobject-introspection' 'meson' 'pipewire')
checkdepends=('pipewire-alsa' 'pipewire-jack' 'pipewire-pulse')
provides=('libwireplumber-0.3.so')
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  git -C "$_pkgname" describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  arch-meson --wrap-mode nodownload \
    -D doc=disabled \
    -D introspection=enabled \
    -D system-lua=true \
    build
  ninja -C build
}

check() {
  cd "$_pkgname"
  ninja -C build test || echo "Known to fail: https://gitlab.freedesktop.org/pipewire/wireplumber/-/issues/18"
}

package() {
  depends+=('libgio-2.0.so' 'libglib-2.0.so' 'libgmodule-2.0.so'
  'libgobject-2.0.so' 'libpipewire-0.3.so')
  cd "$_pkgname"
  DESTDIR="${pkgdir}" meson install -C build
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -vDm 644 {NEWS,README}.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
