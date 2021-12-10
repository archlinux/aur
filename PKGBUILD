# Maintainer: Alisson Lauffer <alissonvitortc@gmail.com>

_pkgname=telegrand
pkgname=telegrand-git
pkgver=r540.8a3e152
pkgrel=1
pkgdesc='A Telegram client for GNOME'
arch=(x86_64)
url='https://github.com/melix99/telegrand'
license=(GPL3)
depends=(gtk4 gst-plugins-base-libs gst-plugins-bad libadwaita libtd-dev)
makedepends=(git meson rust)
provides=(telegrand)
conflicts=(telegrand)
source=('git+https://github.com/melix99/telegrand.git'
        'revert-unstable-changes.patch')
sha256sums=('SKIP'
            'abd58ae53f372ad2410f7c7216bf914e6795b16c6d4a42500d4c48a2bdb860b6')
pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # Temporarily revert unstable requirements and features, making it work with non-git packages
  cd "$_pkgname"
  patch --forward --strip=1 --input="${srcdir}/revert-unstable-changes.patch"
}

build() {
  arch-meson "$_pkgname" build \
    -Dtg_api_id=611335 \
    -Dtg_api_hash=d524b414d21f4d37f08684c1df41ac9c

  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}
