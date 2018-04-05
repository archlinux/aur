# Maintainer: Giovanni Santini <giovannisantini93@yahoo.it>
# Previous Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Timm Preetz <timm@preetz.us>

# Almost as the original one, just fixed for building

pkgname=java-gnome
pkgver=4.1.3
pkgrel=6
pkgdesc="Java bindings to the GNOME platform (including gtk, glib and glade)"
arch=('i686' 'x86_64')
url="http://java-gnome.sourceforge.net"
license=('GPL')
depends=('java-runtime<9' 'gtksourceview3' 'librsvg' 'libnotify' 'enchant' 'gtkspell3')
makedepends=('java-environment<9' 'junit' 'python2')
source=(
    http://ftp.gnome.org/pub/gnome/sources/$pkgname/4.1/$pkgname-$pkgver.tar.xz
    jdk8-javadoc_disable-doclint.patch
    enchant_2.patch
    )
sha256sums=('060b2b249bad918b91a55a82b8a2ed085bec5734defaf31e6c8c5ad006532373'
            'baee2777041531b6e6ce9e2b176ed27f89afe2c35f5f913ba377d7027d6dc039'
            'e00af4688aacdf98116f139c70f8091d06c5b65a38522394081ef4ba7f27c344')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"

    # Patch the detection of enchant
    patch -Np1 -i "$srcdir/enchant_2.patch"

    # Fix Javadoc 8 doclint annoying behaviour by disabling it
    # Actually, you've to add a line in the script'$srcdir/build/faster'
    # Apply only when needed!
    local java_version=`javac -version 2>&1`
    java_version=${java_version/javac 1./}
    java_version=${java_version/.*/}
    if [ "x$java_version" == "x8" ]
    then
        patch -Np2 -i "$srcdir/jdk8-javadoc_disable-doclint.patch"
    fi
}

build() {
    cd "$srcdir/$pkgname-$pkgver"

    # Python2 fix
    sed -i 's@^#!.*python$@#!/usr/bin/python2@' build/faster src/util/demux/demux.py

    # Adapt to the new build-system
    unset CLASSPATH

    # Ok, this had to be updated
    ./configure jdk="/usr/lib/jvm/default" prefix=/usr
    make
    # Prevent errors running make doc (GLib errors)
    G_ENABLE_DIAGNOSTIC=0 make doc
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    make -j1 DESTDIR=$pkgdir install

    install -d "$pkgdir/usr/share/gtk-doc/html/$pkgname"
    cp -R "$srcdir"/$pkgname-$pkgver/doc/api/* "$pkgdir/usr/share/gtk-doc/html/$pkgname"

    # Fix permissions
    chmod 644 "$pkgdir/usr/share/java/gtk-4.1.jar"
}
