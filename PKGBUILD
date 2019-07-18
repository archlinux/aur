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
#_cloogver='0.18.4'  # comment out to disable

set -u
_pkgver='6.4'
pkgname='gcc63-multilib'
_snapshot='6-20181024'
pkgver="${_pkgver}.1_${_snapshot#*-}"
_islver='0.17'
#_commit='4fc407888a30c5d953816b05c8a8e98ec2ab3101' # Pulling commits this big is too slow!
pkgrel='1'
pkgdesc="The GNU Compiler Collection for multilib (${_pkgver}.x)"
arch=('x86_64')
url='http://gcc.gnu.org'
license=('GPL' 'LGPL' 'FDL' 'custom')
depends=('zlib' 'lib32-zlib' 'libmpc>=0.8.1' 'glibc' 'lib32-glibc')
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
provides=("gcc${_pkgver//\./}") # no version as it is completely contained in the name
conflicts=("gcc${_pkgver//\./}")
options=('!emptydirs' '!strip')
source=(
  #"git+https://gcc.gnu.org/git/gcc.git#commit=${_commit}"
  #"gcc-${pkgver%%_*}.tgz::https://github.com/gcc-mirror/gcc/archive/${_commit}.tar.gz"
  "http://mirrors.concertpass.com/gcc|snapshots/LATEST-6/gcc-${_snapshot}.tar.xz" # Please do not use a snapshot before it has been announced with a LATEST- symlink.
  "http://isl.gforge.inria.fr/isl-${_islver}.tar.bz2"
)
if [ ! -z "${_cloogver:=}" ]; then
  source+=("http://www.bastoul.net/cloog/pages/download/cloog-${_cloogver}.tar.gz")
fi
sha256sums=('7608f5316c4af177166699aeb40cf41a977520857ef7ad571dc12a5e8e5d9a50'
            '439b322f313aef562302ac162caccb0b90daedf88d49d62e00a5db6b9d83d6bb')

PKGEXT='.pkg.tar.gz' # Uncompressed: 1.3GB, gz=500MB 1.1 minutes, xz=275MB 9.5 minutes

if [ -n "${_snapshot:-}" ]; then
  _basedir="gcc-${_snapshot}"
else
  _basedir="gcc-${pkgver}"
fi

#_libdir="usr/lib/gcc/${CHOST:-}/${pkgver%%_*}"

# https://gcc.gnu.org/mirrors.html
_setmirror() {
  local _cmd="${BASH_SOURCE[*]}" # want [*] not [@]
  local _lang="${LANG:-}" # mksrcinfo removes LANG
  if [ "${_cmd/makepkg/}" != "${_cmd}" ] && [ ! -z "${_lang}" ]; then
    local _mirrors=()
    _lang="${_lang%%\.*}"
    _lang="${_lang##*_}"
    case "${_lang}" in
    'CA') _mirrors+=(
      'http://gcc.parentingamerica.com/'
      'http://gcc.skazkaforyou.com/'
      'http://ca.mirror.babylon.network/gcc/'
      );;
    'FR') _mirrors+=(
      # 'ftp://ftp.lip6.fr/pub/gcc/' # no snapshots
      'ftp://ftp.irisa.fr/pub/mirrors/gcc.gnu.org/gcc/'
      'http://fr.mirror.babylon.network/gcc/'
      'ftp://ftp.uvsq.fr/pub/gcc/'
      );;
    'DE') _mirrors+=(
      'ftp://ftp.fu-berlin.de/unix/languages/gcc/'
      'http://www.bothelp.net/mirrors/gcc/'
      'ftp://ftp.gwdg.de/pub/misc/gcc/'
      'ftp://ftp.mpi-sb.mpg.de/pub/gnu/mirror/gcc.gnu.org/pub/gcc/'
      #'http://gcc.cybermirror.org/' # Maintenance
      );;
    'GR') _mirrors+=('ftp://ftp.ntua.gr/pub/gnu/gcc/');;
    'HU') _mirrors+=('http://robotlab.itk.ppke.hu/gcc/');;
    'JP') _mirrors+=('http://ftp.tsukuba.wide.ad.jp/software/gcc/');;
    'NL') _mirrors+=(
      'http://nl.mirror.babylon.network/gcc/'
      'ftp://ftp.nluug.nl/mirror/languages/gcc/'
      );;
    #'SL') _mirrors+=('http://gcc.fyxm.net/');; # invalid response, no files
    'UK') _mirrors+=('ftp://ftp.mirrorservice.org/sites/sourceware.org/pub/gcc/');;
    'US') _mirrors+=(
      'http://www.netgull.com/gcc/'
      'http://mirrors-usa.go-parts.com/gcc/'
      'http://mirrors.concertpass.com/gcc/'
      );;
    esac
    local _mc="${#_mirrors[@]}"
    if [ "${_mc}" -ne 0 ]; then
      _mc=$((${RANDOM} % ${_mc}))
      _mc="${_mirrors[${_mc}]%/}"
      source[0]="${_mc}/${source[0]##*|}"
      set +u
      msg "Alternate mirror: ${_mc}"
      set -u
    fi
  fi
}
if [ "${source[0]//|/}" != "${source[0]}" ]; then
  _setmirror
  source[0]="${source[0]//|/\/}"
