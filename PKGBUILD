# Package for Cournal, http://cournal-project.org/
# Maintainer: M.Reynolds <blackboxnetworkproject@gmail.com>
# Contributer: Fabian Henze <flyser42@gmx.de>

pkgname=cournal
pkgver=20120726
pkgrel=2
pkgdesc='A collaborative note taking and journal application using a stylus.'
arch=('any')
license=('GPL3')
url='http://cournal-project.org/'
depends=('python>=3.1' 'gtk3>=3.2' 'poppler-glib>=0.18' 'gobject-introspection' 'python-gobject'
	'python-zope-interface>=3.6' 'hicolor-icon-theme' 'desktop-file-utils' 'intltool')
makedepends=('git' 'mercurial')
source=()
sha512sums=()
install=cournal.install

_gitroot='https://github.com/flyser/cournal.git'
_gitname='cournal-git'

build() {
  cd "${srcdir}"
  msg "Connecting to GIT server ..."
  
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
  
  ./download-twisted.sh
}

package () {
	cd "$srcdir/$_gitname-build"
	install -d 755 "${pkgdir}"
	python setup.py install --root="${pkgdir}" --optimize=1
}
