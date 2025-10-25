# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: valandil: Joey Dumont <joey.dumont@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>

# toolchain build order: linux-api-headers->glibc->binutils->gcc->binutils->glibc
# NOTE: libtool requires rebuilt with each new gcc version

_opt_CPP_ONLY=0
_opt_ADA=0  # works 6-20170913
_opt_JAVA=0
# JAVA: 6-20170906: /usr/include/glib-2.0/glib/gmacros.h:232:53: error: size of array ‘_GStaticAssertCompileTimeAssertion_0’ is negative
# JAVA: -m32 version is using 64 bit include files from /usr/lib instead of the proper include files in /usr/lib32
_opt_SSP=1  # Stack Smashing Protection
_snapshot='' # '6-20181024'

set -u
pkgver='6.5.0'
#pkgver+="_${_snapshot#*-}"
_majorver="${pkgver: 0:1}"
pkgname="gcc${_majorver}-multilib"
_cloogver='0.18.4'  # comment out to disable
_islver='0.18'
#_commit='4fc407888a30c5d953816b05c8a8e98ec2ab3101' # Pulling commits this big is too slow!
pkgrel='1'
pkgdesc="The GNU Compiler Collection for multilib (${_majorver}.x)"
arch=('x86_64')
url='https://gcc.gnu.org'
license=('GPL-2.0-only' 'LGPL-2.1-only' 'GPL-3.0-only' 'LGPL-3.0-only' 'GFDL-1.3-only' 'custom')
depends=('glibc' 'gcc-libs' 'zlib' 'lib32-zlib' 'libmpc>=0.8.1' 'lib32-glibc')
makedepends=( # https://gcc.gnu.org/install/prerequisites.html
  'binutils>=2.28'
  'gcc-libs-multilib'
  'lib32-glibc>=2.25' 'lib32-gcc-libs'
  'bash'
  'gzip>=1.2.4'
  'bzip2>=1.0.2' 'lib32-bzip2'
  'gawk>=3.1.5'
  'gmp>=4.3.2' 'lib32-gmp'
  'mpfr>=2.4.2'
  'gettext>=0.14.5' 'lib32-gettext'
  'doxygen'
)
if [ "${_opt_JAVA}" -ne 0 ]; then
  #depends+=('gtk2' 'libxtst' 'alsa-lib') # from gcc63
  depends+=('classpath')
  #makedepends+=('jack') # gcc63
  makedepends+=('java-environment-common' 'zip' 'jdk8-openjdk' 'gtk2' 'lib32-gtk2' 'libart-lgpl' 'libxtst' 'lib32-libxtst')
fi
if [ "${_opt_ADA}" -ne 0 ]; then
  makedepends+=('gcc-ada-multilib') # GNAT
fi
if [ ! -z "${_commit:-}" ]; then
  makedepends+=('git')
fi
checkdepends=('dejagnu' 'inetutils')
provides=("gcc${_majorver}=${pkgver}") # no version as it is completely contained in the name
conflicts=("gcc${_majorver}")
#conflicts+=('gcc63-multilib') # temporary
options=('!emptydirs' '!strip' '!buildflags')
options+=('!lto')
source=(
  #"git+https://gcc.gnu.org/git/gcc.git#commit=${_commit}"
  #"gcc-${pkgver%%_*}.tgz::https://github.com/gcc-mirror/gcc/archive/${_commit}.tar.gz"
  #"http://www.netgull.com/gcc|snapshots/LATEST-6/gcc-${_snapshot}.tar.xz" # Please do not use a snapshot before it has been announced with a LATEST- symlink.
  "https://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.xz"
  #"http://isl.gforge.inria.fr/isl-${_islver}.tar.bz2"
  "https://gcc.gnu.org/pub/gcc/infrastructure/isl-${_islver}.tar.bz2"
  'libsanitizer.patch'
  '78_all-libsanitizer-Fix-build-with-glibc-2.42.patch'
  '79_all-sanitizer_common-Remove-reference-to-obsolete-termio.patch'
)
if [ ! -z "${_cloogver:=}" ]; then
  source+=("http://www.bastoul.net/cloog/pages/download/cloog-${_cloogver}.tar.gz")
