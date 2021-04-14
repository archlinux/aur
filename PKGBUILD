# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Evgeniy Alekseev <arcanis.arch at gmail dot com>

pkgname=sage-notebook
pkgver=1.1.3
pkgrel=3
pkgdesc='Browser-based notebook interface for SageMath'
arch=(any)
url='http://www.sagemath.org'
license=(GPL3)
depends=(sagemath python-twisted python-flask-oldsessions python-flask-openid python-flask-autoindex python-flask-babel mathjax2 jsmol)
optdepends=('python-pyopenssl: to use the notebook in secure mode')
makedepends=(gendesk python-sphinx)
source=($pkgname-$pkgver.tar.gz::"https://github.com/sagemath/sagenb/archive/$pkgver.tar.gz" sage.service)
sha256sums=('d00ec4fba5ee16cb0027a186902f41077169f0467d8cb2ae52108a01fe15b55a'
            '2cf8668fa77a96fe562dafd50cab41aad03f53ee8b91587b1b45ecd193c1517a')

prepare() {
# create *.desktop file
  gendesk -f -n \
          --pkgname="sage-notebook" \
          --pkgdesc="SageMath notebook" \
          --name="SageMath" \
          --exec="/usr/bin/sage -notebook=sagenb" \
          --terminal=true \
          --categories="Education;Science;Math"

  cd $srcdir/sagenb-$pkgver
}

build() {
  cd $srcdir/sagenb-$pkgver
  python setup.py build
  
  cd doc
  make html
}

package() {
  cd $srcdir/sagenb-$pkgver

  python setup.py install --root "$pkgdir" --optimize=1

  install -D -m644 COPYING "$pkgdir"/usr/share/licenses/${pkgname}/COPYING

  ln -s /usr/share/mathjax2 "$pkgdir"/usr/lib/python3.9/site-packages/sagenb/data/mathjax

# install a systemd user unit
  install -Dm644 "${srcdir}/sage.service" "$pkgdir/usr/lib/systemd/user/sage.service"
# install *.desktop and icon files
  install -Dm644 "${srcdir}/sage-notebook.desktop" "$pkgdir/usr/share/applications/sage-notebook.desktop"
  install -Dm644 "$pkgdir/usr/lib/python3.9/site-packages/sagenb/data/sage/images/icon48x48.png" \
                 "$pkgdir/usr/share/pixmaps/sage-notebook.png"
# remove sage3d
  rm -r "$pkgdir"/usr/bin

# install docs
  mkdir -p "$pkgdir"/usr/share/doc/sagenb
  cp -r doc/build/html "$pkgdir"/usr/share/doc/sagenb
}
