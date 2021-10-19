# Maintainer: Muhammad Hidayat <hidayat.pcd@gmail.com>
# Former maintainer: Jakub Klinkovský <kuba.klinkovsky@gmail.com>
#
# If you're going to adapt this package to other printer models,
# here is a list of printer names and IDs:
#
#   name - id
# -------------
#  mp250 - 356
#  mp280 - 370
#  mp495 - 369
# mg5100 - 373
# mg5200 - 374
# mg6100 - 376
# mg8100 - 377
#
# Just change the following variables accordingly:
_name=mp280
_id=370

pkgname=scangearmp-${_name}
pkgver=1.60
pkgrel=5
_pkgver=1.60-1
pkgdesc="Canon Scanner Driver (${_name} series)"
url="http://support-my.canon-asia.com/contents/MY/EN/0100303302.html"
arch=('i686' 'x86_64')
license=('custom')
depends=(
    'sane'
    'gimp'
    'gtk2'
    'libpng>=1.5'
    'libusb-compat'
    'glibc'
)
makedepends=(
    'autoconf>=2.13'
    'automake>=1.6'
)
source=(http://gdlp01.c-wss.com/gds/3/0100003033/01/scangearmp-source-${_pkgver}.tar.gz
        fix_png15.patch
        fix_configure.patch
        fix_gimp2.9.patch
)
md5sums=('15782d670f9d5c5904e00610508114f3'
         '6609d7fe171e67451658a3665442972c'
         '8c21b22ef834b17bcdad6e97d8916ca2'
         'f90572fce7a3878438f7c93360f615e4')

if [ "$CARCH" == "x86_64" ]; then  
    _libdir=libs_bin64
else
    _libdir=libs_bin32
fi

build() {
    # Apply patches
    cd "$srcdir/scangearmp-source-$_pkgver"
    patch -p1 -i "$srcdir/fix_png15.patch"
    patch -p1 -i "$srcdir/fix_configure.patch"
    patch -p1 -i "$srcdir/fix_gimp2.9.patch"
    
    # Prepare build
    cd "$srcdir/scangearmp-source-$_pkgver/scangearmp"
    ./autogen.sh --prefix=/usr LDFLAGS="-L$(pwd)/../com/$_libdir" LIBS=-lm
    
    # Force the use of system's libtool
    rm libtool
    ln -s $(which libtool) .
    
    # Build package
    make clean
    make    
}

package() {
    # Install package
    cd "$srcdir/scangearmp-source-$_pkgver/scangearmp"
    make install DESTDIR="$pkgdir"

    # Install common libraries
    for file in libcncpcmcm.so.8.0.1 libcncpmsimg.so.1.0.2 libcncpmslld.so.1.0.1 libcncpmsui.so.1.6.0 libcncpnet.so.1.2.0; do
        install -m 755 "$srcdir/scangearmp-source-$_pkgver/com/$_libdir/$file" "$pkgdir/usr/lib/"
    done
    
    # Install model specific libraries
    for file in libcncpmsimg370.so.1.6.0 libcncpmslld370c.so.1.04.1 libcncpmslld370.so.1.6.0; do
        install -m 755 "$srcdir/scangearmp-source-$_pkgver/$_id/$_libdir/$file" "$pkgdir/usr/lib/"
    done
  
    # Create symbolic links
    cd "$pkgdir/usr/lib/"
    ln -s libcncpcmcm.so.8.0.1 libcncpcmcm.so
    ln -s libcncpmsimg.so.1.0.2 libcncpmsimg.so
    ln -s libcncpmslld.so.1.0.1 libcncpmslld.so
    ln -s libcncpmsui.so.1.6.0 libcncpmsui.so
    ln -s libcncpnet.so.1.2.0 libcncpnet.so
    
    ln -s libcncpmsimg370.so.1.6.0 libcncpmsimg370.so
    ln -s libcncpmslld370c.so.1.04.1 libcncpmslld370c.so
    ln -s libcncpmslld370.so.1.6.0 libcncpmslld370.so
    
    # Make scangearmp usable from gimp
    install -dm 755 "$pkgdir/usr/lib/gimp/2.0/plug-ins/"
    ln -s /usr/bin/scangearmp "$pkgdir/usr/lib/gimp/2.0/plug-ins/"

    # FIXME
    mv "$pkgdir/usr/lib/bjlib" "$pkgdir/usr/lib/canon_mfp.conf"

    # Install model specific .tbl and .dat files
    install -dm 755 "$pkgdir/usr/lib/bjlib/"
    install -m 644 "$srcdir/scangearmp-source-$_pkgver/$_id/"*.tbl "$pkgdir/usr/lib/bjlib/"
    install -m 644 "$srcdir/scangearmp-source-$_pkgver/$_id/"*.DAT "$pkgdir/usr/lib/bjlib/"
    
    # FIXME
    mv "$pkgdir/usr/lib/canon_mfp.conf" "$pkgdir/usr/lib/bjlib/"

    # Install .ini file
    install -m 666 "$srcdir/scangearmp-source-$_pkgver/com/ini/canon_mfp_net.ini" "$pkgdir/usr/lib/bjlib/"

    # Fix and install udev rules
    sed -i -e 's/SYSFS/ATTR/g' "$srcdir/scangearmp-source-$_pkgver/scangearmp/etc/80-canon_mfp.rules"
    install -dm 755 "$pkgdir/usr/lib/udev/rules.d/"
    install -m 644 "$srcdir/scangearmp-source-$_pkgver/scangearmp/etc/80-canon_mfp.rules" "$pkgdir/usr/lib/udev/rules.d/"

    # Remove unneeded files
    rm "$pkgdir/usr/lib/libsane-canon_mfp.a"
    rm "$pkgdir/usr/lib/libsane-canon_mfp.la"

    # Install license files
    cd "$srcdir/scangearmp-source-$_pkgver"
    install -d "$pkgdir/usr/share/licenses/$pkgname/"
    install -m 644 LICENSE-* "$pkgdir/usr/share/licenses/$pkgname/"
}
