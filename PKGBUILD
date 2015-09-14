# This builds the softwares needed to use hxc usb emulator
# 
# Maintainer: Michael Hauspie <mickeymtp@gmail.com>
pkgname=hxcfloppyemulator-svn
conflicts=('hxcfloppyemulator')
provides=('hxcfloppyemulator')
pkgver=2.1.1.0.r1339
pkgrel=1
epoch=
pkgdesc="Software that drives the HxC Floppy USB emulator"
arch=('i686' 'x86_64')
url="http://hxc2001.com"
license=('GPL')
makedepends=('subversion')
depends=('fltk>=1.3')
install=$pkgname.install
source=('svn://svn.code.sf.net/p/hxcfloppyemu/code/'
    'http://hxc2001.com/download/floppy_drive_emulator/HxC_Floppy_Emulator_Software_User_Manual_ENG.pdf'
)
md5sums=('SKIP' 'c28fd6219d117b58640eeadcb8d148b8')

prepare() {
    cd "$srcdir/code/HxCFloppyEmulator/build/"
    sed -i /fltk-1.3/d Makefile
    cd "$srcdir/code/HxCFloppyEmulator/HxCFloppyEmulator_software/trunk/build/"
    # Patch makefile to use system fltk
    sed -i /^FLTKLIB/d Makefile
    sed -i 's@-I ../sources/thirdpartylibs/fltk/fltk-1.3.x/@$(shell fltk-config --cxxflags)@g' Makefile
    sed -i 's@LDFLAGS += -Wl,-rpath=.@LDFLAGS += -Wl,-rpath=. $(shell fltk-config --ldflags)@g' Makefile

	
}

build() {
    make -C "$srcdir/code/HxCFloppyEmulator/build/"
}

package() {
	cd "$srcdir/"
	mkdir -p "$pkgdir/usr/lib" "$pkgdir/usr/bin" "$pkgdir/usr/share/doc/$pkgname"
	cp "$srcdir/code/HxCFloppyEmulator/build/hxcfe" "$pkgdir/usr/bin"
	cp "$srcdir/code/HxCFloppyEmulator/build/hxcfloppyemulator" "$pkgdir/usr/bin"
	cp "$srcdir/code/HxCFloppyEmulator/build/libhxcfe.so" "$pkgdir/usr/lib"
	cp "$srcdir/code/HxCFloppyEmulator/build/libusbhxcfe.so" "$pkgdir/usr/lib"
	cp "$srcdir/HxC_Floppy_Emulator_Software_User_Manual_ENG.pdf" "$pkgdir/usr/share/doc/$pkgname"
	# Generate the udev rules sample
	cat > "$pkgdir/usr/share/doc/$pkgname/udev-rules.conf.example" <<EOF
ATTRS{idVendor}=="0403", ATTRS{idProduct}=="6001", GROUP="users", MODE="0660", SYMLINK="hxcfloppy", RUN="/sbin/modprobe -r ftdi_sio"
EOF
}

pkgver() {
  cd "$srcdir/code"
  local rev="$(svnversion)"
  local ver="$(grep '#define STR_FILE_VERSION2' "$srcdir/code/HxCFloppyEmulator/HxCFloppyEmulator_software/trunk/sources/version.h" | awk '{print $3;}' | tr -d \\\" | sed 's/\s//')"
  printf "%s.r%s" "${ver//[[:alpha::]]}" "${rev//[[:alpha:]]}"
}
