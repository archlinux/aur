# Maintainer: Aaron DeVore <aaron.devore@gmail.com>
# Contributor: Marco Elver <el.marcoe+arch at gmail dot com>

pkgname=python-nevow
pkgver=0.10.0
pkgrel=3
arch=(any)
license=('custom')
pkgdesc="Web application construction kit and templating engine written in python."
url="http://divmod.org/trac/wiki/DivmodNevow"
depends=('python2')
optdepends=('twisted: to use all the advanced features of nevow, such as LivePage')
makedepends=('twisted' 'python2-distribute')
source=("http://pypi.python.org/packages/source/N/Nevow/Nevow-${pkgver}.tar.gz")
md5sums=('66dda2ad88f42dea05911add15f4d1b2')
options=(!emptydirs)
changelog=Changelog

build() {
  cd $srcdir/Nevow-$pkgver
  python2 setup.py install --root=$pkgdir --optimize=1

  # is there a way to fix the doc path with the setup.py script ?
  mkdir -p $pkgdir/usr/share/doc/nevow
  mv $pkgdir/usr/doc/man $pkgdir/usr/share/
  mv $pkgdir/usr/doc/* $pkgdir/usr/share/doc/nevow/
  rm -r $pkgdir/usr/doc
  
  # Same as above - in v0.9.33 nevow_widget.py was in the right
  # place. Can anybody explain why this has changed? Let's hope this
  # gets fixed in their next setup.py.
  _python_version=`python2 -c "import sys; print sys.version[:3]"`
  _python_twisted_plugins="$pkgdir/usr/lib/python${_python_version}/site-packages/twisted/plugins/"
  mkdir -p $_python_twisted_plugins
  mv $pkgdir/usr/twisted/plugins/nevow_widget.py $_python_twisted_plugins
  rm -r $pkgdir/usr/twisted

  # Distribute doesn't kill off #!/usr/bin/python shebangs
  find $pkgdir -name "*.py" -exec \
    sed -i '1s/python[[:space:]]*$/python2/' {} \;

  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

