# Maintainer: Geballin - Guillaume Ballin <macniaque at free dot fr>
pkgname=insight-git
pkgver=1
pkgrel=1
pkgdesc="Insight is a graphical user interface to GDB, the GNU Debugger written in Tcl/Tk."
url="https://sourceware.org/git/?p=insight.git"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('tcl' 'tk' 'gdb' 'itk' 'tcl-combobox' 'iwidgets')
optdepends=()
makedepends=(gcc make)
conflicts=()
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

prepare() {
  git -C insight submodule update --init --recursive
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
  cd ${pkgdir}/usr
  rm bin/g*
  rm -rf include
  rm -rf lib
  rm lib64/lib*
  mv lib64 lib
  rm -rf share/info
  rm -rf share/locale
  rm -rf share/man
  }
