# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Olaf Bauer <hydro@freenet.de>

pkgname=makemkv-cli
pkgver=1.14.1
pkgrel=1
pkgdesc='DVD and Blu-ray to MKV converter and network streamer - CLI only'
arch=('i686' 'x86_64')
url='http://www.makemkv.com'
license=('LGPL' 'MPL' 'custom')
depends=('ffmpeg')
optdepends_x86_64=('lib32-glibc: dts support')
provides=('makemkv')
conflicts=('makemkv')
install=makemkv.install
source=(${url}/download/makemkv-bin-${pkgver}.tar.gz
        ${url}/download/makemkv-oss-${pkgver}.tar.gz
        makemkvcon.1
        mmdtsdec.1)
sha512sums=('a3e2f1a41cc430d37d7252e15e5cf04a5c754e1ecb9b4d9e7fd3a3bb6b721d2b4d1d86d55e068d44df0e40912e6bf7a0ebf527b11d2cba07604fc29f5b69943f'
            '4d0bf778d2efd417d058b6db339dc47363b3e179734ec51fc5ebd1fe35d4040aac06ca6387a77362dca8598e8eb5d4db6be16aeea00dc7a3655bf36be26998e5'
            'cbed2ae086634883e307760948c969a7b18dc212d33b4c04012210a06dce907b33377bef6864b6a8096c6fc12da78d63ac125147d440512b3f16a790b29de4c6'
            '1c1ea3deefebc440f40c7cc710ac2123e20df8d6921846250ca50c39125afa0ef0bf6b3ecbcb71dd29e0b49772d7f77aa5af789bfd22746c92e44d15473637c2')

build() {
  cd "$srcdir/makemkv-oss-${pkgver}"
  ./configure --prefix=/usr --disable-gui
  make
}

package() {
  cd "${srcdir}/makemkv-oss-${pkgver}"
  make DESTDIR="${pkgdir}" install

  cd "${srcdir}/makemkv-bin-${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -Dm 644 src/eula_en_linux.txt "${pkgdir}/usr/share/licenses/${pkgname}/eula_en_linux.txt"

  cd "$srcdir/"
  install -d "${pkgdir}/usr/share/man/man1/"
  install -m 644 -t "${pkgdir}/usr/share/man/man1/" makemkvcon.1 mmdtsdec.1
}
