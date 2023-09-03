# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Eric Toombs
# Contributor: Joel Teichroeb <joel@teichroeb.net>
# Contributor: Sébastien Luttringer
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

_basename=weston
pkgname="$_basename-git"
pkgver=12.0.0.r325.g68e2a60
pkgrel=1
pkgdesc='Reference implementation of a Wayland compositor'
arch=('x86_64')
url='https://wayland.freedesktop.org/'
license=('MIT')
depends=('glibc' 'wayland' 'libxkbcommon' 'libinput' 'libunwind' 'pixman'
         'libdrm' 'pam' 'systemd-libs' 'cairo' 'libpng' 'libjpeg-turbo' 'libwebp'
         'mesa' 'libegl' 'libgles' 'glib2' 'pango' 'lcms2' 'mtdev' 'libx11'
         'libxcb' 'dbus' 'libva' 'libxcursor' 'colord' 'seatd'
         'gstreamer' 'gst-plugins-base-libs')
makedepends=('wayland-protocols-git' 'meson' 'ninja' 'freerdp' 'neatvnc' 'libpipewire'
             'xorg-xwayland' 'xcb-util-cursor' 'git')
conflicts=("$_basename")
provides=("$_basename")
options=(!lto)
source=("git+https://gitlab.freedesktop.org/wayland/${_basename}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_basename"
  git describe --tags --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_basename
  # apply patch from the source array (should be a pacman feature)
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done
}

build() {
  arch-meson $_basename build \
    --libexec=lib/weston -D b_lto=false
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  # license
  install -Dm644 $_basename/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
