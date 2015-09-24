# Contributor: Jed Brown <jed@59A2.org>

pkgname=cedet-git
_gitname=cedet
pkgver=20150322
pkgrel=1
pkgdesc="Collection of Emacs Development Enviromnent Tools (Git version)"
arch=('any')
url="http://cedet.sourceforge.net/"
license=('GPL')
conflicts=(cedet cedet-cvs cedet-bzr)
replaces=(cedet-cvs cedet-bzr)
provides=('cedet')
depends=('emacs')
makedepends=('git')
install=$pkgname.install

pkgver() { # This won't work until they make a tag in the repository
  cd "${gitname}"
  git describe --tags | sed 's/^v//;s/-/./g;s/_/./g;'
}

build() {
  cd "${srcdir}"

  if [ -d ${_gitname}/.git ]; then
    msg "Pulling from Git server...."
    cd ${_gitname} && git pull
  else
    msg "Cloning from Git server...."
    git clone --depth 1 --single-branch http://git.code.sf.net/p/cedet/git ${_gitname}
    cd ${_gitname}
  fi
  msg "Starting build ..."

  git clean -fx

  unset MAKEFLAGS
  make
}

package() {
  cd "$srcdir/${_gitname}"
  install -d $pkgdir/usr/share/emacs/site-lisp/cedet
  install cedet-devel-load.el cedet-remove-builtin.el $pkgdir/usr/share/emacs/site-lisp/cedet
  cp -a lisp contrib $pkgdir/usr/share/emacs/site-lisp/cedet

  # http://sourceforge.net/tracker/index.php?func=detail&aid=3585232&group_id=17886&atid=117886
  touch $pkgdir/usr/share/emacs/site-lisp/cedet/.nosearch

  # make INFODIR=$pkgdir/usr/share/info install-info
}
