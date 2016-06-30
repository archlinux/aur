# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: FadeMind <fademind at gmail dot com>
# Contributor: Maxime Gauduin <alucryd at archlinux dot org>
# Contributor: bitwave <aur at oomlu dot de>
# Contributor: willemw <willemw12 at gmail dot com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgbase=libappindicator
pkgname=("${pkgbase}-gtk"{2,3} "${pkgbase}-sharp")
pkgver=12.10.0
pkgrel=9
pkgdesc='Allow applications to export a menu into the Unity Menu bar'
arch=('i686' 'x86_64')
url='https://launchpad.net/libappindicator'
license=('LGPL')
makedepends=('dbus-glib' 'gobject-introspection' 'gtk-sharp-3'
             'libdbusmenu-gtk2' 'libdbusmenu-gtk3' 'libindicator-gtk2'
             'libindicator-gtk3' 'mono' 'perl-xml-libxml' 'pygtk' 'vala')
options=('!emptydirs')
source=("http://launchpad.net/libappindicator/${pkgver%.*}/${pkgver}/+download/libappindicator-${pkgver}.tar.gz"
        "0001-Add-support-for-Activate-method-for-improved-Plasma-.patch")
sha512sums=('317a22a23c8ed84e74207b64b2e9683992d1fb7208176637a051dfe925974f966d1cfa31e650b45eaf839ab61641dee8fbebc8a07882a09b0dd766d88b8d5b9a'
            'e2930b9942b800a7a14faf4c27d59073c166e24bb1675f8604a0b5ac3fbd101f3642f7221bc8f5219231c8f021a2a8c4aa203f971ea5f2f9225be83d807cb80e')

prepare() {
	# Check for debris from previous builds and sweep it up if found.
    [[ -d ${pkgbase}-gtk2-${pkgver} ]] && rm -rf ${pkgbase}-gtk2-${pkgver}

    cd ${pkgbase}-${pkgver}
    sed 's|/cli/|/mono/|' -i bindings/mono/{appindicator-sharp-0.1.pc.in,Makefile.in}
    sed 's/example //g' -i Makefile.in
    patch -p1 -i '../0001-Add-support-for-Activate-method-for-improved-Plasma-.patch'

    cd ..
    cp -r ${pkgbase}-${pkgver} ${pkgbase}-gtk2-${pkgver}
}

build() {
    export CFLAGS="$CFLAGS -Wno-deprecated-declarations"
    export CSC='/usr/bin/mcs'

    cd libappindicator-${pkgver}
    ./configure --prefix='/usr' --sysconfdir='/etc' --localstatedir='/var' \
                --disable-{gtk-doc-html,mono-test,static,tests} --with-gtk='3'
    make -j1

    cd ../libappindicator-gtk2-${pkgver}
    ./configure --prefix='/usr' --sysconfdir='/etc' --localstatedir='/var' \
              --disable-{gtk-doc-html,mono-test,static,tests}
    make -j1
}

package_libappindicator-gtk2() {
    depends=('libdbusmenu-gtk2' 'libindicator-gtk2')
    provides=("${pkgbase}")
    conflicts=("${pkgbase}")

    cd ${pkgbase}-gtk2-${pkgver}
    make -j1 DESTDIR="${pkgdir}" install
    make -j1 -C bindings/mono DESTDIR="${pkgdir}" uninstall
    rm -rf "${pkgdir}"/usr/share/gtk-doc
}

package_libappindicator-gtk3() {
    depends=('libdbusmenu-gtk3' 'libindicator-gtk3')
    provides=("${pkgbase}3")
    conflicts=("${pkgbase}3")

    cd ${pkgbase}-${pkgver}
    make -j1 DESTDIR="${pkgdir}" install
    make -j1 -C bindings/mono DESTDIR="${pkgdir}" uninstall
    rm -rf "${pkgdir}"/usr/share/gtk-doc
}

package_libappindicator-sharp() {
    depends=("${pkgbase}-gtk3" 'gtk-sharp-3')

    cd ${pkgbase}-${pkgver}
    make -j1 -C bindings/mono DESTDIR="${pkgdir}" install
}
