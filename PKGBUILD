# This PKGBUILD is for the latest stable version fo sx.
# We use git to get the source code but then checkout to the
# latest version tag. This is because no direct downloads (e.g.
# tarballs) are provided.

# Maintainer: George Angelopoulos <george@usermod.net>
pkgname=sx
pkgver="2.17"
pkgrel=1
pkgdesc="A tool used to extract various report types and then analyze those extracted reports with plugins."
arch=('any')
url="https://fedorahosted.org/sx/"
license=('GPL')
depends=('python2')
makedepends=('git')

_gitroot="git://git.fedorahosted.org/git/sx.git"
_gitname="sx"
_gitvertag="sx-${pkgver}"

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
  git checkout "$_gitvertag"
}

package() {
  cd "$srcdir/$_gitname-build"
  python2 setup.py install --optimize 1 --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
