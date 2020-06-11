# Maintainer: Henry-Joseph Audéoud <h.audeoud@gmail.com>
# Contributor: getzze <getzze at gmail dot com>

pkgname=jupyter-nbextension-rise
_name=rise
pkgver=5.6.1
pkgrel=2
pkgdesc="Live Reveal.js Jupyter/IPython Slideshow Extension"
arch=(any)
url="https://github.com/damianavila/RISE"
license=('BSD')
conflicts=('python-rise')
depends=('python' 'jupyter-notebook')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('1343f068d01adc4dd0226d9b278ce93fc92f365d827431a57e8d5679eb39f4d6')

package() {
  cd "$srcdir/rise-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1

  install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  # Copy the files in static/, including reveal.js/*
  # this is incorrectly implemented in setup.py, so several files are missing
  local _python3="$(readlink /usr/bin/python3)"
  local _site_packages="$pkgdir/usr/lib/$_python3/site-packages"  
  
  env PYTHONPATH="$_site_packages:$PYTHONPATH" \
      JUPYTER_PATH="$pkgdir/usr/"\
      jupyter-nbextension install rise --py --prefix="$pkgdir/usr/"

  # No need to call `jupyter nbextension install rise`, it is handled in setup.py
  # however, change the path from /usr/etc to /etc
  mv "$pkgdir/"{usr/etc,etc}

}
