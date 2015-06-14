pkgbase="gcc-multilib-trunk-git"
pkgname=('gcc-multilib-git' 'gcc-libs-multilib-git' 'lib32-gcc-libs-git' 'gcc-objc-multilib-git')
pkgver=6.0.139276.6f5a4f4
pkgrel=1
pkgdesc="The GNU Compiler Collection developmental snapshot"
arch=('any')
license=('GPL3' 'LGPL' 'custom')
url="http://gcc.gnu.org"
makedepends=('binutils>=2.25' 'libmpc' 'doxygen' 'lib32-glibc>=2.20')
checkdepends=('dejagnu' 'inetutils')
options=('!emptydirs')
source=('git+git://gcc.gnu.org/git/gcc.git#branch=trunk')
md5sums=('SKIP')

_basedir="gcc"

pkgver() {
  cd ${srcdir}/${_basedir}

  _ver=$(cat ${srcdir}/gcc/gcc/BASE-VER)
  _ver=${_ver%.*}

  echo ${_ver}.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

_libdir="usr/lib/gcc/$CHOST/$pkgver"

prepare() {
        cd ${srcdir}/${_basedir}

        # link isl/cloog for in-tree builds
        ln -s ../isl-${_islver} isl
        ln -s ../cloog-${_cloogver} cloog

        # Do not run fixincludes
        sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

        # Arch Linux installs x86_64 libraries /lib
        [[ $CARCH == "x86_64" ]] && sed -i '/m64=/s/lib64/lib/' gcc/config/i386/t-linux64

        echo ${pkgver} > gcc/BASE-VER

        # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
        sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure

        mkdir ${srcdir}/gcc-build
}

build() {
        cd ${srcdir}/gcc-build

        [ -d ${srcdir}/${_basedir}/.git ] && rm -Rf ${srcdir}/${_basedir}/.git

        ${srcdir}/${_basedir}/configure --prefix=/usr \
        --libdir=/usr/lib --libexecdir=/usr/lib \
        --mandir=/usr/share/man --infodir=/usr/share/info \
        --with-bugurl=https://bugs.archlinux.org/ \
        --enable-languages=c,c++,lto,objc,obj-c++ \
        --enable-shared --enable-threads=posix \
        --with-system-zlib --enable-__cxa_atexit \
        --disable-libunwind-exceptions --enable-clocale=gnu \
        --disable-libstdcxx-pch --disable-libssp \
        --enable-gnu-unique-object --enable-linker-build-id \
        --enable-cloog-backend=isl \
        --enable-lto --enable-plugin --enable-install-libiberty \
        --with-linker-hash-style=gnu \
        --enable-multilib --disable-werror \
        --enable-checking=release
        make

        # make documentation
        make -C $CHOST/libstdc++-v3/doc doc-man-doxygen
}

check() {
        cd ${srcdir}/gcc-build
        [ -n ${gcc_multilib_trunk_git_notest} ] && return 0
        # increase stack size to prevent test failures
        # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=31827
        ulimit -s 32768

        # do not abort on error as some are "expected"
        make -k check || true
        ${srcdir}/${_basedir}/contrib/test_summary
}

package_gcc-multilib-git()
{
        pkgdesc="The GNU Compiler Collection - C and C++ frontends for multilib"
        depends=("gcc-libs-multilib-git=$pkgver-$pkgrel" 'binutils>=2.25' 'libmpc')
        groups=('multilib-devel')
        options=('staticlibs')
        provides=("gcc=$pkgver-$pkgrel" "gcc-multilib=$pkgver-$pkgrel")
        conflicts=('gcc')
        install=gcc.install

        cd ${srcdir}/gcc-build

        make -C gcc DESTDIR=${pkgdir} install-driver install-cpp install-gcc-ar \
        c++.install-common install-headers install-plugin install-lto-wrapper

        install -m755 gcc/gcov $pkgdir/usr/bin/
        install -m755 -t $pkgdir/${_libdir}/ gcc/{cc1,cc1plus,collect2,lto1}

        make -C $CHOST/libgcc DESTDIR=${pkgdir} install
        make -C $CHOST/32/libgcc DESTDIR=${pkgdir} install

        for i in ${pkgdir}/usr/lib{,32}/libgcc_s.so*; do
                [ -f "$i" ] && rm $i
        done

        make -C $CHOST/libstdc++-v3/src DESTDIR=${pkgdir} install
        make -C $CHOST/libstdc++-v3/include DESTDIR=${pkgdir} install
        make -C $CHOST/libstdc++-v3/libsupc++ DESTDIR=${pkgdir} install
        make -C $CHOST/libstdc++-v3/python DESTDIR=${pkgdir} install
        make -C $CHOST/32/libstdc++-v3/src DESTDIR=${pkgdir} install
        make -C $CHOST/32/libstdc++-v3/include DESTDIR=${pkgdir} install
        make -C $CHOST/32/libstdc++-v3/libsupc++ DESTDIR=${pkgdir} install

        install -d $pkgdir/usr/share/gdb/auto-load/usr/lib
        mv $pkgdir/usr/lib/libstdc++.so.6.*-gdb.py \
        $pkgdir/usr/share/gdb/auto-load/usr/lib/

        for i in ${pkgdir}/usr/lib{,32}/libstdc++.so*; do
                [ -f "$i" ] && rm $i
        done

        make DESTDIR=${pkgdir} install-fixincludes
        make -C gcc DESTDIR=${pkgdir} install-mkheaders
        make -C lto-plugin DESTDIR=${pkgdir} install

        make -C $CHOST/libcilkrts DESTDIR=${pkgdir} install-nodist_toolexeclibHEADERS \
        install-nodist_cilkincludeHEADERS
        make -C $CHOST/libgomp DESTDIR=${pkgdir} install-nodist_toolexeclibHEADERS \
        install-nodist_libsubincludeHEADERS
        make -C $CHOST/libitm DESTDIR=${pkgdir} install-nodist_toolexeclibHEADERS
        make -C $CHOST/libquadmath DESTDIR=${pkgdir} install-nodist_libsubincludeHEADERS
        make -C $CHOST/libsanitizer DESTDIR=${pkgdir} install-nodist_toolexeclibHEADERS
        make -C $CHOST/libsanitizer/asan DESTDIR=${pkgdir} install-nodist_toolexeclibHEADERS
        make -C $CHOST/32/libcilkrts DESTDIR=${pkgdir} install-nodist_toolexeclibHEADERS
        make -C $CHOST/32/libgomp DESTDIR=${pkgdir} install-nodist_toolexeclibHEADERS
        make -C $CHOST/32/libitm DESTDIR=${pkgdir} install-nodist_toolexeclibHEADERS
        make -C $CHOST/32/libsanitizer DESTDIR=${pkgdir} install-nodist_toolexeclibHEADERS
        make -C $CHOST/32/libsanitizer/asan DESTDIR=${pkgdir} install-nodist_toolexeclibHEADERS

        make -C libiberty DESTDIR=${pkgdir} install
        # install PIC version of libiberty
        install -m644 ${srcdir}/gcc-build/libiberty/pic/libiberty.a ${pkgdir}/usr/lib


        make -C gcc DESTDIR=${pkgdir} install-man install-info
        for i in ${pkgdir}/usr/share/man/man1/{gccgo,gfortran}.1 \
        ${pkgdir}/usr/share/info/{gccgo,gfortran,gnat-style,gnat_rm,gnat_ugn}.info; do
                [ -f "$i" ] && rm "$i"
        done

        make -C libcpp DESTDIR=${pkgdir} install
        make -C gcc DESTDIR=${pkgdir} install-po

        # many packages expect this symlink
        ln -s gcc ${pkgdir}/usr/bin/cc

        # POSIX conformance launcher scripts for c89 and c99
cat << EOF > $pkgdir/usr/bin/c89
#!/bin/sh
fl="-std=c89"
for opt; do
        case "$opt" in
                -ansi|-std=c89|-std=iso9899:1990) fl="";;
                -std=*) echo "`basename $0` called with non ANSI/ISO C option $opt" >&2
                exit 1;;
        esac
