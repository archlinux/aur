# Maintainer: Your Name <youremail@domain.com>
pkgname=env-modules-tcl
pkgver=1.832
pkgrel=4
epoch=
pkgdesc="Provides for an easy dynamic modification of a user's environment via modulefile (tcl-only-version)."
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/modules/"
license=('GPLv2')
groups=()
depends=('tcl>=7.4')
makedepends=()
checkdepends=('dejagnu')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://sourceforge.net/projects/modules/files/Modules-Tcl/modules-tcl-$pkgver.tar.gz" "zshcomp.patch")
noextract=()
validpgpkeys=()
install="env-modules-tcl.install"
md5sums=('3a40bf6177cc438481672ce028544828'
         '4b7a5d66a1668fac5b3837723edceea4')

install_prefix=/usr

build() {
    cd modules-tcl-$pkgver
    patch -p1 < ../zshcomp.patch
    ./configure                                                  \
        --prefix=$install_prefix                                 \
        --docdir=$install_prefix/doc/modules-tcl                 \
        --initdir=$install_prefix/env-modules/init               \
        --modulefilesdir=$install_prefix/env-modules/modulefiles \
        --disable-set-binpath --disable-set-manpath

    make
}

package() {
  cd "modules-tcl-$pkgver"
  make DESTDIR="$pkgdir/" install

  _profiled="$pkgdir/etc/profile.d/"
  mkdir -p "$_profiled"
  ln -s $install_prefix/env-modules/init/profile.csh $_profiled/env-modules-tcl.csh
  ln -s $install_prefix/env-modules/init/profile.sh $_profiled/env-modules-tcl.sh
}
