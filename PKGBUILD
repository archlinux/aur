# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Olaf Bauer <hydro@freenet.de>

pkgname=makemkv-cli
pkgver=1.14.6
pkgrel=1
pkgdesc='DVD and Blu-ray to MKV converter and network streamer - CLI only'
arch=('i686' 'x86_64')
url='http://www.makemkv.com'
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
sha512sums=('b9bf62d6de371733f50e75c9d1d83d5fdbe871fc3308ef489c33105878ccbb67be1d542467e54c164901c330e25be8db9d154b0be18d501c05836e9fe1a03d47'
            '88fe5be932a1e5fc368814f081e72881f0934969fc2c77d61dd8fbc23b2449467519577fcd8282ed9b17b7dfc0948e567928da52ecbf63be3d84f8bfb285c8b0'
            'cbed2ae086634883e307760948c969a7b18dc212d33b4c04012210a06dce907b33377bef6864b6a8096c6fc12da78d63ac125147d440512b3f16a790b29de4c6'
            '1c1ea3deefebc440f40c7cc710ac2123e20df8d6921846250ca50c39125afa0ef0bf6b3ecbcb71dd29e0b49772d7f77aa5af789bfd22746c92e44d15473637c2')

build() {
  cd makemkv-oss-${pkgver}
  ./configure --prefix=/usr --disable-gui
  make
}

package() {
  cd makemkv-oss-${pkgver}
  make DESTDIR="${pkgdir}" install

  cd "${srcdir}"/makemkv-bin-${pkgver}
  make DESTDIR="${pkgdir}" install

  install -Dm644 src/eula_en_linux.txt "${pkgdir}"/usr/share/licenses/${pkgname}/eula_en_linux.txt

  cd "${srcdir}"
  install -d "${pkgdir}"/usr/share/man/man1/
  install -m644 -t "${pkgdir}"/usr/share/man/man1/ makemkvcon.1 mmdtsdec.1
}