fi
md5sums=('edaeff1cc020b16a0c19a6d5e80dc2fd'
         '11436d6b205e516635b666090b94ab32'
         '2a6c4acbaa7b374b5462f109e2af7076'
         'd8b68982a243f63234e83287c370d8b2'
         '97eb6307f4e2616ebd3840dd6cc2ed32'
         'e531f725244856c92c9bba009ff44faf')
sha256sums=('7ef1796ce497e89479183702635b14bb7a46b53249209a5e0f999bebf4740945'
            '6b8b0fd7f81d0a957beb3679c81bbb34ccc7568d5682844d8924424a0dadcb1b'
            'ab726012d4240c0aa11ee3f9f1617cef75d1f54fbf72fd495db688691a8dccb8'
            '87b5d01656a3400250190d4d6e54638805c7bc8e7be061bfacd599984652d4ea'
            '6a8d3ed842d5b1d99a88dbe758c0eabe59bfe2468cb2c58d9d4d15b6d970c74f'
            '325adf3710ce2229b7eeb9e84d3b539556d093ae860027185e7af8a8b00a750e')
sha512sums=('ce046f9a50050fd54b870aab764f7db187fe7ea92eb4aaffb7c3689ca623755604e231f2af97ef795f41c406bb80c797dd69957cfdd51dfa2ba60813f72b7eac'
            '85d0b40f4dbf14cb99d17aa07048cdcab2dc3eb527d2fbb1e84c41b2de5f351025370e57448b63b2b8a8cf8a0843a089c3263f9baee1542d5c2e1cb37ed39d94'
            'a92e15d39f8e870bb0f11f97d63757092451917144590af6dbebcab6b9d2fe26b705930f4ec738a065ced51d8fd0d9be43fb4c443c20f6f4afb5705cf240021f'
            '976f637303e810d415d33cd99a627ae607ad86e6a4f4c615158c4a5b68984536fbca2a87bff78927cccf5d869f64405e5321ac592d4b9c23513f20be59962811'
            '9944b497e4bc215736b84e0b19196c153082172cbfcf810226ec4f5e56f02f526547c198e709f23f76b181d15dd259aef1bf724fd24cd587bc85b96d5563b2ff'
            'd35d67b08ffe13c1a010b65bfe4dd02b0ae013d5b489e330dc950bd3514defca8f734bd37781856dcedf0491ff6122c34eecb4b0fe32a22d7e6bdadea98c8c23')

if [ -n "${_snapshot:-}" ]; then
  _basedir="gcc-${_snapshot}"
else
  _basedir="gcc-${pkgver}"
fi

#_libdir="usr/lib/gcc/${CHOST:-}/${pkgver%%_*}"

prepare() {
  set -u
  cd "${_basedir}"

  # link isl for in-tree build
  ln -s "../isl-${_islver}" 'isl'
  # Link cloog for in-tree builds
  if [ ! -z "${_cloogver}" ]; then
    ln -s "../cloog-${_cloogver}" 'cloog'
  fi

  # Do not run fixincludes
  sed -e 's@\./fixinc\.sh@-c true@' -i 'gcc/Makefile.in'

  # Arch Linux installs x86_64 libraries /lib
  case "${CARCH}" in
  'x86_64') sed -e '/m64=/ s/lib64/lib/' -i 'gcc/config/i386/t-linux64' ;;
  esac

  if ! grep -qFxe "${pkgver%%_*}" 'gcc/BASE-VER'; then
    echo "Version has changed from ${pkgver%%_*} to"
    cat 'gcc/BASE-VER'
    set +u
    false
  fi

  # Arch uses python version 3 as default python (for gcc6-gcj).
  sed -e '1s+python+python2+' -i 'libjava/contrib/aot-compile.in'

  # remove -V and -qversion as their aren't supported in gcc7
  sed -e 's/ -V -qversion/ /g' -i $(grep --include='configure' -lrFe '-V -qversion')

  # Apply patches
  local _pt
  for _pt in "${source[@]%%::*}"; do
    _pt="${_pt##*/}"
    case "${_pt}" in
    *.patch)
      set +u; msg2 "*** Applying patch ${_pt}"; set -u
      patch --no-backup-if-mismatch -Np1 -i "${srcdir}/${_pt}"
      ;;
    esac
  done

  rm -rf 'gcc-build'
  mkdir 'gcc-build'

  set +u
}

