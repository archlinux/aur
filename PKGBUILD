# Maintainer:
# Contributor: Jan Buchar <Teyras@gmail.com>

_gitname="krohnkite"
_pkgname="kwin-scripts-$_gitname"
pkgname="$_pkgname-git"
pkgver=0.8.2.r2.gbc6fe23
pkgrel=1
pkgdesc="A dynamic tiling extension for KWin"
url="https://github.com/esjeon/krohnkite"
license=('MIT')
arch=('any')

depends=('kwin')
makedepends=(
  'make'
  'plasma-framework5'
  'typescript'
  'p7zip'
)

if [ x"$pkgname" == x"$_pkgname" ] ; then
  # normal package
  :
else
  # git package
  makedepends+=('git')

  provides=("$_pkgname")
  conflicts=("$_pkgname")

  _pkgsrc="$_gitname"
  source=("$_pkgsrc"::"git+$url.git")
  sha256sums=('SKIP')

  pkgver() {
    cd "$_pkgsrc"
    git describe --long --tags | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
  }
fi

build() {
  cd "$_pkgsrc"

  mkdir -p "${srcdir:?}/pkg"
  HOME="${srcdir:?}/pkg" XDG_DATA_HOME= make -e install
}

package() {
  install -d "${pkgdir:?}/usr/share/kwin/scripts/$_gitname"

  cp -ra "${srcdir:?}/pkg/.local/share/kwin/scripts/$_gitname/." "${pkgdir:?}/usr/share/kwin/scripts/$_gitname/"

  install -Dm644 "${srcdir:?}/pkg/.local/share/kwin/scripts/$_gitname/metadata.desktop" "${pkgdir:?}/usr/share/kservices5/$_gitname.desktop"

  install -Dm644 "${srcdir:?}/$_pkgsrc/LICENSE" -t "${pkgdir:?}/usr/share/licenses/$pkgname/"
}
