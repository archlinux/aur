# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Pedro Nariyoshi <pedro.nariyoshi@gmail.com>
# Prev-Maintainer: Carson Reynolds <carson@k2.t.u-tokyo.ac.jp>
# Contributor: kristianlm2 <kristanlein@gmail.com>
# Contributor: progtologist <arissynod@gmail.com>

set -u
_pkgver='4.3'
pkgname="gcc${_pkgver//\./}"
pkgver="${_pkgver}.6"
pkgrel='8'
pkgdesc="The GNU Compiler Collection (${_pkgver}.x)"
arch=('i686' 'x86_64')
url='http://gcc.gnu.org'
license=('GPL' 'LGPL')
depends=('glibc' 'gmp' 'binutils' 'mpfr' 'cloog' 'zlib' 'elfutils')
makedepends=('flex' 'bison' 'setconf')
#makedepends+=('gcc49')
conflicts=("gcc${_pkgver//\./}-multilib")
options=('!libtool' 'staticlibs' '!buildflags') # libiberty builds with all flags removed
source=(
  "ftp://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}"/gcc-{core,g++,fortran,objc,java}-"${pkgver}.tar.bz2"
  'gcc_pure64.patch'
  'siginfo_t_fix.patch'
  '0000-gcc-c11-toplev.diff::https://www.rockbox.org/gcc/gcc-c11-toplev.diff'
)
md5sums=('43df9ad8b4bb314a46bac12f5aefaec2'
         'ee7dc01b6e1a6a92a6e8d66adb8d2ab9'
         'c6eeee73007015c52043716fbe8ffdc7'
         '3fdb8158eabb765d1711f894bf71f7f5'
         'b5c12ad38048c354686747d640f5d621'
         '4030ee1c08dd1e843c0225b772360e76'
         'edce21b2ce295478d14d5dd988eb3287'
         'ea3bba5ee50ba043b992eaa22161e141')
sha256sums=('86af1703be5cc7f40270a66ac15ebcf6088706a789ae1bf18488dc070777f979'
            '0e765849e5ea09a662889b323b69955aac06d9a5bc1b1246ffa7ac90d2f8bd80'
            '21dee6ef25fac3df42704465865266e895955db23b8000ade4196e388adb7889'
            '0c3c552320d5e052eec8471bd3bf89b3fd10f2ed129ae89861828b24d10c21ce'
            'da1d5fa9431457d39841991465f1825fc49f09a7999ca31309bbd5972c95860f'
            '2d369cf93c6e15c3559c3560bce581e0ae5f1f34dc86bca013ac67ef1c1a9ff9'
            '24cb033fa363148952b5ed7cdff635fbee0ae55ecafe5dfa32206e97cb0c4af3'
            'aa81059bc71f335c962db6bbb8c5857a5cc76e2eb33b82ce1ccd6cb536b2bc31')

if [ -n "${_snapshot:-}" ]; then
  _basedir="gcc-${_snapshot}"
else
  _basedir="gcc-${pkgver}"
fi

#_libdir="usr/lib/gcc/${CHOST}/${pkgver}"

prepare() {
  set -u
  cd "${_basedir}"

  # Do not install libiberty
  sed -e 's/install_to_$(INSTALL_DEST) //' -i 'libiberty/Makefile.in'

  # Disables generating documentation (new texinfo does not like the old .texi files)
  echo 'MAKEINFO = :' >> 'Makefile.in'

  # Do not run fixincludes
  sed -e 's@\./fixinc\.sh@-c true@' -i 'gcc/Makefile.in'

  patch -Np1 -i "${srcdir}/siginfo_t_fix.patch"

  patch -Np1 -i "${srcdir}/0000-gcc-c11-toplev.diff"

  case "${CARCH}" in
  'x86_64') patch -Np1 -i '../gcc_pure64.patch';;
  esac

  # fix build with glibc 2.26
  sed -e 's:\bstruct ucontext\b:ucontext_t:g' -i $(grep --include '*.[ch]' --include '*.cc' -lre '\bstruct ucontext\b')
  sed -e 's:\bstruct sigaltstack\b:stack_t:g' -i $(grep --include '*.[ch]' --include '*.cc' -lre '\bstruct sigaltstack\b')

  echo "${pkgver}" > 'gcc/BASE-VER'

  rm -rf 'gcc-build'
  mkdir 'gcc-build'

  set +u
}

build() {
  set -u
  if [ ! -s "${_basedir}/gcc-build/Makefile" ]; then
    cd "${_basedir}"

    cd 'gcc-build'
    # The following options are one per line, mostly sorted so they are easy to diff compare to other gcc packages.
    local _conf=(
      --build="${CHOST}"
      --disable-libmudflap
      --disable-libssp
      --disable-libstdcxx-pch
      --disable-werror
      --enable-__cxa_atexit
      #--enable-checking=release
      --enable-clocale='gnu'
      --enable-languages='c,c++'
      --enable-libgomp
      --disable-multilib
      --enable-shared
      --enable-threads='posix'
      --enable-version-specific-runtime-libs
      --infodir='/usr/share/info'
      --libdir='/usr/lib'
      --libexecdir='/usr/lib'
      --mandir='/usr/share/man'
      --program-suffix="-${_pkgver}"
      --with-cloog
      --with-ppl
      --with-system-zlib
      --with-tune='generic'
      --prefix='/usr'
      #CXX='g++-4.9' CC='gcc-4.9'
    )
    ../configure "${_conf[@]}"

    sed -e 's/^STAGE1_CXXFLAGS.*$/& -std=gnu++11/' -i 'Makefile'
  fi

  cd "${srcdir}/${_basedir}/gcc-build"
  #LD_PRELOAD='/usr/lib/libstdc++.so' \\
  nice make -s

  set +u
}

package() {
  set -u
  cd "${_basedir}/gcc-build"

  #LD_PRELOAD='/usr/lib/libstdc++.so' \\
  make -j1 DESTDIR="${pkgdir}" install

  ## Lazy way of dealing with conflicting man and info pages and locales...
  rm -rf "${pkgdir}/usr/share/man/man7"
  rm -rf "${pkgdir}/usr/share/locale"

  # Move potentially conflicting stuff to version specific subdirectory
  #case "${CARCH}" in
  #'x86_64') mv "${pkgdir}/usr/lib/gcc/${CHOST}"/lib*/ "${pkgdir}/usr/lib/gcc/${CHOST}/${pkgver}/" ;;
  #esac
  mv "${pkgdir}/usr/lib/gcc/${CHOST}"/lib* "${pkgdir}/usr/lib/gcc/${CHOST}/${pkgver}/"

  # Create links for gcc build environment (useful for CUDA)
  mkdir -p "${pkgdir}/opt/gcc-${_pkgver}"
  ln -s "/usr/bin/gcc-${_pkgver}" "${pkgdir}/opt/gcc-${_pkgver}/gcc"
  ln -s "/usr/bin/g++-${_pkgver}" "${pkgdir}/opt/gcc-${_pkgver}/g++"

  # Avoid file conflicts when enabling libgomp
  rm -rf "${pkgdir}/usr/share/info"

  # Install Runtime Library Exception
  install -Dpm644 '../COPYING.RUNTIME' \
    "${pkgdir}/usr/share/licenses/${pkgname}/RUNTIME.LIBRARY.EXCEPTION" || :
  set +u
}
set +u
