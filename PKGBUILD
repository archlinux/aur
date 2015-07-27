# Maintainer: Jakub Klinkovský <j.l.k@gmx.com>
# Contributor: Alireza Savand <alireza.savand@gmail.com>
# Special thanks to: olive, mirrr, GUiHKX, alessiofachechi, jeremy33,
#		     jstitch, plv, lahwaacz

pkgname=cnijfilter-mp280
pkgver=3.40.1
pkgrel=3.1
_pkgrealver=3.40
_pkgrealrel=1
pkgdesc="Canon IJ Printer Driver (mp280 series)"
url="http://support-au.canon.com.au/contents/AU/EN/0100302002.html"
arch=('i686' 'x86_64')
license=('custom')
depends=(
	'libcups'
	'popt'
    'glibc'
    'libpng>=1.0.9'
    'libtiff>=3.4'
)
makedepends=(
	'autoconf>=2.59'
	'automake>=1.9.5'
)
conflicts=('cnijfilter-common')
install=cnijfilter-mp280.install
source=(
    'http://gdlp01.c-wss.com/gds/0/0100003020/01/cnijfilter-source-3.40-1.tar.gz'
    'fix.patch'
)
md5sums=(
    '609975a05d6050fcca88f312d3f35c6a'
    '1f4f7aa58be271e2d60b5f9615b1104d'
)

build() {
    cd "$srcdir/cnijfilter-source-$_pkgrealver-$_pkgrealrel"
    patch -p0 < "$startdir/fix.patch"
    sed -i -e 's/png_p->jmpbuf/png_jmpbuf(png_p)/' cnijfilter/src/bjfimage.c
    cp cnijfilter/src/config* lgmon/src/
    cp cnijfilter/src/config* cngpijmon/cnijnpr/cnijnpr/
  
    cd "$srcdir/cnijfilter-source-$_pkgrealver-$_pkgrealrel/libs"
    ./autogen.sh --prefix=/usr --program-suffix=mp280
    make
  
    cd "$srcdir/cnijfilter-source-$_pkgrealver-$_pkgrealrel/cngpij"
    ./autogen.sh --prefix=/usr --program-suffix=mp280 --enable-progpath=/usr/bin
    make
  
    cd "$srcdir/cnijfilter-source-$_pkgrealver-$_pkgrealrel/cnijfilter"
    ./autogen.sh --prefix=/usr --program-suffix=mp280 --enable-progpath=/usr/bin
    make
  
    cd "$srcdir/cnijfilter-source-$_pkgrealver-$_pkgrealrel/pstocanonij"
    ./autogen.sh --prefix=/usr --program-suffix=mp280 --enable-progpath=/usr/bin
    make
  
    cd "$srcdir/cnijfilter-source-$_pkgrealver-$_pkgrealrel/lgmon"
    ./autogen.sh --prefix=/usr --program-suffix=mp280 --enable-progpath=/usr/bin
    make
  
    cd "$srcdir/cnijfilter-source-$_pkgrealver-$_pkgrealrel/ppd"
    ./autogen.sh --prefix=/usr --program-suffix=mp280
    make
  
    cd "$srcdir/cnijfilter-source-$_pkgrealver-$_pkgrealrel/cngpijmon/cnijnpr"
    ./autogen.sh --prefix=/usr --program-suffix=mp280 --enable-progpath=/usr/bin LIBS="-ldl"
    make
  
    cd "$srcdir/cnijfilter-source-$_pkgrealver-$_pkgrealrel/backend"
    ./autogen.sh --prefix=/usr --program-suffix=mp280 --enable-progpath=/usr/bin
    make
  
    cd "$srcdir/cnijfilter-source-$_pkgrealver-$_pkgrealrel/backendnet"
    ./autogen.sh --prefix=/usr --program-suffix=mp280 --enable-progpath=/usr/bin
    make
}

package() {
    # install targets
    for dir in libs cngpij cnijfilter pstocanonij lgmon ppd cngpijmon/cnijnpr backend backendnet; do
        cd "$srcdir/cnijfilter-source-$_pkgrealver-$_pkgrealrel/$dir"
        make install DESTDIR="$pkgdir"
    done

    # install bjlib
    cd "$srcdir/cnijfilter-source-$_pkgrealver-$_pkgrealrel"
    install -d "$pkgdir/usr/lib/bjlib"
    install -m755 370/database/* "$pkgdir/usr/lib/bjlib"
  
    # install shared libraries
    if [ "$CARCH" == "x86_64" ]; then  
        libdir=libs_bin64
    else
        libdir=libs_bin32
    fi
    for file in libcnbpcmcm370.so.8.0.1 libcnbpcnclapi370.so.3.5.0 libcnbpcnclbjcmd370.so.3.3.0 \
                libcnbpcnclui370.so.3.6.0 libcnbpess370.so.3.3.3 libcnbpess370.so.3.3.3 libcnbpo370.so.1.0.2; do
        install -m755 "./370/$libdir/$file" "$pkgdir/usr/lib/"
    done
    install -m755 "./com/$libdir/libcnnet.so.1.2.0" "$pkgdir/usr/lib/"
      
    # install license file
    install -Dm644 "LICENSE-cnijfilter-${_pkgrealver}EN.txt" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE-cnijfilter-${_pkgrealver}EN.txt"

    # link libraries to their basename
    cd "$pkgdir/usr/lib/"
    ln -s libcnbpcmcm370.so.8.0.1 libcnbpcmcm370.so
    ln -s libcnbpcnclapi370.so.3.5.0 libcnbpcnclapi370.so
    ln -s libcnbpcnclbjcmd370.so.3.3.0 libcnbpcnclbjcmd370.so
    ln -s libcnbpcnclui370.so.3.6.0 libcnbpcnclui370.so
    ln -s libcnbpess370.so.3.3.3 libcnbpess370.so
    ln -s libcnbpo370.so.1.0.2 libcnbpo370.so
    ln -s libcnnet.so.1.2.0 libcnnet.so
    
    # link moved from $pkgname.install file to be included in package
    install -dm755 "$pkgdir/usr/lib/cups/filter"
    ln -s "pstocanonijmp280" "$pkgdir/usr/lib/cups/filter/pstocanonij"
}
