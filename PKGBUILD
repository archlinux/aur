# Maintainer: Nicolas Guillaumin <nicolas plus archlinux at guillaumin dot me>
# Maintainer: Michael Hauspie <mickeymtp@gmail.com>
pkgname=hxc-floppy-emulator
pkgver=2.14.4.1
pkgrel=1
pkgdesc="HxC Floppy Emulator toolkit"
arch=('i686' 'x86_64')
url="http://hxc2001.com"
license=('GPL')
makedepends=('git')
depends=('fltk>=1.3')
_archive=HxCFloppyEmulator_V2_14_4_1
source=("https://github.com/jfdelnero/HxCFloppyEmulator/archive/refs/tags/$_archive.tar.gz")
md5sums=('3f232243bb706b228f123d51e9adab73')

prepare() {
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