build() {
  set -u
  cd "${_basedir}/gcc-build"

  if [ ! -s 'Makefile' ]; then
    local _languages=''
    local _cfgopts=()
    if [ ! -z "${_cloogver}" ]; then
      _cfgopts+=(--enable-cloog-backend='isl')
    fi
    if [ "${_opt_ADA}" -ne 0 ]; then
      _languages+=',ada' # new languages always start with a comma
    fi
    if [ "${_opt_JAVA}" -ne 0 ]; then
      _languages+=',java'
      _cfgopts+=(--enable-java-awt='gtk' --enable-libgcj-multifile)
      _cfgopts+=(--with-java-home="$(find /usr/lib/jvm -maxdepth 1 -type 'd' -name '*openjdk*' -print -quit)") # works best with clean chroot
      #_cfgopts+=(--with-java-home='/usr/lib/jvm/java-8-jdk/jre')
    fi
    if [ "${_opt_SSP}" -eq 0 ]; then
      _cfgopts+=(--disable-libssp)
    fi
    if [ "${_opt_CPP_ONLY}" -eq 0 ]; then
      _languages+=',fortran,lto,objc,obj-c++'
    fi

    # The following options are one per line, mostly sorted so they are easy to diff compare to other gcc packages.
    local _conf=(
      --build="${CHOST}"
      --disable-libstdcxx-pch
      --disable-libunwind-exceptions
      --enable-multilib
      --disable-werror
      --enable-__cxa_atexit
      --enable-checking='release'
      --enable-clocale='gnu'
      --enable-gnu-indirect-function
      --enable-gnu-unique-object
      --enable-install-libiberty
      --enable-languages="c,c++${_languages}"
      --enable-libmpx
      --enable-linker-build-id
      --enable-lto
      --enable-plugin
      --enable-shared
      --enable-threads='posix'
      --enable-version-specific-runtime-libs
      --infodir='/usr/share/info'
      --libdir='/usr/lib'
      --libexecdir='/usr/lib'
      --mandir='/usr/share/man'
      --program-suffix="-${_majorver}"
      --with-bugurl="https://aur.archlinux.org/packages/${pkgname}/"
      --with-isl
      --with-linker-hash-style='gnu'
      --with-pkgversion='Arch'
      --with-system-zlib
      --with-tune='generic'
      --prefix='/usr'
      #CXX='g++-4.9' CC='gcc-4.9'
    )
    ../configure "${_cfgopts[@]}" "${_conf[@]}"

    #sed -e 's/^STAGE1_CXXFLAGS.*$/& -std=gnu++11/' -i 'Makefile'
  fi

  # The system stdc must be used when gcc links to some system libraries.
  LD_PRELOAD='/usr/lib/libstdc++.so' \
  nice -n1 make -s

  set +u; msg 'Compile complete'; set -u

  # make documentation
  make -s -j1 -C "${CHOST}/libstdc++-v3/doc" 'doc-man-doxygen'
  set +u
}

_check_disabled() {
  set -u
  cd "${_basedir}/gcc-build"

  # increase stack size to prevent test failures
  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=31827
  ulimit -s 32768

  # do not abort on error as some are "expected"
  make -j1 -k check || :
  "${srcdir}/${_basedir}/contrib/test_summary"
  set +u
}

package() {
  set -u
  cd "${_basedir}/gcc-build"

  LD_PRELOAD='/usr/lib/libstdc++.so' \
  make -j1 -s DESTDIR="${pkgdir}" install

  ## Lazy way of dealing with conflicting man and info pages and locales...
  rm -rf "${pkgdir}/usr"/{share,include}/
  find "${pkgdir}/" -name '*iberty*' -exec rm '{}' '+'

  # Move potentially conflicting stuff to version specific subdirectory
  case "${CARCH}" in
  'x86_64') mv "${pkgdir}/usr/lib/gcc/${CHOST}"/lib*/ "${pkgdir}/usr/lib/gcc/${CHOST}/${pkgver%%_*}/" ;;
  esac
  mv "${pkgdir}/usr/lib"/lib* "${pkgdir}/usr/lib/gcc/${CHOST}/${pkgver%%_*}/"

  # Install Runtime Library Exception
  install -Dpm644 '../COPYING.RUNTIME' \
    "${pkgdir}/usr/share/licenses/${pkgname}/RUNTIME.LIBRARY.EXCEPTION" || :
  set +u
}
set +u
