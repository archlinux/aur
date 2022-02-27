# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Olaf Bauer <hydro@freenet.de>

pkgname=makemkv-cli
pkgver=1.16.7
pkgrel=1
pkgdesc='DVD and Blu-ray to MKV converter and network streamer - CLI only'
arch=('i686' 'x86_64')
url='https://www.makemkv.com'
license=('LGPL' 'MPL' 'custom')
depends=('ffmpeg' 'java-runtime')
optdepends_x86_64=('lib32-glibc: dts support')
provides=('makemkv')
conflicts=('makemkv')
install=makemkv.install
source=("${url}/download/makemkv-bin-${pkgver}.tar.gz"
        "${url}/download/makemkv-oss-${pkgver}.tar.gz"
        makemkvcon.1
        mmdtsdec.1)
b2sums=('6535cbeb65d0166c5093920f2064065f4d7a3ea0232878dfeda76f5ea53dad68e2da10894dcbeaab706c93b733f32e9c316a07a9365f43943a1f0710a48af83f'
        '28273db7300532b1ce2ab63629aa5ceb90059e4e02ea22e6f2764e727946fe6e6dbc45e16c743bf239e3bdfe015e447e662d0c5e838ada8564d0e251721a6bcc'
        'a318361982271bee3db2fa6f3e2b51afd7fe35f3dcb821c24bc21f8189be74cf9093559dbf9689eedd458226b30ddf59333af10ef509dc850331639b9035be39'
        '2402c0338cf3a5e28c46af98a72c76e8e22d54e812f1d1f0dc156590657af15a6264a05a5fbcbf288fea09b5f4eb6fd1bb3e8672e9afc1615170b7bd83ba69b1')

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
