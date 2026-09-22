# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Olaf Bauer <hydro@freenet.de>

pkgname=makemkv-cli
pkgver=2.0.0
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
  ffmpeg9.patch
)
b2sums=('7b5c912fec368e8f575c623d87ea1558e9bdf739375e39d4ef17b60fc637a3735ba21151a70ce0a4daf6e2f664f2dd39f9dc7f755da96ee129f52f41ec2b68c3'
        'b5c3c76168557641c4dfa849c4d564d401957e80edea93658a957df2b5b87d978d6ef93244d7bc5e5eb605c0b0bcd8aa8fc74b82155ed2eefcbe8a94ae26ebdb'
        'a318361982271bee3db2fa6f3e2b51afd7fe35f3dcb821c24bc21f8189be74cf9093559dbf9689eedd458226b30ddf59333af10ef509dc850331639b9035be39'
        'd35f702b1a46ca8093aabc29a45bad994c43312ddacc32337d4c86cf99f1b686c4e3fc50a70dcae2eda63cbb639a33537442b3bc65906ea9adf0f612c58d364e')

prepare() {
  cd makemkv-oss-${pkgver}
  patch -Np1 < ../ffmpeg9.patch
}

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
