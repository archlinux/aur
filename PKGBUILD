# Maintainer: Fabian Köhler fkoehler1024@gmail.com
_pkgname=lmod
pkgname=$_pkgname-git
pkgver=6.0.4.r23.gf67163f
pkgrel=3
pkgdesc="An Environment Module System based on Lua, Reads TCL Modules, Supports a Software Hierarchy"
arch=('i686' 'x86_64')
url="https://www.tacc.utexas.edu/research-development/tacc-projects/lmod"
license=('custom:lmod')
makedepends=('git' 'make')
depends=('sh' 'tcl' 'lua')
optdepends=('csh: supported shell'
            'zsh: supported shell')
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
  ./configure --prefix="$pkgdir/opt"
  make install

  install License $pkgdir/usr/share/licenses/lmod-git/LICENSE
  install $pkgdir/opt/lmod/6.0.4/share/man/cat1/module.1 $pkgdir/usr/share/man/cat1/modules.1
  rm -rf $pkgdir/opt/lmod/6.0.4/share
  install $pkgdir/opt/lmod/6.0.4/init/profile $pkgdir/etc/profile.d/modules.sh
  install $pkgdir/opt/lmod/6.0.4/init/cshrc $pkgdir/etc/profile.d/modules.csh
  install $pkgdir/opt/lmod/6.0.4/init/zsh $pkgdir/etc/profile.d/modules.zsh
}
