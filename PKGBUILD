# Maintainer: Alisson Lauffer <alissonvitortc@gmail.com>

_pkgname=paper-plane
pkgname=paper-plane-git
pkgver=0.1.0.beta.1.r0.g83df76b
pkgrel=1
pkgdesc='Chat over Telegram on a modern and elegant client'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/paper-plane-developers/paper-plane'
license=(GPL3)
depends=(gtk4-paper-plane libadwaita-git libtd-dev rlottie-paper-plane-git libtdjson.so)
makedepends=(git meson rust blueprint-compiler appstream)
provides=(paper-plane)
conflicts=(paper-plane)

source=("git+$url.git"
        "unstable-gtk-crash-fix.patch::$url/commit/dee19785c1e6a79b07f3984080f7ce18ccdfd74c.patch")
sha256sums=('SKIP'
            '10f8b9d8956d1bf44e227d99e5f9b7562c488ac4e8ace22103e9718b1100f7e9')

prepare() {
  cd "$_pkgname"

  patch --forward --strip=1 --input="$srcdir/unstable-gtk-crash-fix.patch"
}

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  # The API ID and hash provided here are for use with Paper Plane only.
  # For other projects, please get your own API ID and hash at https://my.telegram.org/apps

  arch-meson "$_pkgname" build \
    -Dtg_api_id=22303002 \
    -Dtg_api_hash=3cc0969992690f032197e6609b296599

  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}
