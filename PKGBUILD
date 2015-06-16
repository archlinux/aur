# Maintainer: Cravix < dr dot neemous at gmail dot com >
# base on renpy and python-renpy PKGBUILD written by AlexanderR <rvacheva at nxt dot ru>
pkgname=renpy-git
_pkgname=renpy
pkgver=4480.94ba4e6
pkgrel=1
pkgdesc="Visual novel engine Ren'Py along with its platdeps libs (dev channel)"
arch=('i686' 'x86_64')
license=('MIT')
url='http://www.renpy.org'
depends=('ttf-dejavu' 'ffmpeg' 'fribidi' 'glew' 'python2-pygame-sdl2-git')
makedepends=('cython2' 'python2-sphinx')
provides=('renpy' 'python-renpy')
conflicts=('renpy-bin' 'renpy64' 'python-renpy' 'renpy' 'renpy-allinone')
replaces=('renpy64')
install=renpy.install

source=("git://github.com/renpy/renpy.git"
        "${_pkgname}.desktop"
        'renpy-launcher.sh')
md5sums=('SKIP'
         'a9beb35fa6c6d8af7ba5d2a764c33158'
         'dfa92cdecc15e5c1ddee387fbbbb2d9c')

pkgver() {
  cd "$srcdir/$_pkgname"
  
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_pkgname"
  #python2 fix
	find . -name "*.py" -exec sed -i 's/env python$/env python2/' {} \;

  RENPY_CYTHON=/usr/bin/cython2 python2 module/setup.py build

  # build docs
  cd sphinx
  python2 ../renpy.py .
  sphinx-build2 -a source ../doc
}

package(){
	#pack datas
  mkdir -p "$pkgdir/"{usr/share/{$_pkgname,doc/$_pkgname},etc/profile.d}

  cd "$srcdir"
  install -D -m755 $_pkgname-launcher.sh "$pkgdir/usr/bin/$_pkgname"
  install -D -m644 ${_pkgname}.desktop "$pkgdir/usr/share/applications/${_pkgname}.desktop"

  cd $srcdir/$_pkgname
  cp -r launcher renpy renpy.py  templates the_question tutorial "$pkgdir/usr/share/$_pkgname"
  cp -r doc/* "$pkgdir/usr/share/doc/$_pkgname"
  install -D -m644 launcher/game/images/logo.png "$pkgdir/usr/share/pixmaps/${_pkgname}.png"
  install -D -m644 sphinx/source/license.rst "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

  chgrp -R games "$pkgdir"/usr/share/renpy/{the_question,tutorial}
  chmod g+w "$pkgdir"/usr/share/renpy/{the_question,tutorial}
  
  #pack modules
	cd "$srcdir/$_pkgname"
  RENPY_CYTHON=/usr/bin/cython2 python2 module/setup.py install --root="$pkgdir/" --prefix=/usr
}
