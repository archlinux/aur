# Maintainer: Jean-Michaël Celerier <jeanmichael.celerier at gmail dot com>
pkgname=jamomacore-git
pkgver=1.0b1
pkgrel=1
pkgdesc="The Jamoma Frameworks"
arch=('x86_64')
url="http://www.jamoma.org"
license=('BSD')
groups=()
makedepends=('ninja' 'cmake')
depends=('portaudio' 'libxml2')
makedepends=('git')
provides=('jamomacore')
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()


_gitroot=https://github.com/Jamoma/JamomaCore
_gitname=JamomaCore
_gitbranch=master

build() {
  cd "$srcdir"

  if [[ -d "$_gitname" ]]; then
    (
      cd "$_gitname"
      git pull
    )
  else
    git clone "$_gitroot" "$_gitname"
    (
      cd "$_gitname"
      git checkout "$_gitbranch"
    )
  fi

  mkdir -p "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  cmake -GNinja "$srcdir/$_gitname"
  ninja
}

package() {
  cd "$srcdir/$_gitname-build"
  ninja DESTDIR="$pkgdir/" install
  install -D -m644 "$srcdir/$_gitname/License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
