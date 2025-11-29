# Maintainer: snafu
# Maintainer: Hyacinthe Cartiaux <hyacinthe dot cartiaux at free dot fr>
pkgname=env-modules
pkgver=5.6.1
pkgrel=2
pkgdesc="Provides for an easy dynamic modification of a user's environment via modulefile."
arch=('i686' 'x86_64')
url="https://envmodules.io/"
license=('GPL-2.0')
depends=('tcl>=8.5' 'procps')
makedepends=('less')
checkdepends=('dejagnu')
optdepends=('nagelfar' 'python-sphinx')
install=env-modules.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/envmodules/modules/releases/download/v${pkgver}/modules-${pkgver}.tar.gz")
sha256sums=('b175e57860e62d87b6118a79cc2d76e857e5774a9ff78558d6726122760b0034')

# Install locations:
install_prefix=/usr
config_path=/etc
profiled="/etc/profile.d"
moduledir=modules

backup=("${config_path:1}/${moduledir}/init/modulerc")

build() {
    cd "modules-$pkgver"

    conf=(
        --prefix="" \
        --bindir=/usr/bin \
        --libdir=/usr/lib \
        --libexecdir=/usr/lib/env-modules \
        --etcdir=/etc \
        --initdir=/etc/modules/init \
        --with-initconf-in=initdir \
        --with-moduleshome=/etc/modules \
        --datarootdir=/usr/share \
        --mandir=/usr/share/man \
        --docdir=/usr/share/doc/$pkgname-$pkgver \
        --vimdatadir=/usr/share/vim/vimfiles \
        --modulefilesdir=/etc/modules/modulefiles \
        --disable-set-binpath \
        --disable-set-manpath \
        --enable-example-modulefiles \
        --enable-doc-install \
    )

    if type -p nagelfar > /dev/null; then
        conf+=(
            --with-tcl-linter=$(which nagelfar)
        )
    fi

    ./configure "${conf[@]}"
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
