# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Maintainer: Michael Healy <horsemanoffaith@gmail.com>
# Original Maintainer: György Balló <ballogy@freestart.hu>
# Contributor: thn81 <root@scrat>

# vercheck-pkgbuild: auto
# vercheck-ubuntu: name=${pkgbase}, repo=bionic
# vercheck-launchpad: name=${pkgbase}

pkgbase=libappindicator-ubuntu
pkgname=(libappindicator-gtk2-ubuntu libappindicator-gtk3-ubuntu)
_actual_ver=12.10.1
_extra_ver=+18.04.20180322.1
pkgver=${_actual_ver}${_extra_ver/\+/.}
pkgrel=1
pkgdesc="A library to allow applications to export a menu into the Unity Menu bar"
arch=(i686 x86_64)
url="https://launchpad.net/libappindicator"
license=(LGPL)
makedepends=(dbus-glib gobject-introspection gtk-doc gtk-sharp-2 libdbusmenu-gtk2-ubuntu libdbusmenu-gtk3-ubuntu libindicator-gtk2-ubuntu libindicator-gtk3-ubuntu perl-xml-libxml pygtk vala)
groups=(unity)
source=("https://launchpad.net/ubuntu/+archive/primary/+files/${pkgbase/\-*/}_${_actual_ver}${_extra_ver}.orig.tar.gz"
        0001-Glib.Timeout-fix.patch
        0003-Fix-Mono-assemblies-directory.patch)
sha512sums=('6b8d35f61b611bd50fce70e75a9ba47ace3dca2a916147b2ee6c9b285bfd0251244a374d7a8ee29109c439e9e86edd53dcaf08fdd0867b55249c05657d6b5ee3'
            '3303fa39c4f2e0d9d092735ae7b457873cf4b3a3b0dd5c1f492728ae4f12dc3f0f123a1b003d81e9b5164b13dea71d598fae01fd667c24cf6983155d58cecb4c'
            '22e15f875a636bbbf8b1e80867a219b4b47b334d1bfe759f4ce79bf3665fc63af36b57fddb6c92aa7db148b5ea9ed789e510a9b23d87324b1b48695ad1ca9bc7')

prepare() {
    
    patch -p1 -i ../0001-Glib.Timeout-fix.patch
    patch -p1 -i ../0003-Fix-Mono-assemblies-directory.patch
}

build() {
    
    export CFLAGS+=" -Wno-error=deprecated-declarations"

    gtkdocize
    autoreconf -vfi

    [[ -d build-gtk2 ]] || mkdir build-gtk2
    pushd build-gtk2
    ../configure --prefix=/usr --with-gtk=2 --disable-static --disable-mono-test \
        PYTHON=python2 CSC=/usr/bin/mcs
    make -j1
    popd

    [[ -d build-gtk3 ]] || mkdir build-gtk3
    pushd build-gtk3
    ../configure --prefix=/usr --with-gtk=3 --disable-static --disable-mono-test \
        PYTHON=python2 CSC=/usr/bin/mcs
    make -j1
    popd
}

package_libappindicator-gtk2-ubuntu() {
    pkgdesc+=" (GTK+ 2 library)"
    provides=(libappindicator-gtk2)
    conflicts=(libappindicator-gtk2)
    depends=(libindicator-gtk2-ubuntu libdbusmenu-gtk2-ubuntu)

    cd build-gtk2

    make -j1 DESTDIR="${pkgdir}/" install
}

package_libappindicator-gtk3-ubuntu() {
    pkgdesc+=" (GTK+ 3 library)"
    provides=(libappindicator-gtk3)
    conflicts=(libappindicator-gtk3)
    depends=(libindicator-gtk3-ubuntu libdbusmenu-gtk3-ubuntu)

    cd build-gtk3

    make -C src DESTDIR="${pkgdir}/" install
    make -C bindings/vala DESTDIR="${pkgdir}/" install
}
