# Maintainer: Pierre-Marie de Rodat <pmderodat@kawie.fr>
# Contributor: Rod Kay <charlie5 on #ada at freenode.net>

pkgname=libgpr
pkgver=1
pkgrel=1
pkgdesc="Ada library to handle GPRbuild project files"

arch=('i686' 'x86_64')
url="https://github.com/AdaCore/gprbuild"
license=('GPL')

depends=('gcc-ada' 'gcc-libs')
makedepends=('git' 'gcc-ada' 'gprbuild')

source=()
sha256sums=()

_gitroot='https://github.com/AdaCore/gprbuild.git'
_gitname='gprbuild'


library_kinds="static shared"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
    cd "$_gitname"
  fi

  msg "GIT checkout done or server timeout"

  for k in $library_kinds
  do
    make libgpr.build.$k
  done
}


package() {
  cd "$srcdir/$_gitname"
  for k in $library_kinds
  do
    make libgpr.install.$k "prefix=$pkgdir/usr"
  done
}
