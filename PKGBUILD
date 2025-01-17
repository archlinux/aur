# Maintainer: xiliuya <xiliuya@aliyun.com>
# Contributor: Geballin - Guillaume Ballin <macniaque at free dot fr>
pkgname=insight
pkgver=15.2.r719.f487d9c
pkgrel=3
pkgdesc="Insight is a graphical user interface to GDB, the GNU Debugger written in Tcl/Tk."
url="https://sourceware.org/git/?p=insight.git"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('tcl' 'tk' 'gdb' 'tk-itk' 'tcl-combobox' 'iwidgets')
optdepends=()
makedepends=(git)
provides=("insight")
replaces=()
backup=()
options=('!buildflags')
install=
_commit="f487d9c304d42f5253fe81c274c0b8e4a1556060"
_gdb_ver=15.2
source=(git+https://sourceware.org/git/insight.git#commit=$_commit
        gdb-$_gdb_ver.tar.gz::https://sourceware.org/pub/gdb/releases/gdb-$_gdb_ver.tar.gz
	gdb_acinclude.m4.patch
	libgui_acinclude.m4.patch
	configure.ac.patch
	binutils-gdb_config_override.m4.patch
	gdbtk-cmds.patch
	gdbtk-hooks.patch)

md5sums=('SKIP'
        'e50e995c8c0b76be73c68bed6e747037'
	'a4a50d98e6cfdc38bc8187b34ce451fa'
	'67588c209da7505a07c44532f6e973ae'
	'a657612d67bc37b53b874b07aaf68873'
	'3f329bccc0724dd689143c45c583f876'
	'487b543074709df95ee5b0f5175c0ac4'
	'0629ff69bdd940fd482f68792a7c85ac')

pkgver() {
  cp -r gdb-$_gdb_ver/* insight/binutils-gdb/
  cd insight/
  _ver="$(sed -E -e "s|DATE|$(git log -1 --date=format:'%Y%m%d' --format='%ad')|" binutils-gdb/gdb/version.in | tr '-' '_')"
  _rev="$(git rev-list --count HEAD)"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Could not determine version."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_hash}"
  fi
}

# prepare() {
#   git -C insight submodule update --init --recursive --progress
# }

build() {
  cd insight
  patch -u libgui/acinclude.m4 -i ../libgui_acinclude.m4.patch
  patch -u binutils-gdb/gdb/acinclude.m4 -i ../gdb_acinclude.m4.patch
  patch -u binutils-gdb/config/override.m4 -i ../binutils-gdb_config_override.m4.patch
  patch -u configure.ac -i ../configure.ac.patch
  patch -u gdbtk/generic/gdbtk-cmds.c -i ../gdbtk-cmds.patch
  patch -u gdbtk/generic/gdbtk-hooks.c -i ../gdbtk-hooks.patch
  aclocal
  autoconf
  ./configure	--prefix=/usr \
		--libdir=/usr/lib64 \
		--disable-binutils \
		--disable-elfcpp \
		--disable-gas \
		--disable-gold \
		--disable-gprof \
		--disable-ld \
		--disable-rpath \
		--disable-zlib \
		--enable-sim \
		--with-gdb-datadir=/usr/share/insight \
		--with-jit-reader-dir=/usr/lib64/insight \
		--with-separate-debug-dir='/usr/lib/debug' \
		--with-expat \
		--with-python \
		--without-libunwind
  make
  }

package() {
  cd insight
  make DESTDIR="${pkgdir}" install-host-nogcc

  ## Clean up files we do not want (already installed by gdb package)
  cd ${pkgdir}/usr
  # rm etc/gprofng.rc
  rm -rf lib
  rm     lib64/lib*
  mv lib64 lib
  rm     bin/g*
  rm -rf include
  rm -rf lib/gprofng
  rm -rf share/info
  rm -rf share/locale
  rm -rf share/man
  }
