# Submitter: Peter Richard Lewis <plewis@aur.archlinux.org>
# Maintainer: Will Price <willprice94@gmail.com>
# Contributor: Aaron Sloman <a.sloman@cs.bham.ac.uk>

pkgname=poplog
pkgver=15.65
pkgrel=4
pkgdesc="poplog development system"
arch=('i686' 'x86_64')
url="http://www.cs.bham.ac.uk/research/projects/poplog/freepoplog.html"
license=('custom:poplog')

depends=('tcsh')
if test "$CARCH" == x86_64; then
  depends+=('lib32-libxext' 'lib32-libxt' 'lib32-openmotif' 'lib32-libxp')
elif test "$CARCH" == i686; then
  depends+=('libxext' 'libxt' 'openmotif' 'libxp')
fi
optdepends=('espeak: for run-speaking-eliza demo')


source=(
  "http://www.cs.bham.ac.uk/research/projects/poplog/v$pkgver/AREADME.txt"
  "http://www.cs.bham.ac.uk/research/poplog/bham-linux-poplog-v$pkgver.tar.gz"
  "http://www.cs.bham.ac.uk/research/projects/poplog/copyright.html"
)
sha256sums=('f8713a74b36dfc9547848db43b332822d3b5a6887b671ab59e19a17add6e071a'
            '15a2ac11ec4b9a7c3d137b1d097e83b35c47aff7d7aec46e0b4499246f76d49b'
            '87c8728fcad9a4a24d70ba41e1628d44bd89b36bbe0eed75e49eb7b2b52b69a9')
install=poplog.install

# PKGBUILDS aren't meant to have custom variables, if so they should be prefixed
# by an underscore...
usepop=$pkgdir/usr/share/poplog/current-poplog

build() {
  # create poplog directories and set permissions
  mkdir -p $pkgdir/usr/share/poplog/{local/lockfile/locks,v$pkgver/poplocalbin}
  chmod -R 755 $pkgdir/usr/share/poplog
  # copy over source files
  cp -r $srcdir/v$pkgver $pkgdir/usr/share/poplog/
  # symlink current-poplog dir to package version
  cd $pkgdir/usr/share/poplog
  ln -s v$pkgver current-poplog

  # create poplog.sh executables
  cd current-poplog/INSTALL
  cat poplog1.sh > ../bin/poplog.sh
  echo "poplogroot=/usr/share/poplog/" >> ../bin/poplog.sh
  echo "export poplogroot" >> ../bin/poplog.sh
  cat poplog2.sh >> ../bin/poplog.sh
  chmod 755 ../bin/poplog.sh

  # set variables for poplog to be built
  source ../pop/com/popenv.sh
  PATH=$popsys\:$PATH\:$popcom
  export PATH

  # building saved images with motif
  cp -p $usepop/pop/com/mkstartup.bham $usepop/pop/com/mkstartup
  cd $popsys
  ./poplink_cmnd.motif.sh motif
  
  # rebuild basepop11 etc
  cd $usepop/INSTALL 
  ./LINK_USING_NEWPOP motif

}

package() {
  mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share/man/man1"
  ln -s "$pkgdir/usr/share/poplog/current-poplog/bin/poplog.sh" "$pkgdir/usr/bin/poplog"
  ln -s "$pkgdir/usr/share/poplog/current-poplog/man/man1/*" "$pkgdir/usr/share/man/man1"

  # Licence
  install -Dm644 "$srcdir/copyright.html" "$pkgdir/usr/share/licenses/poplog/poplog.html"
}

# vim:set ts=2 sw=2 et:
