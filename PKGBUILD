# Maintainer:

_pkgname="annotator"
pkgname="$_pkgname-git"
pkgver=1.2.1.r55.g8c3d3cce
pkgrel=1
pkgdesc="Image annotation for Elementary OS"
url='https://github.com/phase1geo/Annotator'
license=("GPL-3.0-or-later")
arch=('aarch64' 'armv6h' 'armv7h' 'i686' 'x86_64')

depends=(
  'granite7'
  'libhandy'
  'libportal-gtk4'
)
makedepends=(
  'cmake'
  'git'
  'meson'
  'vala'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=8 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgsrc"
  meson build --prefix=/usr	
  ninja -C build
}

package() {
  cd "$_pkgsrc"
  DESTDIR="$pkgdir" ninja -C build install

  # symlink
  ln -sf "com.github.phase1geo.annotator" "$pkgdir/usr/bin/annotator"
}
