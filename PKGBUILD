# Contributor: bin <bin at datacowboy dot cf>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Pedro Lara Campos <root@pedrohlc.com>
# Contributor: Eduard Tolosa <edu4rdshl@protonmail.com>

_pkgname=wireplumber
pkgname="${_pkgname}-git"
pkgver=0.4.4.r3.g1bdb8c2
pkgrel=1
pkgdesc="Session / policy manager implementation for PipeWire"
arch=('x86_64')
url="https://gitlab.freedesktop.org/pipewire/wireplumber"
license=('MIT')
depends=('gcc-libs' 'glibc' 'lua53' 'libgio-2.0.so' 'libglib-2.0.so'
  'libgmodule-2.0.so' 'libgobject-2.0.so' 'libpipewire-0.3.so')
makedepends=('cmake' 'cpptoml' 'glib2' 'gobject-introspection' 'meson' 'pipewire'
  'doxygen' 'glib2'  'hotdoc' 'python-breathe' 'python-sphinx_rtd_theme'
  'python-sphinx' 'systemd' 'git' 'python-lxml')
checkdepends=('pipewire-alsa' 'pipewire-jack' 'pipewire-pulse')
provides=("wireplumber=${pkgver}" 'libwireplumber-0.4.so')
conflicts=('wireplumber')
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"

  arch-meson \
    -Dsystem-lua=true \
    -Dsystemd-system-service=true \
    -Dsystemd-user-service=true \
    -Delogind=disabled \
    build

  ninja -C build
}

check() {
  cd "$_pkgname"

  ninja -C build test || echo "Known to fail: https://gitlab.freedesktop.org/pipewire/wireplumber/-/issues/18"
}

package() {
  cd "$_pkgname"

  DESTDIR="${pkgdir}" meson install -C build
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -vDm 644 {NEWS,README}.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}

