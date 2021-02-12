# Contributor: dkasak <dkasak AT termina.org.uk>
# Contributor: jyantis <yantis@yantis.net>
# Contributor: Sid Karunaratne <sid at karunaratne dot net>
# Contributor: xF0E

pkgname=vowpal_wabbit
pkgver=8.9.1
_rapidjsonver=1.1.0
pkgrel=1
pkgdesc="Vowpal Wabbit is a machine learning system which pushes the frontier of ML with techniques such as online, hashing, allreduce, reductions, learning2search, active, and interactive learning. Includes extra utilities."
arch=(i686 x86_64)
url='https://github.com/JohnLangford/vowpal_wabbit'
license=('custom')
depends=('boost' 'zlib')
makedepends=('cmake' 'gcc' 'python-six')
provides=('vowpal-wabbit' 'vowpal-wabbit-git')
conflicts=('vowpal-wabbit' 'vowpal-wabbit-git')
source=("https://github.com/JohnLangford/vowpal_wabbit/archive/${pkgver}.tar.gz"
        rapidjson-${_rapidjsonver}.tar.gz::"https://github.com/Tencent/rapidjson/archive/v${_rapidjsonver}.tar.gz")
sha256sums=('d005fd90b84dfea3787b05721333abb7a798d6cd1bf999b4467554b68dbe071f'
            'bf7ced29704a1e696fbccf2a2b4ea068e7774fa37f6d7dd4039d0787f8bed98e')

prepare() {
  cd "vowpal_wabbit-${pkgver}" || exit
  rm -rf rapidjson
  mv ../rapidjson-${_rapidjsonver} ./rapidjson
}

build() {
  cd "vowpal_wabbit-${pkgver}" || exit

  cmake . -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTS=OFF -DVW_INSTALL=ON
  make

  sed -i '1 s|python|python2|' utl/vw-csv2bin
}

package() {
  cd vowpal_wabbit-${pkgver} || exit

  # Install Custom License
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  # Install all the utilities
  mkdir -p "$pkgdir/usr/bin/"
  install -D -m755 utl/logistic "$pkgdir/usr/bin/logistic"
  install -D -m755 utl/vw-convergence "$pkgdir/usr/bin/vw-convergence"
  install -D -m755 utl/vw-csv2bin "$pkgdir/usr/bin/vw-csv2bin"
  install -D -m755 utl/vw-hypersearch "$pkgdir/usr/bin/vw-hypersearch"
  install -D -m755 utl/vw-regr "$pkgdir/usr/bin/vw-regr"
  install -D -m755 utl/vw-top-errors "$pkgdir/usr/bin/vw-top-errors"
  install -D -m755 utl/vw-varinfo "$pkgdir/usr/bin/vw-varinfo"
  install -D -m755 utl/vw2csv "$pkgdir/usr/bin/vw2csv"

  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
