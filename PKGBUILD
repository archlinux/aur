# Maintainer: Eric Berquist <eric DOT berquist AT gmail DOT com>
# contributor: Fabian Köhler fkoehler1024@gmail.com

_pkgname=lmod
pkgname=$_pkgname-git
pkgver=7.0.4.r0.gd7b7636
pkgrel=1
pkgdesc="An Environment Module System based on Lua, Reads TCL Modules, Supports a Software Hierarchy"
arch=('i686' 'x86_64')
url="https://www.tacc.utexas.edu/research-development/tacc-projects/lmod"
license=('custom:lmod')
makedepends=('git' 'make' 'rsync')
depends=('tcl' 'lua' 'lua-filesystem' 'lua-posix')
optdepends=('tcsh: supported shell'
            'zsh: supported shell')
options=(!emptydirs)
provides=("$_pkgname")
conflicts=('modules')
source=("$_pkgname::git+https://github.com/TACC/Lmod.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  mkdir -p $pkgdir{/opt,/etc/profile.d/,/usr/share/licenses/lmod-git/,/usr/share/man/cat1}
  cd "$srcdir/$_pkgname"

  # the Lmod build system is messed up, e.g. --mandir does not have any influence on where
  # the manpage will be stored
  ./configure \
      --prefix="/opt"

  make DESTDIR="$pkgdir" install

  # Need the main package version without git info.
  _pkgver=$(echo ${pkgver} | cut -d "." -f 1-3 -)
  install License $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install $pkgdir/opt/lmod/$_pkgver/share/man/cat1/module.1 $pkgdir/usr/share/man/cat1/modules.1
  rm -rf $pkgdir/opt/lmod/$_pkgver/share
  install $pkgdir/opt/lmod/$_pkgver/init/profile $pkgdir/etc/profile.d/modules.sh
  install $pkgdir/opt/lmod/$_pkgver/init/cshrc $pkgdir/etc/profile.d/modules.csh
  install $pkgdir/opt/lmod/$_pkgver/init/zsh $pkgdir/etc/profile.d/modules.zsh
}