done
exec gcc $fl ${1+"$@"}
EOF

cat << EOF > $pkgdir/usr/bin/c99
#!/bin/sh
fl="-std=c99"
for opt; do
        case "$opt" in
                -std=c99|-std=iso9899:1999) fl="";;
                -std=*) echo "`basename $0` called with non ISO C99 option $opt" >&2
                exit 1;;
        esac
done
exec gcc $fl ${1+"$@"}
EOF

        chmod 755 $pkgdir/usr/bin/c{8,9}9

        # install the libstdc++ man pages
        make -C $CHOST/libstdc++-v3/doc DESTDIR=$pkgdir doc-install-man

        # Install Runtime Library Exception
        install -d ${pkgdir}/usr/share/licenses/gcc-multilib/
        ln -s ../gcc-libs-multilib/RUNTIME.LIBRARY.EXCEPTION ${pkgdir}/usr/share/licenses/gcc-multilib/
}


package_gcc-libs-multilib-git()
{
        pkgdesc="Runtime libraries shipped by GCC for multilib"
        depends=('glibc>=2.20' "lib32-gcc-libs-git=$pkgver-$pkgrel")
        provides=("gcc-libs=$pkgver-$pkgrel")
        conflicts=('gcc-libs')
        options=('!emptydirs' '!strip')
        install=gcc-libs.install

        cd ${srcdir}/gcc-build

        make -C $CHOST/libgcc DESTDIR=${pkgdir} install-shared
        [ -f ${pkgdir}/${_libdir}/libgcc_eh.a ] && rm ${pkgdir}/${_libdir}/libgcc_eh.a

        for lib in libatomic libcilkrts libgfortran libgomp \
        libitm libquadmath libsanitizer/{a,l,ub}san libstdc++-v3/src libvtv; do
                [ -d $CHOST/$lib ] && make -C $CHOST/$lib DESTDIR=${pkgdir} install-toolexeclibLTLIBRARIES
        done

        [[ $CARCH == "x86_64" ]] && \
        make -C $CHOST/libsanitizer/tsan DESTDIR=${pkgdir} install-toolexeclibLTLIBRARIES

        make -C $CHOST/libobjc DESTDIR=${pkgdir} install-libs

        make -C $CHOST/libstdc++-v3/po DESTDIR=${pkgdir} install

        for lib in libgomp libitm libquadmath; do
                [ -d $CHOST/$lib ] && make -C $CHOST/$lib DESTDIR=${pkgdir} install-info
        done

        # remove stuff in lib32-gcc-libs
        rm -r ${pkgdir}/usr/lib32

        # Install Runtime Library Exception
        install -Dm644 ${srcdir}/${_basedir}/COPYING.RUNTIME \
        ${pkgdir}/usr/share/licenses/gcc-libs-multilib/RUNTIME.LIBRARY.EXCEPTION
}

