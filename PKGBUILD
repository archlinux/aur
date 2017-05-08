# Maintainer: Your Name <youremail@domain.com>
pkgname=env-modules-tcl
pkgver=1.832
pkgrel=5
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
         '1291b8c3433ccd5272615d2a16b551b5')

moduledir=modules-tcl

install_prefix=/usr
config_path=/etc

backup=("${config_path:1}/$moduledir/init/modulerc")

build() {
    cd modules-tcl-$pkgver
    patch -p1 < ../zshcomp.patch
    ./configure                                              \
        --prefix=$install_prefix                             \
        --docdir=$install_prefix/doc/$moduledir              \
        --initdir=$config_path/$moduledir/init               \
        --modulefilesdir=$config_path/$moduledir/modulefiles \
        --disable-set-binpath --disable-set-manpath

    make
}

package() {
  cd "modules-tcl-$pkgver"
  make DESTDIR="$pkgdir/" install

  _profiled="$pkgdir/etc/profile.d/"
  mkdir -p "$_profiled"
  ln -s $config_path/$moduledir/init/profile.csh $_profiled/env-modules-tcl.csh
  ln -s $config_path/$moduledir/init/profile.sh  $_profiled/env-modules-tcl.sh
}
