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
_extra_ver=+18.04.20180321.1
pkgver=${_actual_ver}${_extra_ver/+/.}
pkgrel=1
pkgdesc="A set of symbols and convience functions that all indicators would like to use"
arch=(i686 x86_64)
url="https://launchpad.net/libindicator"
license=(GPL)
makedepends=(ido-ubuntu glib2 gtk2 gtk3)
groups=(unity)
source=("https://launchpad.net/ubuntu/+archive/primary/+files/${pkgbase/\-*/}_${_actual_ver}${_extra_ver}.orig.tar.gz")
sha512sums=('b415dca964225e2d8b6b8a832a5c3450f7a0c5c1461e8e8aba52464c2c30a6c7c3039e185f28dc995184dc33814c04d72177d0ad019b97739bf978012a862f98')

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
    depends=(cairo gtk2 glib2)
    conflicts=(libindicator-gtk2)
    provides=(libindicator-gtk2)

    cd build-gtk2

    make -j1 DESTDIR="${pkgdir}/" install

    # Common file that creates a conflict upon install
    rm -vf $pkgdir/usr/lib/systemd/user/indicators-pre.target
}

package_libindicator-gtk3-ubuntu() {
    pkgdesc+=" (GTK+ 3 library)"
    depends=(gtk3 glib2 ido-ubuntu)
    conflicts=(libindicator-gtk3)
    provides=(libindicator-gtk3)
    options+=(!emptydirs)

    cd build-gtk3

    make -j1 -C libindicator DESTDIR="${pkgdir}/" install
    make -j1 -C tools DESTDIR="${pkgdir}/" install

    # Identical in both packages, but Ubuntu puts it in the GTK 2 package
    rm -vf  "${pkgdir}/usr/share/libindicator/80indicator-debugging"
}
