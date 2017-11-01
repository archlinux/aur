# Maintainer: snafu
pkgname=env-modules
pkgver=4.0.0
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
conflicts=(env-modules-tcl)
replaces=(env-modules-tcl)
options=()
install=env-modules.install
changelog=
source=("https://sourceforge.net/projects/modules/files/Modules/modules-$pkgver/modules-$pkgver.tar.gz" zshcomp.patch)
noextract=()
validpgpkeys=()
md5sums=('454dba418b1556d2fd5de753fbbabe0b'
         '2c6c0e8095d624da825e9a2938de0582')


# Install locations:
install_prefix=/usr
config_path=/etc
profiled="/etc/profile.d"
moduledir=modules

backup=("${config_path:1}/${moduledir}/init/modulerc")


prepare() {
    cd "modules-$pkgver"

    # uncomment if you don't won't the zsh-completion patch or if it doesn't work for you
    patch -p1 < ../zshcomp.patch
}

build() {
	cd "modules-$pkgver"


    # heavy-weight default -- remove examples/docs
	./configure \
        --prefix=/usr \
        --docdir=$install_prefix/share/doc/$moduledir \
        --initdir=$config_path/$moduledir/init \
		--modulefilesdir=$config_path/$moduledir/modulefiles \
		--disable-set-binpath \
		--disable-set-manpath \
		--enable-compat-version \
		--enable-example-modulefiles \
		--enable-doc-install

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
  ln -s ${config_path}/${moduledir}/init/profile-compat.csh $_profiled/env-modules.csh
  ln -s ${config_path}/${moduledir}/init/profile-compat.sh $_profiled/env-modules.sh
}

