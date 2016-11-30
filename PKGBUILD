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


prepare()
{
  cd "$srcdir"

  if [[ -d "$_gitname" ]]; then
    msg "gprbuild git repository exists."
  else
    msg "Connecting to GIT server...."

    git clone "$_gitroot" "$_gitname"
    cd "$_gitname"

    git checkout 0f2542be82b7a4edd89b564205202b16a0f1dfd3
    msg "GIT checkout done or server timeout"
  fi
}


build() {
  cd "$srcdir/$_gitname"

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
