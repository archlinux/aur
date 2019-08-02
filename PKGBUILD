# Maintainer: snafu
pkgname=(env-modules-tcl)
pkgver=4.3.0
pkgrel=1
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
install=env-modules-tcl.install
changelog=
source=("https://sourceforge.net/projects/modules/files/Modules/modules-$pkgver/modules-$pkgver.tar.gz" moduleshome.patch)
noextract=()
validpgpkeys=()
md5sums=('bc45aff23db73a38f635d3311c61ce16'
         '7e6bf66733845eb3705a0a19c029eed6'
         '6be36c0076bde45c0cc856b742ff701b')

# Install locations:
install_prefix=/usr
config_path=/etc
profiled="/etc/profile.d"
moduledir=modules

backup=("${config_path:1}/${moduledir}/init/modulerc")


prepare() {
    cd "modules-$pkgver"

    patch -p1 < ../moduleshome.patch
    patch -p1 < ../lib-makefile.in.patch
}

build() {
	cd "modules-$pkgver"

	./configure \
		--prefix="" \
		--bindir=/usr/bin \
		--libdir=/usr/$(get_libdir) \
		--libexecdir=/usr/libexec \
		--etcdir=/etc \
		--initdir=/etc/modules/init \
		--datarootdir=/usr/share \
		--mandir=/usr/share/man \
		--docdir=/usr/share/doc \
		--vimdatadir=/usr/share/vim/vimfiles \
		--modulefilesdir=/etc/modules/modulefiles \
		--disable-set-binpath \
		--disable-set-manpath \
		--disable-set-manpath \
		--disable-compat-version \
		--disable-example-modulefiles \
		--disable-doc-install \
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
  ln -s ../${moduledir}/init/profile.csh $_profiled/env-modules.csh
  ln -s ../${moduledir}/init/profile.sh $_profiled/env-modules.sh

  # Keep up with old versions:
  ln -s ./perl.pm ${pkgdir}${config_path}/${moduledir}/init/perl
  ln -s ./python.py ${pkgdir}${config_path}/${moduledir}/init/python
}

