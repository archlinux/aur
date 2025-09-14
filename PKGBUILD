# Maintainer: Nicolas Guillaumin <nicolas plus archlinux at guillaumin dot me>
# Maintainer: Michael Hauspie <mickeymtp@gmail.com>
# Maintainer: andreas_baumann
pkgname=hxc-floppy-emulator
pkgver=2.16.11.1
pkgrel=2
pkgdesc="HxC Floppy Emulator toolkit"
arch=('i686' 'x86_64')
url="http://hxc2001.com"
license=('GPL')
makedepends=('git')
depends=('fltk>=1.3')
_archive=HxCFloppyEmulator_V${pkgver//./_}
source=("https://github.com/jfdelnero/HxCFloppyEmulator/archive/refs/tags/$_archive.tar.gz"
        "HxCFloppyEmulator-HxCFloppyEmulator_V2_16_11_1-adfReleaseDevice-prototype.patch")
md5sums=('cb4d038c02927803500d9ecbad0008eb'
         'ffde5d0793441bdd018d755c5aaea752')

prepare() {
    # compilation issue, see 8302f4e633d11f1074a27d91d97bcf4be5cca054 and
    # https://github.com/jfdelnero/HxCFloppyEmulator/issues/42
    cd "$srcdir/HxCFloppyEmulator-$_archive"
    patch -Np1 < ../HxCFloppyEmulator-HxCFloppyEmulator_V2_16_11_1-adfReleaseDevice-prototype.patch

    # Patch makefile to use system fltk
    cd "$srcdir/HxCFloppyEmulator-$_archive/HxCFloppyEmulator_software/build/"
    sed -i /^FLTKLIB/d Makefile
    sed -i '/$(MAKE) fltk/d' Makefile
    sed -i 's@-I $(BASEDIR)/thirdpartylibs/fltk/fltk-1.x.x/@$(shell fltk-config --cxxflags)@g' Makefile
    sed -i 's@LDFLAGS += $(shell $(BASEDIR)/thirdpartylibs/fltk/fltk-1.x.x/fltk-config --ldflags)@LDFLAGS += $(shell fltk-config --ldflags)@g' Makefile
}

build() {
    make -C "$srcdir/HxCFloppyEmulator-$_archive/build/"
}

package() {
    mkdir -p "$pkgdir/usr/lib" "$pkgdir/usr/bin"
    cp "$srcdir/HxCFloppyEmulator-$_archive/build/libhxcfe.so" "$pkgdir/usr/lib"
    cp "$srcdir/HxCFloppyEmulator-$_archive/build/libusbhxcfe.so" "$pkgdir/usr/lib"
    cp "$srcdir/HxCFloppyEmulator-$_archive/build/hxcfe" "$pkgdir/usr/bin"
    cp "$srcdir/HxCFloppyEmulator-$_archive/build/hxcfloppyemulator" "$pkgdir/usr/bin"
}
