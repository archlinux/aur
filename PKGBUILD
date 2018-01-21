# Maintainer: Michael Healy <horsemanoffaith@gmail.com>
# Original Maintainer: György Balló <ballogy@freestart.hu>
# Contributor: thn81 <root@scrat>
# Contributor: Xiao-long Chen <chenxiaolong@cxl.epac.to>

# vercheck-pkgbuild: auto
# vercheck-ubuntu: name=${pkgbase}, repo=bionic
# vercheck-launchpad: name=${pkgbase}

pkgbase=libindicator-ubuntu
pkgname=(libindicator-common libindicator-gtk2-ubuntu libindicator-gtk3-ubuntu)
_actual_ver=16.10.0
_extra_ver=+18.04.20171205.1
pkgver=${_actual_ver}${_extra_ver/+/.}
pkgrel=2
pkgdesc="A set of symbols and convience functions that all indicators would like to use"
arch=(i686 x86_64)
url="https://launchpad.net/libindicator"
license=(GPL)
makedepends=(ido-ubuntu glib2 gtk2-ubuntu gtk3-ubuntu)
groups=(unity)
source=("https://launchpad.net/ubuntu/+archive/primary/+files/${pkgbase/\-*/}_${_actual_ver}${_extra_ver}.orig.tar.gz")
sha512sums=('5baa282e09a23462aedd6a3ae705232237bd171c5d66c0bc68e68ea056f9a4dee5ad61888f32bee39978f144aaf240f940b76406389559a0a4e5687c7988cb3f')

build() {
    
    export CFLAGS+=" -Wno-error=deprecated-declarations"

    autoreconf -vfi

    [[ -d build-gtk2 ]] || mkdir build-gtk2
    pushd build-gtk2
    ../configure --prefix=/usr --libexecdir=/usr/lib/${pkgbase} --with-gtk=2 --disable-static
    make -j1
    popd

    [[ -d build-gtk3 ]] || mkdir build-gtk3
    pushd build-gtk3
    ../configure --prefix=/usr --libexecdir=/usr/lib/${pkgbase} --with-gtk=3 --disable-static
    make
    popd
}

package_libindicator-common() {
    pkgdesc+=" (common files)"

    cd build-gtk3

    make -j1 -C data DESTDIR="${pkgdir}/" install
}

package_libindicator-gtk2-ubuntu() {
    pkgdesc+=" (GTK+ 2 library)"
    depends=(cairo gtk2-ubuntu glib2)
    conflicts=(libindicator-gtk2)
    provides=(libindicator-gtk2)

    cd build-gtk2

    make -j1 DESTDIR="${pkgdir}/" install

    # Common file that creates a conflict upon install
    rm -vf $pkgdir/usr/lib/systemd/user/indicators-pre.target
}

package_libindicator-gtk3-ubuntu() {
    pkgdesc+=" (GTK+ 3 library)"
    depends=(gtk3-ubuntu glib2 ido-ubuntu)
    conflicts=(libindicator-gtk3)
    provides=(libindicator-gtk3)
    options+=(!emptydirs)

    cd build-gtk3

    make -j1 -C libindicator DESTDIR="${pkgdir}/" install
    make -j1 -C tools DESTDIR="${pkgdir}/" install

    # Identical in both packages, but Ubuntu puts it in the GTK 2 package
    rm -vf  "${pkgdir}/usr/share/libindicator/80indicator-debugging"
}