package_lib32-gcc-libs-git()
{
        pkgdesc="Runtime libraries shipped by GCC (32-bit)"
        depends=('lib32-glibc>=2.20')
        options=('!emptydirs' '!strip')
        provides=("lib32-gcc-libs=$pkgver-$pkgrel")
        conflicts=('lib32-gcc-libs')

        cd ${srcdir}/gcc-build

        make -C $CHOST/32/libgcc DESTDIR=${pkgdir} install-shared
        [ -f ${pkgdir}/${_libdir}/32/libgcc_eh.a ] && rm ${pkgdir}/${_libdir}/32/libgcc_eh.a

        for lib in libatomic libcilkrts libgfortran libgomp libitm libquadmath \
        libsanitizer/{a,l,ub}san libstdc++-v3/src libvtv; do
                [ -d $CHOST/32/$lib ] && make -C $CHOST/32/$lib DESTDIR=${pkgdir} install-toolexeclibLTLIBRARIES
        done

        [ -d $CHOST/32/libobjc ] && make -C $CHOST/32/libobjc DESTDIR=${pkgdir} install-libs

        # remove stuff in gcc-libs-multilib
        [ -d ${pkgdir}/usr/lib ] && rm -r ${pkgdir}/usr/lib

        # Install Runtime Library Exception
        install -Dm644 ${srcdir}/${_basedir}/COPYING.RUNTIME \
        ${pkgdir}/usr/share/licenses/lib32-gcc-libs/RUNTIME.LIBRARY.EXCEPTION
}

package_gcc-objc-multilib-git()
{
        pkgdesc="Objective-C front-end for GCC for multilib"
        depends=("gcc-multilib-git=$pkgver-$pkgrel")
        provides=("gcc-objc=$pkgver-$pkgrel")
        conflicts=('gcc-objc')

        cd ${srcdir}/gcc-build
        make DESTDIR=$pkgdir -C $CHOST/libobjc install-headers
        install -dm755 $pkgdir/${_libdir}
        install -m755 gcc/cc1obj{,plus} $pkgdir/${_libdir}/

        # Install Runtime Library Exception
        install -d ${pkgdir}/usr/share/licenses/gcc-objc-multilib/
        ln -s ../gcc-libs-multilib/RUNTIME.LIBRARY.EXCEPTION ${pkgdir}/usr/share/licenses/gcc-objc-multilib/
}
