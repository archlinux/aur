# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Olaf Bauer <hydro@freenet.de>

pkgname=makemkv-cli
pkgver=1.17.8
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
b2sums=('0ddbcd50a44a98c118420485c7c8e48a1c03290ac840b22ab8119d5cd6db0743e746ca9cbdd7fd714f49a2a37420645c820477c5c7d7b189763b5a46de342e9d'
        '76ffcf0a67c2ee6b05820006ff7926accef7939374b328d709dbbf6c746f010e273f89748a2a3386679b83f2af0b4f3e41f31e8acaf29cdbaeffccaf25b57500'
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
