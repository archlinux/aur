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
makedepends+=('gcc49')
conflicts=("gcc${_pkgver//\./}-multilib")
options=('staticlibs' '!libtool') # libiberty builds with all flags removed
source=(
  "ftp://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}"/gcc-{core,g++,fortran,objc,java}-"${pkgver}.tar.bz2"
  'gcc_pure64.patch'
  'siginfo_t_fix.patch'
)
sha256sums=('86af1703be5cc7f40270a66ac15ebcf6088706a789ae1bf18488dc070777f979'
            '0e765849e5ea09a662889b323b69955aac06d9a5bc1b1246ffa7ac90d2f8bd80'
            '21dee6ef25fac3df42704465865266e895955db23b8000ade4196e388adb7889'
            '0c3c552320d5e052eec8471bd3bf89b3fd10f2ed129ae89861828b24d10c21ce'
            'da1d5fa9431457d39841991465f1825fc49f09a7999ca31309bbd5972c95860f'
            '2d369cf93c6e15c3559c3560bce581e0ae5f1f34dc86bca013ac67ef1c1a9ff9'
            '24cb033fa363148952b5ed7cdff635fbee0ae55ecafe5dfa32206e97cb0c4af3')
PKGEXT='.pkg.tar.gz'

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

  sed -e 's:\bstruct ucontext\b:ucontext_t:g' -i $(grep --include '*.[ch]' --include '*.cc' -lre '\bstruct ucontext\b')
  sed -e 's:\bstruct sigaltstack\b:stack_t:g' -i $(grep --include '*.[ch]' --include '*.cc' -lre '\bstruct sigaltstack\b')

  case "${CARCH}" in
  'x86_64') patch -Np1 -i '../gcc_pure64.patch';;
  esac

  echo "${pkgver}" > 'gcc/BASE-VER'

  rm -rf 'gcc-build'
  mkdir 'gcc-build'

  set +u
}

build() {
  set -u
  if [ ! -s "${_basedir}/gcc-build/Makefile" ]; then
    cd "${_basedir}"

    # Doesn't like FORTIFY_SOURCE
    CPPFLAGS="${CPPFLAGS//-D_FORTIFY_SOURCE=?/}"

    # Doesn't like -fstack-protector-strong
    CFLAGS="${CFLAGS//-fstack-protector-strong/-fstack-protector}"
    CXXFLAGS="${CXXFLAGS//-fstack-protector-strong/-fstack-protector}"

    # using -pipe causes spurious test-suite failures
    # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=48565
    CFLAGS="${CFLAGS/-pipe/}"
    CXXFLAGS="${CXXFLAGS/-pipe/}"

    # Flags from new compilers that old compilers don't recognize
    CFLAGS="${CFLAGS/-fno-plt/}"
    CXXFLAGS="${CXXFLAGS/-fno-plt/}"

    CFLAGS="${CFLAGS/-Wformat-overflow=[0-9]/}"
    CXXFLAGS="${CXXFLAGS/-Wformat-overflow=[0-9]/}"

    cd 'gcc-build'
    # The following options are one per line, mostly sorted so they are easy to diff compare to other gcc packages.
    ../configure \
      --build="${CHOST}" \
      --enable-libgomp \
      --disable-libmudflap \
      --disable-libssp \
      --disable-libstdcxx-pch \
      --disable-multilib \
      --disable-werror \
      --enable-__cxa_atexit \
      --enable-clocale='gnu' \
      --enable-languages='c,c++' \
      --enable-shared \
      --enable-threads='posix' \
      --enable-version-specific-runtime-libs \
      --infodir='/usr/share/info' \
      --libdir='/usr/lib' \
      --libexecdir='/usr/lib' \
      --mandir='/usr/share/man' \
      --program-suffix="-${_pkgver}" \
      --with-cloog \
      --with-ppl \
      --with-system-zlib \
      --with-tune='generic' \
      --prefix='/usr' \
      CXX='g++-4.9' CC='gcc-4.9'
#     --enable-checking=release \
  fi

  local _nproc="$(nproc)"; _nproc=$((_nproc>8?8:_nproc))
  #LD_PRELOAD='/usr/lib/libstdc++.so' \\
  nice make -j "${_nproc}"
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
