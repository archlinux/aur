# Maintainer: dreieck
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>

pkgbase='gdb-debug-git'
pkgname=('gdb-debug-git' 'gdb-debug-common-git')
pkgver=14.0.50.20230412_git.r114328.0a12bf174dd
pkgrel=1
pkgdesc="The GNU Debugger from git. Compiled with debug information."
arch=(
  'i686'
  'x86_64'
)
url="http://www.gnu.org/software/gdb/"
license=('GPL3')
makedepends=(
  'git'
  'source-highlight'
)
options=(
  'debug'
  '!libtool'
  '!strip'
)
source=('gdb::git+https://sourceware.org/git/binutils-gdb.git')
sha256sums=('SKIP')

options+=('ccache')

pkgver() {
  cd "$srcdir/gdb"

  # _ver="$(git describe --tags | sed -E -e 's|^gdb-||' -e 's|-branchpoint||' -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
  # _ver="$(sed -E -e "s|DATE|$(git log -1 --date=format:'%Y%m%d' --format='%ad')|" gdb/version.in | tr '-' '_')"
  _ver="$(sed -E -e "s|DATE|$(date +%Y%m%d)|" gdb/version.in | tr '-' '_')"
  _rev="$(git rev-list --count HEAD)"
  # _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Could not determine version."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_hash}"
  fi
}

build() {
  cd "$srcdir/gdb"

  [[ -d build ]] || mkdir -p build
  cd build
  _DEBUG_FLAGS='-Og -fno-lto -gdwarf-5 -ggdb -gno-strict-dwarf -g3 -gpubnames -grecord-gcc-switches -fno-eliminate-unused-debug-symbols -fvar-tracking -fvar-tracking-assignments -fdebug-types-section -fno-stack-protector -fno-omit-frame-pointer -D_FORTIFY_SOURCE=0 -DDEBUG'
  CFLAGS="  ${_DEBUG_FLAGS} -fcommon"
  CXXFLAGS="${_DEBUG_FLAGS} -fpermissive"
  export CFLAGS
  export CXXFLAGS

  ../configure \
    --prefix=/usr \
    --disable-nls \
    --disable-gold \
    --disable-ld \
    --disable-gprofng \
    --enable-source-highlight \
    --enable-tui \
    --with-system-readline \
    --with-python=/usr/bin/python \
    --with-guile=guile-3.0 \
    --with-system-gdbinit=/etc/gdb/gdbinit \
    --enable-default-compressed-debug-sections-algorithm=zstd \
    --enable-year2038 \
    --enable-libada \
    --enable-libssp \
    --disable-lto \
    --disable-gdbtk \
    --enable-plugins \
    --enable-threading \
    --enable-libbacktrace \
    --enable-libctf \
    --disable-werror \
    --with-debuginfod \
    --without-libunwind-ia64 \
    --with-system-zlib \
    --with-zstd \
    --with-expat \
    --with-intel-pt \
    --with-xxhash \
    --with-lzma \
    --without-tcl \
    --without-tk \
    --with-x \
    --with-babeltrace

  make
}

package_gdb-debug-git() {
  depends=(
    'babeltrace'
    'expat'
    "gdb-common=${pkgver}"
    'guile'
    'libbacktrace'
    'libelf'
    'libipt'
    'mpfr'
    'ncurses'
    'python'
    'source-highlight'
    'xxhash'
    'xxhash'
    'xz'
    'zlib'
  )
  optdepends=(
    'debuginfod: Retrieve debugging information at runtime from specified debuginfod servers.'
    'insight: For a GUI to GDB.'
  )
  provides=(
    "gdb=${pkgver}"
    "gdb-debug=${pkgver}"
    "gdb-git=${pkgver}"
  )
  conflicts=('gdb')
  backup=(etc/gdb/gdbinit)

  cd "$srcdir/gdb/build"

  # install only gdb, otherwise it would install files already provided by binutils
  make DESTDIR="$pkgdir/" install-gdb

  # install "custom" system gdbinit
  install -dm755 "$pkgdir"/etc/gdb
  touch "$pkgdir"/etc/gdb/gdbinit

  # comes from gdb-common
  rm -r "$pkgdir/usr/share/gdb/"
}

package_gdb-debug-common-git() {
  provides=(
    "gdb-common=${pkgver}"
    "gdb-common-git=${pkgver}"
    "gdb-debug-common=${pkgver}"
  )
  conflicts=('gdb-common')
  depends=('python-pygments' 'guile')
  cd "$srcdir/gdb/build"
  make -C gdb/data-directory DESTDIR="$pkgdir" install
}
