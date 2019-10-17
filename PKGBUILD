# Maintainer: snafu
pkgname=(env-modules)
pkgver=4.3.1
pkgrel=2
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
source=("https://sourceforge.net/projects/modules/files/Modules/modules-$pkgver/modules-$pkgver.tar.gz" moduleshome.patch)
noextract=()
validpgpkeys=()
md5sums=('70b5a0f6bf8771a26435661794e78b12'
         '3a3b6ba0ac0766be9ba601223baaf107')

# Install locations:
install_prefix=/usr
config_path=/etc
profiled="/etc/profile.d"
moduledir=modules

backup=("${config_path:1}/${moduledir}/init/modulerc")


prepare() {
    cd "modules-$pkgver"

    patch -p1 < ../moduleshome.patch
}

build() {
	cd "modules-$pkgver"

	./configure \
		--prefix="" \
		--bindir=/usr/bin \
		--libdir=/usr/lib \
		--libexecdir=/usr/lib/env-modules \
		--etcdir=/etc \
		--initdir=/etc/modules/init \
		--datarootdir=/usr/share \
		--mandir=/usr/share/man \
		--docdir=/usr/share/doc \
		--vimdatadir=/usr/share/vim/vimfiles \
		--modulefilesdir=/etc/modules/modulefiles \
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
  ln -s ../${moduledir}/init/profile.csh $_profiled/env-modules.csh
  ln -s ../${moduledir}/init/profile.sh $_profiled/env-modules.sh

  # Keep up with old versions:
  ln -s ./perl.pm ${pkgdir}${config_path}/${moduledir}/init/perl
  ln -s ./python.py ${pkgdir}${config_path}/${moduledir}/init/python
}

