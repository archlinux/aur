# Maintainer:Ben Booth <benwbooth@gmail.com>
pkgname=kiofuse-svn
pkgver=1360808
pkgrel=2
pkgdesc="KioFuse allows you to mount remote directories into the root hierarchy of your local file system, thereby exposing KDE's advanced access capabilities (SSH, SAMBA/Windows, FTP, TAR/GZip/BZip2, WebDav, etc) to POSIX-compliant applications."
arch=('i686' 'x86_64')
url="http://techbase.kde.org/Projects/KioFuse"
license=('LGPL')
groups=()
depends=('kdelibs>=4')
makedepends=('subversion' 'cmake')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('add-missing-includes.patch')
noextract=()
md5sums=('fb3e710a62f34f79fa1166d3e25a5eef')

_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/playground/libs/kiofuse
_svnmod=kiofuse

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
  svn export "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  patch -p0 -i ../add-missing-includes.patch

  cmake .
  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  install -Dm755 kiofuse "$pkgdir/usr/bin/kiofuse"
}

# vim:set ts=2 sw=2 et:
