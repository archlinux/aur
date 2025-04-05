# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Olaf Bauer <hydro@freenet.de>

pkgname=makemkv-cli
pkgver=1.18.1
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
b2sums=('4c86c6593c2b898e05810875b8cefe5e816e345b8fc89b1e02cd109548d950beaee089acd341c4f5daeff11bdba0eb5d04c4294cc9adef1c0459b88103a1a241'
        '0115b9dda0a513784b8749945f4f3b23212339ba5d4a746db6b9c0c04f9d35866ac4e4827725a92a42d143fa89eada11a2f917360ad93c2488789aed1e707347'
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
