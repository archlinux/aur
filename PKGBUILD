# Maintainer: Eugen Kuksa <eugenk@cs.uni-bremen.de>

pkgname=hets-server
pkgver=0.99_1484075143
pkgrel=1

pkgdesc="A parsing, static analysis and proof management tool incorporating various provers and different specification languages."

url="http://hets.eu"
arch=('i686' 'x86_64')
license=('custom:hets-license')
depends=('hets-commons' 'hets-lib' 'tcl' 'tk' 'ncurses' 'cairo' 'glib2' 'gettext' 'fontconfig' 'libglade')
optdepends=('spass' 'eprover' 'darwin' 'pellet' 'isabelle')
makedepends=('ghc>=7.8.4')
provides=('hets-server')
conflicts=('hets-server-bin')
_commit='b39edff7b191f41fb4b7268e00dd0289965ca9bf'
source=("${pkgname}::git+https://github.com/spechub/Hets.git#commit=${_commit}")
sha256sums=('SKIP')

_executable_name='hets-server'

build() {
  cd $srcdir/$pkgname
  make hets_server.bin
}

package() {
  cd $srcdir/$pkgname
  make install-hets_server PREFIX="$pkgdir/usr"

  # Patch the header of the wrapper script to include the (only working) locale,
  # to use a shell that is certainly installed and to set the correct basedir.
	local wrapper_script="bin/$_executable_name"
  pushd "$pkgdir/usr" > /dev/null
    # Remove useless files that were added by the makefile's sed invocation
    rm -f "share/man/man1/hets.1e"
    rm -f "share/man/man1/hets.1-e"

    echo "#!/bin/bash"                  > "$wrapper_script.tmp"
    echo ""                            >> "$wrapper_script.tmp"
    echo "export LANG=en_US.UTF-8"     >> "$wrapper_script.tmp"
    echo "export LANGUAGE=en_US.UTF-8" >> "$wrapper_script.tmp"
    echo "export LC_ALL=en_US.UTF-8"   >> "$wrapper_script.tmp"
    echo ""                            >> "$wrapper_script.tmp"
    echo "BASEDIR=\"/usr\""            >> "$wrapper_script.tmp"
    echo "PROG=\"$_executable_name\""  >> "$wrapper_script.tmp"

    # replace the script header with the above one
		sed -ie "/\/bin\/ksh93/,/PROG=/ d" "$wrapper_script"
		cat "$wrapper_script" >> "$wrapper_script.tmp"
		cat "$wrapper_script.tmp" > "$wrapper_script"
    rm -f "${wrapper_script}.tmp"
    rm -f "${wrapper_script}e"
    rm -f "${wrapper_script}-e"
  popd > /dev/null
}
