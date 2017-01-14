# Maintainer: Joey Dumont <joey.dumont@gmail.com>
# Contributor: frankspace
# Contributor: Renan Manola <rmanola@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Based on a modified version of the gcc PKGBUILD

pkgname=gcc-gcj
pkgver=6.3.1
pkgrel=2
_islver=0.17
_cloogver=0.18.4
_commit=4ca53f06ff7d346ef8021a23108f23a5406a0417
pkgdesc="The GNU Compiler for Java"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
url="http://gcc.gnu.org"
depends=('gtk2' 'libxtst' 'alsa-lib' 'libmpc>=0.8.1' 'classpath' 'gcc-gcj-ecj')
makedepends=('mpfr>=2.4.2' 'elfutils' 'jack' 'zip' 'gcc=6.3.1' 'libart-lgpl' 'git')
optdepends=('python2: for running /usr/bin/aot-compile'
  'java-environment: for runnig some jars')
options=('!libtool')
install=$pkgname.install
source=("https://github.com/gcc-mirror/gcc/archive/${_commit}.tar.gz"
        "http://isl.gforge.inria.fr/isl-${_islver}.tar.bz2"
	"http://www.bastoul.net/cloog/pages/download/cloog-${_cloogver}.tar.gz")
sha512sums=('177993bc99c1ca3a69255acee0b54529d63b9a384fcb5391d7e679c6611f9e45cea0fb5fe48bd9de1acdbe57265f9c0904b058cb17ea65e83fd66b6c66af6fe9'
            '8a2a51d8acbf966c37868fd714ee46cf0b87e1f9d8d9d3148eb2c4b331b7170916d7392fee7fa0af73988a3b8583a6e937dd643b5a574b7e61a09c5bc3347c27'
            'd35d67b08ffe13c1a010b65bfe4dd02b0ae013d5b489e330dc950bd3514defca8f734bd37781856dcedf0491ff6122c34eecb4b0fe32a22d7e6bdadea98c8c23')

prepare() {
  echo "You need at least 10GB of space to compile gcc-gcj,"
  echo "and it will take a lot of time (~ hours)."
  echo "It is better to compile it using makepkg directly."
  sleep 5
  cd "$srcdir"/gcc-${_commit}/

  # Link isl/cloog for in-tree builds
  ln -sf ../isl-${_islver} isl
  ln -sf ../cloog-${_cloogver} cloog
  
  # Do not run fixincludes
  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

  # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure

  # Arch Linux installs x86_64 libraries /lib
  [[ $CARCH == "x86_64" ]] && sed -i '/m64=/s/lib64/lib/' gcc/config/i386/t-linux64

  # Arch uses python version 3 as default python
  sed -i '1s+python+python2+' libjava/contrib/aot-compile.in

  [ -d build ] || mkdir build

}

build() {

  # Configure and build gcc-gcj.
  cd ${srcdir}/gcc-${_commit}/build

  ../configure                          \
      --prefix=/usr                     \
      --enable-shared                   \
      --enable-languages=java           \
      --enable-threads=posix            \
      --mandir=/usr/share/man           \
      --infodir=/usr/share/info         \
      --enable-__cxa_atexit             \
      --disable-multilib                \
      --libdir=/usr/lib                 \
      --libexecdir=/usr/lib             \
      --enable-clocale=gnu              \
      --disable-libstdcxx-pch           \
      --with-tune=generic               \
      --enable-java-awt=gtk             \
      --with-java-home="$JAVA_HOME"     \
      --enable-libgcj-multifile         \
      --disable-plugin                  \
      --with-system-zlib                \
      --enable-cloog-backend=isl        \
      --disable-install-libiberty

  make
}

package() {

  # Install libjava.
  cd ${srcdir}/gcc-${_commit}/build
  make -j1 DESTDIR=${pkgdir} install-target-libjava

  # Install java-common.
  cd gcc
  make -j1 DESTDIR=${pkgdir} java.install-common java.install-man

  _arch_str=
  if [ "${CARCH}" = "x86_64" ]; then
    _arch_str=x86_64-pc-linux-gnu

  elif [ "${CARCH}" = "i686" ]; then
    _arch_str=i686-pc-linux-gnu

  fi

  install -m755 jc1       ${pkgdir}/usr/lib/gcc/${_arch_str}/${pkgver}/
  install -m755 jvgenmain ${pkgdir}/usr/lib/gcc/${_arch_str}/${pkgver}/

  # Remove files which belong to the base gcc package

  rm -f ${pkgdir}/usr/bin/{c,g}++
  rm -f ${pkgdir}/usr/bin/${_arch_str}-{c,g}++
  rm -f ${pkgdir}/usr/man/man1/g++.*

  rm ${pkgdir}/usr/lib/libgcc_s.so
  rm ${pkgdir}/usr/lib/libgcc_s.so.1
  rm ${pkgdir}/usr/lib/gcc/${_arch_str}/${pkgver}/crtbegin.o
  rm ${pkgdir}/usr/lib/gcc/${_arch_str}/${pkgver}/crtbeginS.o
  rm ${pkgdir}/usr/lib/gcc/${_arch_str}/${pkgver}/crtbeginT.o
  rm ${pkgdir}/usr/lib/gcc/${_arch_str}/${pkgver}/crtend.o
  rm ${pkgdir}/usr/lib/gcc/${_arch_str}/${pkgver}/crtendS.o
  rm ${pkgdir}/usr/lib/gcc/${_arch_str}/${pkgver}/crtfastmath.o
  rm ${pkgdir}/usr/lib/gcc/${_arch_str}/${pkgver}/crtprec32.o
  rm ${pkgdir}/usr/lib/gcc/${_arch_str}/${pkgver}/crtprec64.o
  rm ${pkgdir}/usr/lib/gcc/${_arch_str}/${pkgver}/crtprec80.o
  rm ${pkgdir}/usr/lib/gcc/${_arch_str}/${pkgver}/include/unwind.h
  rm ${pkgdir}/usr/lib/gcc/${_arch_str}/${pkgver}/libgcc.a
  rm ${pkgdir}/usr/lib/gcc/${_arch_str}/${pkgver}/libgcc_eh.a
  rm ${pkgdir}/usr/lib/gcc/${_arch_str}/${pkgver}/libgcov.a

  find ${pkgdir}/usr/lib -type f -name '*.so.*' -exec strip --strip-unneeded {} \;

  # Rename two files to not conflict to classpath
  mv ${pkgdir}/usr/share/info/cp-tools.info ${pkgdir}/usr/share/info/cp-tools-gcj.info
  mv ${pkgdir}/usr/share/man/man1/gjdoc.1 ${pkgdir}/usr/share/man/man1/gjdoc.gcj.1

  linkdir=`basename $pkgdir/usr/lib/gcj-${pkgver}*`
  ln -sf $linkdir ${pkgdir}/usr/lib/gcj-${pkgver%.?}
  ln -sf libgcj-${pkgver}.jar ${pkgdir}/usr/share/java/libgcj-${pkgver%.?}.jar
  ln -sf libgcj-${pkgver}.jar ${pkgdir}/usr/share/java/libgcj.jar
  ln -sf libgcj-tools-${pkgver}.jar ${pkgdir}/usr/share/java/libgcj-tools-${pkgver%.?}.jar
  ln -sf libgcj-tools-${pkgver}.jar ${pkgdir}/usr/share/java/libgcj-tools.jar

}
