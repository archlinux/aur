# Maintainer: Alexander Kobel <a-kobel@a-kobel.de>

pkgname=phcpack
pkgver=2.4.85
pkgrel=1
pkgdesc="software package to solve polynomial systems by homotopy continuation methods"
url="http://homepages.math.uic.edu/~jan/PHCpack/phcpack.html"
arch=('x86_64')
license=('GPL3')
depends=('gcc-libs' 'glibc' 'qd')
makedepends=('gcc-ada' 'qd')
source=("https://github.com/janverschelde/PHCpack/archive/v${pkgver}.tar.gz")
sha256sums=('e5893bdf959ef8136ebe3d9219d43485b3b358e23cc028240b5185aa5f85b211')

prepare () {
  cd ${srcdir}/PHCpack-${pkgver}/src
  sed -i -e 's/^DEMiCs_CFLAGS = /DEMiCs_CFLAGS = -std=c++11 -fPIC /' Objects/makefile_unix
  find . -type f -name 'makefile*' -exec sed -i \
  	-e 's@$(QD_LIB)/libqd.a@-lqd@' \
  	-e 's@/usr/local/lib/libqd.a@-lqd@' \
	-e 's@$(QD_ROOT)/src/libqd.a@-lqd@' \
	-e 's@\([ \t]\)$(gpp)@\1$(gpp) -std=c++11 -fPIC -fcommon@' \
	-e 's@$(ADALIB)/libgnat_pic.a@-lgnat@' \
	-e 's@$(ADALIB)/libgnarl_pic.a@-lgnarl@' \
	{} \;
  	# -e 's@ -static@@' \
}

build () {
  cd ${srcdir}/PHCpack-${pkgver}/src/Objects

  # standalone
  make phc ADALIB="/usr/lib/gcc/x86_64-pc-linux-gnu/$(gcc -dumpfullversion)/adalib"

  # # PHCpy2
  # make phcpy2c2.so PYTHON=$(pkg-config --cflags python2 | sed -e 's/^-I//')

  # PHCpy3
  # make phcpy2c3.so PYTHON3=$(pkg-config --cflags python3 | sed -e 's/^-I//') \
  #      ADALIB="/usr/lib/gcc/x86_64-pc-linux-gnu/$(gcc -dumpfullversion)/adalib"

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
    cd doc/build/texinfo
    make install-info infodir="${pkgdir}/usr/share/info"
  fi
}
