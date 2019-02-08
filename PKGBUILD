# Maintainer: snafu
pkgname=(env-modules)
pkgver=4.2.1
pkgrel=0
epoch=
pkgdesc="Provides for an easy dynamic modification of a user's environment via modulefile."
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/modules/"
license=('GPLv2')
groups=()
depends=('tcl>=7.4')
makedepends=()
checkdepends=('dejagnu')
optdepends=()
provides=()
conflicts=(env-modules)
replaces=(env-modules)
options=()
install=env-modules.install
changelog=
source=("https://sourceforge.net/projects/modules/files/Modules/modules-$pkgver/modules-$pkgver.tar.gz" zshcomp.patch)
noextract=()
validpgpkeys=()
md5sums=('f4710af570b07153c7571967441ea4fe'
         '48195d9f1c157c17b5c07e3997739f9c')

# Install locations:
install_prefix=/usr
config_path=/etc
profiled="/etc/profile.d"
moduledir=modules

backup=("${config_path:1}/${moduledir}/init/modulerc")


prepare() {
    cd "modules-$pkgver"

    # comment if you don't won't the zsh-completion patch or if it doesn't work for you
    patch -p1 < ../zshcomp.patch
}

build() {
	cd "modules-$pkgver"

	./configure \
        --prefix=/usr \
        --docdir=$install_prefix/share/doc/$moduledir \
        --initdir=$config_path/$moduledir/init \
		--modulefilesdir=$config_path/$moduledir/modulefiles \
		--disable-set-binpath \
		--disable-set-manpath \
		--enable-compat-version \
		--enable-example-modulefiles \
		--enable-doc-install \
        --without-pager

	make
}

check() {
	cd "modules-$pkgver"

    # uncomment if you run into problems... takes quite a while
	#make -j1 -k test
}

package() {
  cd "modules-$pkgver"
  make -j1 DESTDIR="$pkgdir/" install

  _profiled="${pkgdir}${profiled}"
  mkdir -p "$_profiled"
  ln -s ${config_path}/${moduledir}/init/profile.csh $_profiled/env-modules.csh
  ln -s ${config_path}/${moduledir}/init/profile.sh $_profiled/env-modules.sh

  # Work around, since module needs <PREFIX>/init for autoinitialization
  ln -s ..${config_path}/${moduledir}/init ${pkgdir}/usr/init

  # Keep up with old versions:
  ln -s ./perl.pm ${pkgdir}${config_path}/${moduledir}/init/perl
  ln -s ./python.py ${pkgdir}${config_path}/${moduledir}/init/python
}

