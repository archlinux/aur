# Maintainer: Moritz Maxeiner <moritz@ucworks.org>

# Contributor: Mihails Strasuns <public@dicebot.lv>
# Contributor: Jerome Berger <jeberger@free.fr>
# Contributor: Jesus Alvarez <jeezusjr@gmail.com>

pkgname=gdc-git
_gitname=gdc
_gccver=4.9
#_gccsnapshot=20131027
_gccsnapshot=20140416
pkgver=4.9.20140416.1325.3209d01
pkgrel=1
pkgdesc="GDC, The D Programming Language (D2) frontend for GCC. GIT master branch compiled with GCC trunk snapshot."
arch=('i686' 'x86_64')
url="https://github.com/D-Programming-GDC/GDC"
license=('GPL')
provides=('gdc' 'd-compiler' 'd-runtime' 'd-stdlib')
depends=('perl' 'libmpc' 'cloog')
makedepends=('binutils>=2.22' 'git')
groups=('dlang' 'dlang-gdc')
conflicts=('gdc1-bin' 'gdc1-hg' 'gdc')
options=('!libtool' '!emptydirs' '!buildflags')
source=(ftp://gcc.gnu.org/pub/gcc/snapshots/${_gccver}-${_gccsnapshot}/gcc-${_gccver}-${_gccsnapshot}.tar.bz2
        ${_gitname}::git://github.com/D-Programming-GDC/GDC.git
        folders.diff)

pkgver()
{
  cd ${srcdir}/${_gitname}
  echo ${_gccver}.${_gccsnapshot}.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare()
{
  cd ${srcdir}/gcc-${_gccver}-${_gccsnapshot}

  # Do not run fixincludes
  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

  # Arch Linux installs x86_64 libraries in /lib
  [[ $CARCH == "x86_64" ]] && sed -i '/m64=/s/lib64/lib/' gcc/config/i386/t-linux64

  # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure

  cd ${srcdir}/${_gitname}
  git apply $srcdir/folders.diff # fix gdc_include_path
  ./setup-gcc.sh ../gcc-${_gccver}-${_gccsnapshot}

  mkdir ${srcdir}/gcc-build
}

build()
{
  cd ${srcdir}/gcc-build

  ${srcdir}/gcc-${_gccver}-${_gccsnapshot}/configure --prefix=/usr \
        --libdir=/usr/lib --libexecdir=/usr/lib \
        --mandir=/usr/share/man --infodir=/usr/share/info \
        --with-bugurl=https://bugs.archlinux.org/ \
        --enable-languages=d \
        --enable-shared --enable-threads=posix \
        --with-system-zlib --enable-__cxa_atexit \
        --disable-libunwind-exceptions --enable-clocale=gnu \
        --disable-libstdcxx-pch \
        --enable-gnu-unique-object --enable-linker-build-id \
        --enable-cloog-backend=isl --disable-cloog-version-check \
        --enable-lto --enable-gold --enable-ld=default \
        --enable-plugin --with-plugin-ld=ld.gold \
        --with-linker-hash-style=gnu --disable-install-libiberty \
        --disable-multilib --disable-libssp --disable-werror \
        --disable-nls --disable-bootstrap \
        --disable-libgomp --disable-libmudflap --disable-libquadmath

  make
}

package()
{
  #cd ${srcdir}/gcc-build

  # Easier to just do a full install and remove the excess later
  #make DESTDIR=${pkgdir} install

  # Delete all the stuff we don't need
  # rm -rf ${pkgdir}/usr/lib/gcc/${CHOST}/${_gccver}-${_gccsnapshot}/{*.a,*.so*,lto-wrapper,lto1,plugin*}
  # rm -rf ${pkgdir}/usr/lib/gcc/${CHOST}/${_gccver}-${_gccsnapshot}/{crt*,cc1,collect2,include*,install*}
  #rm -rf ${pkgdir}/usr/share/info
  #rm -rf ${pkgdir}/usr/lib/{libgcc*,libiberty*,libitm*,libstdc++*,libsupc++*,libasan*,libtsan*}
  #rm -rf ${pkgdir}/usr/share/man/man1/{cpp,gc,g++}*
  #rm -rf ${pkgdir}/usr/share/man/man7/{fsf,gfdl,gpl}*
  #rm -rf ${pkgdir}/usr/bin/{gcc,gcov,cpp,${CHOST}-gcc,${CHOST}-gcc-${_gccver}-${_gccsnapshot},c++,g++,${CHOST}-c++,${CHOST}-g++}
  #rm -rf ${pkgdir}/usr/bin/{gcc-ar,gcc-nm,gcc-ranlib,${CHOST}-gcc-ar,${CHOST}-gcc-nm,${CHOST}-gcc-ranlib}

  # Fix permissions
  #chmod 644 ${pkgdir}/usr/lib/*
  #chmod 755 ${pkgdir}/usr/lib/gcc

  # gdc
  install -D -m755 ${srcdir}/gcc-build/gcc/gdc ${pkgdir}/usr/bin/gdc
  install -D -m755 ${srcdir}/gcc-build/gcc/cc1d ${pkgdir}/usr/lib/gcc/${CHOST}/${_gccver}/cc1d

  # druntime
  install -D ${srcdir}/gdc/libphobos/libdruntime/object.di ${pkgdir}/usr/include/dlang/gdc/${pkgver}/object.di
  cp -r ${srcdir}/gdc/libphobos/libdruntime/core ${pkgdir}/usr/include/dlang/gdc/${pkgver}/core
  cp -r ${srcdir}/gdc/libphobos/libdruntime/gcc ${pkgdir}/usr/include/dlang/gdc/${pkgver}/gcc

  # phobos
  cp ${srcdir}/gdc/libphobos/src/crc32.d ${pkgdir}/usr/include/dlang/gdc/${pkgver}/crc32.d
  cp -r ${srcdir}/gdc/libphobos/src/std ${pkgdir}/usr/include/dlang/gdc/${pkgver}/std
  cp -r ${srcdir}/gdc/libphobos/src/etc ${pkgdir}/usr/include/dlang/gdc/${pkgver}/etc

  install -D -m644 ${srcdir}/gcc-build/${CHOST}/libphobos/src/libgphobos2.a ${pkgdir}/usr/lib/libgphobos2.a
}
sha256sums=('a1bac4e9fe8d8eca0c70fe22374e34abecd138dfc49130b01d73133f68b03b48'
            'SKIP'
            '82f1ba0825164a74660bd5008d8f3acae1bacc3271c86475efc1601fe0da73c4')
