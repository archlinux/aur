# Contributor: ABDULLATIF <bourou01dev@gmail.com>

pkgname=gcc-msp430
pkgver=4.6.3
pkgrel=1
pkgdesc="GNU toolchain for the TI MSP430 processor"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/mspgcc/"
license=('GPL')
makedepends=('binutils-msp430')
depends=('elfutils' 'libmpc')
options=(!strip !emptydirs !libtool)

_mspgcc_ver=20120406
_gnu_mirror="http://ftpmirror.gnu.org"
_sf_base="http://sourceforge.net/projects/mspgcc/files"
_patches_base="${_sf_base}/Patches/LTS/${_mspgcc_ver}"

_patches=(msp430-gcc-${pkgver}-20120406-sf3540953.patch
          msp430-gcc-${pkgver}-20120406-sf3559978.patch)

source=("http://sourceforge.net/projects/mspgcc/files/mspgcc/mspgcc-${_mspgcc_ver}.tar.bz2"
        "${_gnu_mirror}/gcc/gcc-${pkgver}/gcc-${pkgver}.tar.bz2"
        "${_patches[0]}::${_patches_base}/${_patches[0]}/download"
        "${_patches[1]}::${_patches_base}/${_patches[1]}/download"
        "0001_gcc-doc-texinfo-5.0.patch" 
        "patch-gcc_cp_cfns.h" 
        "patch-gcc46-texi.diff"
        "ira-int.h-segmentation-fault.patch")
sha1sums=('cc96a7233f0b1d2c106eff7db6fc00e4ed9039a8'
          'ce317ca5c8185b58bc9300182b534608c578637f'
          '9de4e74d8ceb2005409e03bf671e619f2e060082'
          '3721d13fd9a19df60fe356e082e6cea4ea637dbc'
          '0f5e63dc6a689976014c6cc87d5be28eb4ee922b'
          '007b353cf1bb10f11759169027ad49259527e607'
          '3372d92b1b422f64ce53fe0c73883513ea3478d1'
          '4d59f1a5b9a0c76393fb4709196d579f0aa40812')

_builddir=build



prepare() {
  cd "${srcdir}/gcc-${pkgver}"

  # https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=avr-gcc-atmel
  # https://bugs.archlinux.org/task/34629
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure gcc/configure


  #https://github.com/DragonFlyBSD/DPorts/issues/136
  patch -p0 < "${srcdir}/patch-gcc_cp_cfns.h"

  #https://trac.macports.org/ticket/53076
  #The attached patch patch-gcc46-texi.diff fixed the gcc46 build with texinfo 6.3 by repairing minor errors in ./gcc/doc/gcc.texi. 
  patch -p0 < "${srcdir}/patch-gcc46-texi.diff"


  #https://gcc.gnu.org/bugzilla/show_bug.cgi?id=54638
  #https://gcc.gnu.org/viewcvs/gcc?view=revision&revision=191606
  patch -p0 < "${srcdir}/ira-int.h-segmentation-fault.patch"

  #export CFLAGS="-O2 -pipe"
  #export CXXFLAGS="-O2 -pipe"

  _patch_name="msp430-gcc-${pkgver}-${_mspgcc_ver}.patch"
  (cd "${srcdir}/gcc-${pkgver}" &&
    patch -p1 < "${srcdir}/mspgcc-${_mspgcc_ver}/${_patch_name}" &&
    patch -p1 < "${srcdir}/0001_gcc-doc-texinfo-5.0.patch" &&
    for patch in ${_patches[@]} ; do
      msg "Applying ${patch}"
      patch -p1 < "${srcdir}/${patch}"
    done)

  rm -frv ${_builddir}
  mkdir -p ${_builddir} && cd ${_builddir}
}


build() {
  cd ${srcdir}/gcc-${pkgver}/${_builddir}
  CFLAGS="-Os -g0 -s" "${srcdir}/gcc-${pkgver}/configure" \
               CFLAGS_FOR_TARGET="-Os" \
               --prefix=/usr \
               --infodir=/usr/share/info \
               --mandir=/usr/share/man \
               --disable-libssp \
               --disable-nls \
               --target=msp430 \
               --enable-languages=c,c++ \
               --with-gnu-as \
               --with-gnu-ld \
               --with-as=/usr/bin/msp430-as \
               --with-ld=/usr/bin/msp430-ld \
               --with-pkgversion="mspgcc_${_mspgcc_ver}"
  make
}

package() {
  cd ${srcdir}/gcc-${pkgver}/${_builddir}
  make DESTDIR=${pkgdir} install

  rm -f  ${pkgdir}/usr/lib/libiberty.a
  rm -rf ${pkgdir}/usr/share/man/man7
  rm -rf ${pkgdir}/usr/share/info

  msg "Stripping debugging symbols from binaries"
  local binary
  find ${pkgdir} -type f 2>/dev/null | while read binary ; do
    case "$(file -biz "$binary")" in
      *compressed-encoding*)      # Skip compressed binarys
        ;;
      *application/x-executable*) # Binaries
        /usr/bin/strip "$binary" >/dev/null 2>&1 ;;
    esac
  done
}

# vim:set sts=2 ts=2 sw=2 et:
