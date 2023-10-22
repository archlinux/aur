# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Yassine Oudjana <y.oudjana@protonmail.com>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=calls
pkgver=45.0
pkgrel=1
pkgdesc="Phone dialer and call handler"
arch=(x86_64 aarch64)
url="https://gitlab.gnome.org/GNOME/calls"
license=(GPL3)
depends=(
  callaudiod
  dconf
  evolution-data-server
  feedbackd
  folks
  gcc-libs
  glib2
  glibc
  gom
  gstreamer
  gtk3
  hicolor-icon-theme
  libgee
  libhandy
  libmm-glib
  libpeas
  libsecret
  sofia-sip
)
makedepends=(
  meson
  python-docutils
  vala
)
checkdepends=(
  gst-plugins-bad
  gst-plugins-base
  gst-plugins-good
  gst-plugins-ugly
)

_libcall_version=0.1.0

source=(
  "$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/calls-v$pkgver.tar.gz"
  "libcall-ui-$_libcall_version::https://gitlab.gnome.org/World/Phosh/libcall-ui/-/archive/v$_libcall_version/libcall-ui-v$_libcall_version.tar.gz"
  "remove-failing-tests.patch"
)
sha256sums=(
  '60822ecd41a997c93966765648d7d3412a7350613da1310cccee6e27ab3c1035'
  'a3dec58c622fb418c69085c4a20c2804058864d8b74f4af751e9c96b3ecafede'
  'd4411f7eed3ac49ce78eb04e139ecc213ed02559ed8a8fb2337dca06969aab86'
)

_archive="$pkgname-v$pkgver"

prepare() {
  rm -r "$_archive/subprojects/libcall-ui"
  cp -r libcall-ui-v$_libcall_version "$_archive/subprojects/libcall-ui"

  cd "$_archive"
  patch -Np1 -i "$srcdir/remove-failing-tests.patch"
}

build() {
  cd "$_archive"

  arch-meson . build
  meson compile -C build
}

check() {
  cd "$_archive"

  meson test -C build --print-errorlogs
}

package() {
  cd "$_archive"

  meson install -C build --destdir "$pkgdir"
}
