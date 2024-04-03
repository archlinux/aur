# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Yassine Oudjana <y.oudjana@protonmail.com>
# Contributor: Philip Goto <philip.goto@gmail.com>
# Contributor: GI Jack <GI_Jack@hackermail.com>

pkgname=gnome-calls
_pkgname=calls
pkgver=46.0
_commit=db9b771c19a22cf1ee46e1bce60c69a6c4c0e155
pkgrel=3
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
  python-packaging
  vala
)
checkdepends=(
  gst-plugins-bad
  gst-plugins-base
  gst-plugins-good
  gst-plugins-ugly
)
conflicts=(calls)
replaces=(calls)
source=(
  "git+$url.git#commit=$_commit"
  "git+https://gitlab.gnome.org/World/Phosh/libcall-ui.git"
  "remove-failing-tests.patch"
)
sha256sums=(
  'c2b5fb64ad752fccf0956d339a24e0cc80dc24769a99bbce8095d54a3f50f24c'
  'SKIP'
  'd4411f7eed3ac49ce78eb04e139ecc213ed02559ed8a8fb2337dca06969aab86'
)

_archive="$_pkgname"

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
