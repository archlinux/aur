# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Olaf Bauer <hydro@freenet.de>

pkgname=makemkv-cli
pkgver=1.17.4
pkgrel=1
pkgdesc='DVD and Blu-ray to MKV converter and network streamer - CLI only'
arch=('i686' 'x86_64')
url='https://www.makemkv.com'
license=('LGPL' 'MPL' 'custom')
depends=('ffmpeg' 'java-runtime' 'openssl-1.1')
optdepends_x86_64=('lib32-glibc: dts support')
provides=('makemkv')
conflicts=('makemkv')
install=makemkv.install
source=("${url}/download/makemkv-bin-${pkgver}.tar.gz"
        "${url}/download/makemkv-oss-${pkgver}.tar.gz"
        makemkv-fix-build-with-ffmpeg6.patch
        makemkvcon.1
        mmdtsdec.1)
b2sums=('9be9fe1c2af35af7f5632857bccae45d9e6ba522fb8753eb40903a61ff73bc1ff40f2fade6d099059c5d7f716c0903ff16c3ff0849ff21728cc7eb8eafd19a95'
        'c64e209fc20e432c4befe794133fb06761f4fd2fb6eceb8ce4ce7292582768d10937850027aad0a02f31f920c647841427797b43ba6f1016ff0e5920ac466682'
        '32c1150bca0ffeea5e22585fa8cd9beaa1831d4d6e2bd4049822d1ced973c0e9ce00a7dc57bd22540028d0f8f81cc897a390979097a79460e59ca009f1071ebd'
        'a318361982271bee3db2fa6f3e2b51afd7fe35f3dcb821c24bc21f8189be74cf9093559dbf9689eedd458226b30ddf59333af10ef509dc850331639b9035be39'
        '2402c0338cf3a5e28c46af98a72c76e8e22d54e812f1d1f0dc156590657af15a6264a05a5fbcbf288fea09b5f4eb6fd1bb3e8672e9afc1615170b7bd83ba69b1')

prepare() {
  cd makemkv-oss-${pkgver}
  patch -Np1 -i ../makemkv-fix-build-with-ffmpeg6.patch
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
  install -Dm644 -t "${pkgdir}"/usr/share/man/man1/ makemkvcon.1 mmdtsdec.1
}
