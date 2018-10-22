# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: rabyte <rabyte@gmail.com>
# Contributor: Johannes Krampf <wuischke@amule.org>
# Contributor: Bartłomiej Piotrowski <barthalion@gmail.com>

pkgname=midori
pkgver=0.5.11
pkgrel=10
pkgdesc='Lightweight web browser'
arch=('x86_64')
url='https://midori-browser.org/'
license=('LGPL')
depends=('aria2' 'gcr' 'gobject-introspection-runtime' 'libpeas' 'libxss' 'webkit2gtk' 'zeitgeist')
makedepends=('bzr' 'cmake' 'git' 'gobject-introspection' 'intltool' 'ninja' 'vala')
optdepends=('gst-plugins-base: HTML5 OGG videos support'
            'gst-plugins-good: HTML5 H264 and WebM videos support'
            'gst-libav: HTML5 H264 videos support')
options=('!emptydirs')
# The latest release of Midori does not build with GTK+ > 3.10.
# Using latest git commit while waiting for the next release.
source=("$pkgname::git+https://github.com/midori-browser/core.git#commit=7dab517e66475929336e80840cce2351891dd4ef")
md5sums=('SKIP')

# NOTE: Set GTK_CSD=1 for enabling client side decorations when running Midori

build() {
  mkdir -p build
  cd build
  # TODO: Check if VALA_CFLAGS is respected
  cmake "../$pkgname" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DHALF_BRO_INCOM_WEBKIT2=ON \
    -DCMAKE_C_FLAGS="$CFLAGS -fPIC -w" \
    -DVALA_CFLAGS="$CFLAGS -fPIC -w" \
    -G Ninja
  ninja
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}

# getver: launchpad.net/midori/+download
# vim: ts=2 sw=2 et:
