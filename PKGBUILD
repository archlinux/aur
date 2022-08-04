# Maintainer: snafu
pkgname=(env-modules-tcl)
pkgver=5.1.1
pkgrel=1
epoch=
pkgdesc="Provides for an easy dynamic modification of a user's environment via modulefile."
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/modules/"
license=('GPL2')
groups=()
depends=('tcl>=7.4' 'procps-ng')
makedepends=()
checkdepends=('dejagnu')
optdepends=()
provides=()
conflicts=(env-modules)
replaces=(env-modules)
options=()
install=env-modules-tcl.install
changelog=
source=("https://sourceforge.net/projects/modules/files/Modules/modules-$pkgver/modules-$pkgver.tar.gz")
noextract=()
validpgpkeys=()
sha256sums=('1985f79e0337f63d6564b08db0238cf96a276a4184def822bb8ad37996dc8295')

# Install locations:
install_prefix=/usr
config_path=/etc
profiled="/etc/profile.d"
moduledir=modules

backup=("${config_path:1}/${moduledir}/init/modulerc")

build() {
    cd "modules-$pkgver"

    ./configure \
        --prefix="" \
        --bindir=/usr/bin \
        --libdir=/usr/lib \
        --libexecdir=/usr/libexec \
        --etcdir=/etc \
        --initdir=/etc/modules/init \
        --with-initconf-in=initdir \
        --datarootdir=/usr/share \
        --mandir=/usr/share/man \
        --docdir=/usr/share/doc/$pkgname-$pkgver \
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

