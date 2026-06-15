# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Olaf Bauer <hydro@freenet.de>

pkgname=makemkv-cli
pkgver=1.18.4
pkgrel=1
pkgdesc='DVD and Blu-ray to MKV converter and network streamer - CLI only'
arch=('i686' 'x86_64')
url='https://www.makemkv.com'
license=('LGPL' 'MPL' 'custom')
depends=(
  ffmpeg
  java-runtime
  openssl
  zlib
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
b2sums=('d55f34498a8f78d27a6234d4ce4861c9e3fb0add4eb839b1ff74d9d1649eea6837a989c7d2d6f95d0a975f7b704d2e1c5487a38ccdad20a6782a6cc8e51896c6'
        'b98740644f486e79703ab08bacee8a495d1f7b4f5b15ed3d178f32564683e4fdf8787e620f7bf110a697f2b73b7f37ff95b9301742f039957865076540c06dbe'
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
