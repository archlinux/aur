# Maintainer: Frederik "Freso" S. Olesen <archlinux@freso.dk>
# Contributor: Caleb Reach <jtxx000@gmail.com>
# Based on aur/morituri PKGBUILD by Mantas Mikulėnas <grawity@gmail.com>
pkgname=morituri-git
pkgver=20130203
pkgrel=1
pkgdesc="a CD ripper aiming for accuracy over speed, modelled after Exact Audio Copy"
arch=(i686 x86_64)
url="https://github.com/thomasvs/morituri"
license=("GPL3")
depends=("cdparanoia" "cdrdao" "gstreamer0.10" "gstreamer0.10-python"
  "python2-musicbrainz2")
optdepends=(
  "python2-pycdio: For drive recognition."
  "gstreamer0.10-base-plugins: Offset detection."
  "cddb-py: FreeDB support."
)
conflicts=("morituri" "morituri-svn")
replaces=("morituri-svn")
changelog=ChangeLog

_gitroot=https://github.com/thomasvs/morituri.git
_gitname=morituri

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin && git submodule update --init
    msg "The local files are updated."
  else
    git clone --recursive "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  cp -R --dereference "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  ./autogen.sh

  export PYTHON="python2"
  ./configure --prefix=/usr --sysconfdir=/etc 
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install || return 1
  install -Dm 0644 "AUTHORS" "$pkgdir/usr/share/doc/morituri/AUTHORS"
  install -Dm 0644 "ChangeLog" "$pkgdir/usr/share/doc/morituri/ChangeLog"
  install -Dm 0644 "HACKING" "$pkgdir/usr/share/doc/morituri/HACKING"
  install -Dm 0644 "NEWS" "$pkgdir/usr/share/doc/morituri/NEWS"
  install -Dm 0644 "README" "$pkgdir/usr/share/doc/morituri/README"
  install -Dm 0644 "RELEASE" "$pkgdir/usr/share/doc/morituri/RELEASE"
  install -Dm 0644 "TODO" "$pkgdir/usr/share/doc/morituri/TODO"
}

# vim:set ts=2 sw=2 et:
