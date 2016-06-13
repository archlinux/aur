# Maintainer: Daniel Nagy <danielnagy at gmx de>

pkgname=obfsproxy-git
pkgver=20160613
pkgrel=5
pkgdesc="Tor project obfuscated proxy"
arch=('any')
url="https://www.torproject.org/projects/obfsproxy-instructions.html.en"
license=('BSD')
depends=('python2-crypto' 'python2-pyptlib' 'python2-twisted'
         'python2-yaml' 'python2-setuptools' 'python2-gmpy2')
conflicts=('pyobfsproxy' 'obfsproxy')
makedepends=('git')
source=("git+https://git.torproject.org/pluggable-transports/obfsproxy.git")
md5sums=("SKIP")
optdepends=('tor: you need tor to use this package' )
#install=$pkgname.install
_gitname=obfsproxy

prepare() {
  cd "$srcdir/$_gitname"

  # argparse is part of python 2.7+, so we can remove it from install_requires
  sed -i "/'argparse',/d" setup.py

  find . -type f \( -name '*.py' -or -executable \) -exec \
    sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
           -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
           \{\} +
}

package() {
  cd "$srcdir/$_gitname"
  python2 setup.py install --root="$pkgdir/" --optimize=1

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

