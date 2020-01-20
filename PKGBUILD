# Maintainer: jtheoof <contact@jtheoof.me>
pkgname=swappy-git
_pkgname=swappy
pkgver=r159.196f7f4
pkgrel=1
license=('MIT')
pkgdesc='Grab and edit screenshots from a Wayland compositor'
makedepends=("meson" "scdoc" "git")
depends=(
  "cairo"
  "gtk3"
  "pango"
  "wayland"
)
optdepends=(
  "libnotify"
  "wayland-protocols"
)
arch=("i686" "x86_64")
url='http://github.com/jtheoof/swappy'
source=("${pkgname%-*}::git+https://github.com/jtheoof/swappy.git")
sha1sums=('SKIP')
provides=('swappy')
conflicts=('swappy')
options=(debug !strip)

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"

  meson --prefix=/usr . build
  ninja -C build
}

package() {
  cd "${srcdir}/${_pkgname}"

  if [ -f LICENSE ]; then
    install -D -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  fi

  DESTDIR="$pkgdir/" ninja -C build install
}

