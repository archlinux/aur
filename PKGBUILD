# Maintainer: Geballin - Guillaume Ballin <macniaque at free dot fr>
pkgname=insight-git
pkgver=14.0.50.20230506_git.r646.f988690
pkgrel=1
pkgdesc="Insight is a graphical user interface to GDB, the GNU Debugger written in Tcl/Tk."
url="https://sourceware.org/git/?p=insight.git"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('tcl' 'tk' 'gdb' 'tk-itk' 'tcl-combobox' 'iwidgets')
optdepends=()
makedepends=(git texinfo)
provides=("insight")
conflicts=('insight')
replaces=()
backup=()
options=('!buildflags')
install=
source=(git+https://sourceware.org/git/insight.git
	build.sh
	gdb_acinclude.m4.patch
	libgui_acinclude.m4.patch
	configure.ac.patch
	binutils-gdb_config_override.m4.patch)

md5sums=('SKIP'
	'4817d3935ad0815c3a76cbbc11cd0b1c'
	'a4a50d98e6cfdc38bc8187b34ce451fa'
	'67588c209da7505a07c44532f6e973ae'
	'a657612d67bc37b53b874b07aaf68873'
	'3f329bccc0724dd689143c45c583f876')

pkgver() {
  cd insight

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

prepare() {
  git -C insight submodule update --init --recursive --progress
}

build() {
  cd insight
  patch -u libgui/acinclude.m4 -i ../libgui_acinclude.m4.patch
  patch -u binutils-gdb/gdb/acinclude.m4 -i ../gdb_acinclude.m4.patch
  patch -u binutils-gdb/config/override.m4 -i ../binutils-gdb_config_override.m4.patch
  patch -u configure.ac -i ../configure.ac.patch
  aclocal
  autoconf
  sh ../build.sh
  make
  }

package() {
  cd insight
  make DESTDIR="${pkgdir}" install-host-nogcc

  ## Clean up files we do not want (already installed by gdb package)
  cd ${pkgdir}/usr
  rm etc/gprofng.rc
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
