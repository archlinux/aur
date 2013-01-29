# Maintainer: Caleb Reach <jtxx000@gmail.com>
# Based on aur/morituri PKGBUILD by Mantas Mikulėnas <grawity@gmail.com>
pkgname=morituri-git
pkgver=20130125
pkgrel=1
pkgdesc="a CD ripper aiming for accuracy over speed, modelled after Exact Audio Copy"
arch=(i686 x86_64)
url="https://github.com/thomasvs/morituri"
license=("GPL3")
depends=("cdparanoia" "cdrdao" "gstreamer0.10" "gstreamer0.10-python"
  "python2-musicbrainz2" "python2-pycdio")
conflicts=("morituri" "morituri-svn")

_gitroot=https://github.com/thomasvs/morituri.git
_gitname=morituri

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

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
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install || return 1
  install -Dm 0644 "README" "$pkgdir/usr/share/doc/morituri/README"
}

# vim:set ts=2 sw=2 et:
