# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Yassine Oudjana <y.oudjana@protonmail.com>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=calls
pkgver=46.0
_commit=32c24f5468b157d8c755c79295a14958dc2f86fa
pkgrel=1
pkgdesc="Phone dialer and call handler"
arch=(x86_64 aarch64)
url="https://gitlab.gnome.org/GNOME/calls"
license=(GPL-3.0-or-later)
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
  git
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
source=(
  "git+$url.git#commit=$_commit"
  "git+https://gitlab.gnome.org/World/Phosh/libcall-ui.git"
  "remove-failing-tests.patch"
)
sha256sums=(
  'SKIP'
  'SKIP'
  'd4411f7eed3ac49ce78eb04e139ecc213ed02559ed8a8fb2337dca06969aab86'
)

_archive="$pkgname"

pkgver() {
  cd "$_archive"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$_archive"

  git submodule init
  git config submodule.subprojects/libcall-ui.url "$srcdir/libcall-ui"
  git -c protocol.file.allow=always submodule update

  patch --forward --strip=1 --input="$srcdir/remove-failing-tests.patch"
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