fi
unset -f _setmirror

prepare() {
  set -u
  cd "${_basedir}"

  # link isl/cloog for in-tree builds
  ln -s "../isl-${_islver}" 'isl'
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

  # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
  sed -e '/^ac_cpp=/ s/\$CPPFLAGS/\$CPPFLAGS -O2/' -i {libiberty,gcc}/configure

  # remove -V and -qversion as their aren't supported in gcc7
  sed -e 's/ -V -qversion/ /g' -i $(grep --include='configure' -lrFe '-V -qversion')

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
      _languages+=',fortran,go,lto,objc,obj-c++'
    fi
    # using -pipe causes spurious test-suite failures
    # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=48565
    CFLAGS="${CFLAGS/-pipe/}"
    CXXFLAGS="${CXXFLAGS/-pipe/}"

    # Flags from new compilers that old compilers don't recognize
    CFLAGS="${CFLAGS/-fno-plt/}"
    CXXFLAGS="${CXXFLAGS/-fno-plt/}"

    CFLAGS="${CFLAGS/-Wformat-overflow=[0-9]/}"
    CXXFLAGS="${CXXFLAGS/-Wformat-overflow=[0-9]/}"

    ../configure "${_cfgopts[@]}" \
      --build="${CHOST}" \
      --disable-libstdcxx-pch \
      --disable-libunwind-exceptions \
      --enable-multilib \
      --disable-werror \
      --enable-__cxa_atexit \
      --enable-checking='release' \
      --enable-clocale='gnu' \
      --enable-gnu-indirect-function \
      --enable-gnu-unique-object \
      --enable-install-libiberty \
      --enable-languages="c,c++${_languages}" \
      --enable-libmpx \
      --enable-linker-build-id \
      --enable-lto \
      --enable-plugin \
      --enable-shared \
      --enable-threads='posix' \
      --enable-version-specific-runtime-libs \
      --infodir='/usr/share/info' \
      --libdir='/usr/lib' \
      --libexecdir='/usr/lib' \
      --mandir='/usr/share/man' \
      --program-suffix="-${_pkgver}" \
      --with-bugurl='https://aur.archlinux.org/packages/gcc63-multilib/' \
      --with-isl \
      --with-linker-hash-style='gnu' \
      --with-pkgversion='Arch' \
      --with-system-zlib \
      --with-tune='generic' \
      --prefix='/usr'
#      CXX='g++-4.9' CC='gcc-4.9'
  fi

  local _nproc="$(nproc)"; _nproc=$((_nproc>8?8:_nproc))
  #LD_PRELOAD='/usr/lib/libstdc++.so' \\
  nice make -j "${_nproc}"

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

  #LD_PRELOAD='/usr/lib/libstdc++.so' \\
  make -j1 DESTDIR="${pkgdir}" install

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
