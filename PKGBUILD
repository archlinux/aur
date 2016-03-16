# Maintainer: Alexander Kobel <a-kobel@a-kobel.de>

pkgname=phcpack
pkgver=2.4.12
pkgrel=1
pkgdesc="software package to solve polynomial systems by homotopy continuation methods"
url="http://homepages.math.uic.edu/~jan/PHCpack/phcpack.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('glibc')
makedepends=('gcc-ada' 'qd')
source=("https://github.com/janverschelde/PHCpack/archive/v${pkgver}.tar.gz")
sha256sums=('7abf5916fc259a829a1c71f123fceaae001ae9d32fe000a69c843288662458fa')

build () {
  cd ${srcdir}/PHCpack-${pkgver}/src/Objects

  # standalone
  make phc

  # # PHCpy2
  # make phcpy2c2.so PYTHON=$(pkg-config --cflags python2 | sed -e 's/^-I//')

  # # PHCpy3
  # make phcpy2c3.so PYTHON3=$(pkg-config --cflags python3 | sed -e 's/^-I//')

  cd ..

  # doc (requires python-sphinx)
  if sphinx-build --version &> /dev/null; then
    cd doc
    make man
    gzip -9 -c build/man/phcpack.1 > build/man/phcpack.1.gz
    make info
    gzip -9 -c build/texinfo/PHCpack.info > build/texinfo/PHCpack.info.gz
    # make html
    # if pdflatex --version &> /dev/null; then
    #   make latexpdf
    # fi
    cd ..
  fi
}

package() {
  cd ${srcdir}/PHCpack-${pkgver}/src
  install -D -m755 bin/phc -t "${pkgdir}/usr/bin"
  if [ -e doc/build/man/phcpack.1.gz ]; then
    install -D -m644 doc/build/man/phcpack.1.gz -t "${pkgdir}/usr/share/man/man1"
  fi
  if [ -e doc/build/texinfo/PHCpack.info.gz ]; then
    install -D -m644 doc/build/texinfo/PHCpack.info.gz -t "${pkgdir}/usr/share/info/"
    install -D -m644 doc/build/texinfo/honeyface.png -t "${pkgdir}/usr/share/info/"
    install-info "${pkgdir}/usr/share/info/PHCpack.info.gz" "${pkgdir}/usr/share/info/dir"
  fi
}
