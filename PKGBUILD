# Maintainer: tokigami.kineko <>
pkgname=gimp-cce-git
pkgver=r37634.c5a635b
pkgrel=3
pkgdesc="GIMP-CCE maintained by elle stone"
arch=('i686' 'x86_64')
url="https://github.com/ellelstone/gimp"
license=('LGPL3')
groups=()
depends=('pygtk' 'lcms2>=2.2' 'libwmf>=0.2.8' 'webkitgtk2>=1.6.1'
        'libgexiv2' 'librsvg>=2.16.1' 'desktop-file-utils'
        'libexif>=0.6.15' 'libart-lgpl>=2.3.19' 'dbus-glib' 'gtk-doc'
        'babl-cce-git' 'gegl-cce-git' 'libmypaint-cce-git')
makedepends=('git' 'gutenprint>=5.0.0' 'intltool>=0.40.1'
             'gnome-python>=2.16.2' 'poppler>=0.12.4'
             'alsa-lib>=1.0.0' 'libxslt')
optdepends=('gutenprint: for sophisticated printing only as gimp has built-in cups print support'
            'poppler-glib: for pdf support'
            'alsa-lib: for MIDI event controller module'
            'curl: for URI support'
            'ghostscript: for postscript support')
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=
source=('git+https://github.com/ellelstone/gimp')
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/gimp"
    printf "r%s.%s" "$(git rev-list --count HEAD)" \
           "$(git rev-parse --short HEAD)"
}

build() {
    PREFIX="/usr/gimp-cce"
    case "$CARCH" in
        i686) LIB=lib;;
        x86_64) LIB=lib64;;
        *) echo "Unknown architecture : $CARCH"; exit 1
    esac
    export LD_LIBRARY_PATH=$PREFIX/$LIB:$LD_LIBRARY_PATH
    export PATH=$PREFIX/bin:$PATH
    export XDG_DATA_DIRS=$PREFIX/share:$XDG_DATA_DIRS
    export PKG_CONFIG_PATH=$PREFIX/$LIB/pkgconfig:$PKG_CONFIG_PATH

    cd $srcdir/gimp
    ./autogen.sh --prefix=$PREFIX --disable-gtk-doc \
                 --with-gimpdir=GIMP-CCE-GIT --libdir=$PREFIX/$LIB \
                 --enable-debug=yes
    make
}

package() {
    cd $srcdir/gimp
    make DESTDIR="$pkgdir" install

    case "$CARCH" in
        i686) LIB=lib;;
        x86_64) LIB=lib64;;
        *) echo "Unknown architecture : $CARCH"; exit 1
    esac

    # Create directories
    mkdir -p $pkgdir/usr/bin $pkgdir/usr/share/applications
    # Make /usr/bin/gimp-cce
    sed "s/@LIB/$LIB/" $startdir/gimp-cce > $pkgdir/usr/bin/gimp-cce
    chmod 755 $pkgdir/usr/bin/gimp-cce
    # Create /usr/share/applications/gimp-cce.desktop from
    # /usr/gimp-cce/share/applications/gimp.desktop
    sed -e "s/^Name\([^=]*\)=.*$/Name\1=GIMP-CCE/" \
        -e "s/^Icon=.*$/Icon=gimp-cce/" \
        -e "s/^Exec=.*$/Exec=gimp-cce %U/" \
        -e "s/^TryExec=.*$/TryExec=gimp-cce/" \
        $pkgdir/usr/gimp-cce/share/applications/gimp.desktop \
        > $pkgdir/usr/share/applications/gimp-cce.desktop
    # rename gimp.png to gimp-cce.png in /usr/gimp-cce/share/icons
    find $pkgdir/usr/gimp-cce/share/icons -type f \
         -exec rename gimp gimp-cce {} \;
    # copy /usr/gimp-cce/share/icons to /usr/share/icons
    cp -r $pkgdir/usr/gimp-cce/share/icons $pkgdir/usr/share
}

# vim:set ts=2 sw=2 et:
