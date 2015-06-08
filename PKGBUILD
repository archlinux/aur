# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Evgeniy Alekseev <arcanis.arch at gmail dot com>

pkgname=sage-notebook-git
pkgver=0.11.2.r4.gc5b3a94
pkgrel=1
pkgdesc='Web-based notebook interface for Sage'
arch=('any')
url='http://www.sagemath.org'
license=('GPL3')
depends=('sage-mathematics-git' 'python2-twisted' 'python2-flask-oldsessions' 'python2-flask-openid' 'python2-flask-autoindex' 
'python2-flask-babel' 'python2-flask-silk' 'python2-webassets')
optdepends=('python2-pyopenssl: to use the notebook in secure mode')
makedepends=('gendesk')
conflicts=('sage-notebook')
provides=('sage-notebook')
source=("git://github.com/sagemath/sagenb" 'sage.service' 'jmol.patch')
install=$pkgname.install
md5sums=('SKIP'
         '61620179a7ecd85401d8e5a6ece3ea41'
         'b29760c97a5328faa179a46008391bf0')

pkgver() {
  cd sagenb
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
# create *.desktop file
  gendesk -f -n \
          --pkgname="sage-notebook" \
          --pkgdesc="Sage notebook" \
          --name="Sage" \
          --exec="/usr/bin/sage -notebook" \
          --terminal=true \
          --categories="Education;Science;Math" \
          --custom="X-DCOP-ServiceType=
X-KDE-SubstituteUID=false
X-KDE-Username="

  cd sagenb
  
# Use python2
  find -name '*.py' | xargs sed -e 's|#! /usr/bin/python|#! /usr/bin/python2|' -e 's|#!/usr/bin/python|#!/usr/bin/python2|' \
    -e 's|#!/usr/bin/env python|#!/usr/bin/env python2|' -i
  sed -e 's|python %s|python2 %s|' -i sagenb/notebook/run_notebook.py
  sed -e "s|python = 'python'|python = 'python2'|" -i sagenb/interfaces/expect.py 

# Fix displaying 3D plots
  patch -p0 -i "$srcdir"/jmol.patch
}

build() {
  cd sagenb

  python2 setup.py build
}

package() {
  cd sagenb

  python2 setup.py install --root "$pkgdir" --optimize=1

  install -D -m644 COPYING "$pkgdir"/usr/share/licenses/${pkgname}/COPYING

# install a systemd user unit
  install -Dm644 "${srcdir}/sage.service" "$pkgdir/usr/lib/systemd/user/sage.service"
# install *.desktop and icon files
  install -Dm644 "${srcdir}/sage-notebook.desktop" "$pkgdir/usr/share/applications/sage-notebook.desktop"
  install -Dm644 "$pkgdir/usr/lib/python2.7/site-packages/sagenb/data/sage/images/icon48x48.png" \
                 "$pkgdir/usr/share/pixmaps/sage-notebook.png"
}
