# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=streamlink
pkgver=0.4.0
pkgrel=1
pkgdesc='CLI program that launches streams from various streaming services in a custom video player (livestreamer fork)'
arch=('any')
url='https://streamlink.github.io/'
license=('BSD')
depends=("python-"{iso3166,iso639,pycryptodome,requests} 'rtmpdump')
checkdepends=("python-"{mock,pycountry,pytest})
makedepends=("python-"{setuptools,sphinx})
optdepends=('ffmpeg: Required to play streams that are made up of separate audio and video streams, eg. YouTube 1080p+'
            'python-librtmp: Required by the ustreamtv plugin to be able to use non-mobile streams.')
source=("https://github.com/${pkgname}/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz"{,.asc})
# Charlie Drage <charlie@charliedrage.com>
validpgpkeys=('1D2DA4B582D3E09EFA2C997CDA227403C037D617')
sha512sums=('9a461e69f17b5d88e7adfdddcd0c19615c10e208c103df85028bfec26ab64bccd64a697d0509f6e581e467739b660b4abd38a0c6b747f038c94af256ac043a6d'
            'SKIP')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build_sphinx -b man
}

check() {
  cd "$pkgname-$pkgver"
  python setup.py test || warning "Tests failed"
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 build/sphinx/man/streamlink.1 \
    "$pkgdir/usr/share/man/man1/streamlink.1"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
