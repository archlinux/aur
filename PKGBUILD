# Maintainer: fossdd <fossdd@pwned.life>
# Contributor: Remi Gacogne <rgacogne@archlinux.org>
# Contributor: Vladimir Tsanev <tsachev@gmail.com>

pkgname=hiredict-git
_pkgname=hiredict
pkgver=1.3.1.r3.g25c3d7c
pkgrel=2
pkgdesc='C client library for Redict (development version)'
arch=('x86_64')
url="https://codeberg.org/redict/$_pkgname"
license=('LGPL-3.0-or-later' 'BSD-3-Clause')
provides=($_pkgname)
conflicts=($_pkgname)
depends=('glibc')
checkdepends=('redict')
source=(git+$url.git)
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
  cd $_pkgname
  make USE_SSL=yes PREFIX=/usr
}

check() {
  cd $_pkgname
  make USE_SSL=yes check
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" PREFIX=/usr install

  mkdir -p "$pkgdir"/usr/share/licenses/$_pkgname
  cp -vr LICENSES/* "$pkgdir"/usr/share/licenses/$_pkgname
}
