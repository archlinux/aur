# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Maintainer: Michael Healy <horsemanoffaith@gmail.com>
# Original Maintainer: György Balló <ballogy@freestart.hu>
# Contributor: thn81 <root@scrat>

# vercheck-pkgbuild: auto
# vercheck-ubuntu: name=${pkgbase}, repo=zesty
# vercheck-launchpad: name=${pkgbase}

pkgbase=libappindicator-ubuntu
pkgname=(libappindicator-gtk2-ubuntu libappindicator-gtk3-ubuntu)
_actual_ver=12.10.1
_extra_ver=+17.04.20161129
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
        0002-Fix-mono-nunit-pkgconfig-name.patch
        0003-Fix-Mono-assemblies-directory.patch)
sha512sums=('9ef7c14350bc9397f5aafb31ba399b55674b5034ac59a9ec69b24e403e0e9bd056ace03861ad7671e9c5ce4d998adb58e718e7a31125affc6bb5d1f49aa50d1f'
            '3303fa39c4f2e0d9d092735ae7b457873cf4b3a3b0dd5c1f492728ae4f12dc3f0f123a1b003d81e9b5164b13dea71d598fae01fd667c24cf6983155d58cecb4c'
            'ea1822c3a09ef4c59d91b267d2ea0d0c9003c04ea0d8d4fb6a73e1b51084faccafbf41d6390a9c0e1326fd3334421539bdbb86a2a5e5022fa96e9d5196ef2d1d'
            '22e15f875a636bbbf8b1e80867a219b4b47b334d1bfe759f4ce79bf3665fc63af36b57fddb6c92aa7db148b5ea9ed789e510a9b23d87324b1b48695ad1ca9bc7')

prepare() {
    
    patch -p1 -i ../0001-Glib.Timeout-fix.patch
    patch -p1 -i ../0002-Fix-mono-nunit-pkgconfig-name.patch
    patch -p1 -i ../0003-Fix-Mono-assemblies-directory.patch
}

build() {
    
    export CFLAGS+=" -Wno-error=deprecated-declarations"

    gtkdocize
    autoreconf -vfi

    [[ -d build-gtk2 ]] || mkdir build-gtk2
    pushd build-gtk2
    ../configure --prefix=/usr --with-gtk=2 --disable-static \
        PYTHON=python2 CSC=/usr/bin/mcs
    make -j1
    popd

    [[ -d build-gtk3 ]] || mkdir build-gtk3
    pushd build-gtk3
    ../configure --prefix=/usr --with-gtk=3 --disable-static \
        PYTHON=python2 CSC=/usr/bin/mcs
    make -j1
    popd
}

package_libappindicator-gtk2-ubuntu() {
    pkgdesc+=" (GTK+ 2 library)"
    depends=(libindicator-gtk2-ubuntu libdbusmenu-gtk2-ubuntu)

    cd build-gtk2

    make -j1 DESTDIR="${pkgdir}/" install
}

package_libappindicator-gtk3-ubuntu() {
    pkgdesc+=" (GTK+ 3 library)"
    depends=(libindicator-gtk3-ubuntu libdbusmenu-gtk3-ubuntu)

    cd build-gtk3

    make -C src DESTDIR="${pkgdir}/" install
    make -C bindings/vala DESTDIR="${pkgdir}/" install
}
