# Maintainer: Gunar C. Gessner <gunargessner@gmail.com>
_pkgname="alva"
pkgname="${_pkgname}-git"
pkgver=v0.8.0
pkgrel=1
pkgdesc="Create living prototypes with code components."
arch=("i686" "x86_64")
url="https://meetalva.io"
license=('MIT')
groups=()
depends=(gconf libxss nss gtk3 electron)
makedepends=(git npm nodejs)
optdepends=()
provides=(alva)
conflicts=(alva)
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}::git+http://github.com/meetalva/${_pkgname}.git")
noextract=()
md5sums=(SKIP)

# https://wiki.archlinux.org/index.php/VCS_package_guidelines
pkgver() {
  cd "$srcdir/$pkgname"
# Use latest tag
  git tags|tail -n 1
}

build() {
  cd "$pkgname"
  last_tag=$( git tags|tail -n 1 )
  git checkout $last_tag
  npm install
  npm run build
  npm run build:electron || true
}

package() {
  # enter git repo
  cd "$pkgname" 

  # copy license
  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

  # copy electron resources
  mkdir -p "${pkgdir}/usr/share/"
  cp -f dist/linux-unpacked/resources/app.asar "${pkgdir}/usr/share/alva.asar"

  # create run script
  mkdir -p "${pkgdir}/usr/bin"
  printf '%s\n' \
  '#!/bin/sh' \
  'exec electron /usr/share/alva.asar "$@"' \
  > "$pkgdir/usr/bin/alva"
  chmod a+x "$pkgdir/usr/bin/alva"
}
