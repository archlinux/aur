# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Olaf Bauer <hydro@freenet.de>

pkgname=makemkv-cli
pkgver=1.17.3
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
        makemkvcon.1
        mmdtsdec.1)
b2sums=('adc7bb6e093247d782c57de2f304b5715c0e21d0572927551fc3830fc15776c09d9593dee18d464f4d19e40a1e260facf750a494493048971b5f4cb1b40a372f'
        '640948c378cd0c329b3278ec91efaa3632287edb8a8dc9b9b9dde619e8360d8e53e5af2f2c24e2091b69ea2d842afcd2043a2eef98cfff9c98e418bd418ee5b2'
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
