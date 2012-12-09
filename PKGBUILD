# Maintainer: Caleb Reach <jtxx000@gmail.com>
# Based on aur/morituri PKGBUILD by Mantas Mikulėnas <grawity@gmail.com>
pkgname=morituri-svn
pkgver=545
pkgrel=2
pkgdesc="a CD ripper aiming for accuracy over speed, modelled after Exact Audio Copy"
arch=(i686 x86_64)
url="https://thomas.apestaart.org/morituri/trac/"
license=("GPL3")
depends=("cdparanoia" "cdrdao" "gstreamer0.10" "gstreamer0.10-python"
	"python2-musicbrainz2" "python2-pycdio")
conflicts=("morituri")

_svntrunk=http://thomas.apestaart.org/morituri/svn/trunk/
_svnmod=morituri

build() {
  cd "$srcdir"
  msg "Connecting to SVN server...."

  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  #
  # BUILD HERE
  #
  sed -i '27s/\<python\>/&2/' doc/Makefile.am
  ./autogen.sh

  sed -i '1s/\<python\>/&2/' bin/rip.in etc/bash_completion.d/bash-compgen

  export PYTHON="python2"
  ./configure --prefix=/usr --sysconfdir=/etc 
  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir" install || return 1
  install -Dm 0644 "README" "$pkgdir/usr/share/doc/morituri/README"
}

# vim:set ts=2 sw=2 et:
