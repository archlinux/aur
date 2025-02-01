# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Olaf Bauer <hydro@freenet.de>

pkgname=makemkv-cli
pkgver=1.17.9
pkgrel=1
pkgdesc='DVD and Blu-ray to MKV converter and network streamer - CLI only'
arch=('i686' 'x86_64')
url='https://www.makemkv.com'
license=('LGPL' 'MPL' 'custom')
depends=(
  'ffmpeg'
  'java-runtime'
  'openssl-1.1'
)
makedepends=(
  'less'
)
provides=('makemkv')
conflicts=('makemkv')
install=makemkv.install
source=(
  "${url}/download/makemkv-bin-${pkgver}.tar.gz"
  "${url}/download/makemkv-oss-${pkgver}.tar.gz"
  makemkvcon.1
)
b2sums=('26b9c8957bbed9a0772935c2470fea1111836c8fe8f0bceda3a2466f24fbdb004c88c64c4a340ca1a4c9ff355ea2be49445b33de743244df547c916cd53fb676'
        '552c3c4251920d814833591b30099d87b3c6f6fae0462bafb85d563621af04b2be5299ce473456974363eb2b6128b54b49fa7724aa8faa06dad3b344e363cf9a'
        'a318361982271bee3db2fa6f3e2b51afd7fe35f3dcb821c24bc21f8189be74cf9093559dbf9689eedd458226b30ddf59333af10ef509dc850331639b9035be39')

build() {
  cd makemkv-oss-${pkgver}
  CFLAGS="$CFLAGS -std=c++11" CC=gcc CXX=g++ ./configure --prefix=/usr --disable-gui
  make
}

package() {
  cd makemkv-oss-${pkgver}
  make DESTDIR="${pkgdir}" install

  cd "${srcdir}"/makemkv-bin-${pkgver}
  make DESTDIR="${pkgdir}" install

  install -Dm644 src/eula_en_linux.txt "${pkgdir}"/usr/share/licenses/${pkgname}/eula_en_linux.txt

  cd "${srcdir}"
  install -Dm644 -t "${pkgdir}"/usr/share/man/man1/ makemkvcon.1
}
