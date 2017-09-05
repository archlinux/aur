# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Olaf Bauer <hydro@freenet.de>

pkgname=makemkv-cli
pkgver=1.10.7
pkgrel=1
pkgdesc='DVD and Blu-ray to MKV converter and network streamer - CLI only'
arch=('i686' 'x86_64')
url='http://www.makemkv.com'
license=('LGPL' 'MPL' 'custom')
depends=('ffmpeg')
optdepends_x86_64=('lib32-glibc: dts support')
conflicts=('makemkv')
install=makemkv.install
source=(${url}/download/makemkv-bin-${pkgver}.tar.gz
        ${url}/download/makemkv-oss-${pkgver}.tar.gz
        makemkvcon.1
        mmdtsdec.1)
sha512sums=('7c3c1713df6b4009de2337a28f4c5b1f38d37be3a30f08ceafc6dc276c960960f6443fd5b29f5f96f10597093ff170fb5ab69d6244db5165da30abe1d3732aab'
            'f329449ed1bb4240a8256c3171c3c6cc0843c8d07a79526608fa3ea83e012634e6c6d9dd17160853b973d012e3483bcdaa17d9d1e6f7beb90c048b6063c12aa8'
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

  cd "$srcdir/makemkv-bin-${pkgver}"
  install -d "${pkgdir}/usr/bin/"
  install -t "${pkgdir}/usr/bin/" bin/i386/mmdtsdec
  if [ "$CARCH" = "x86_64" ]; then
    install -t "${pkgdir}/usr/bin/" bin/amd64/makemkvcon
  else
    install -t "${pkgdir}/usr/bin/" bin/i386/makemkvcon
  fi
  install -d "${pkgdir}/usr/share/MakeMKV"
  install -m 644 -t "${pkgdir}/usr/share/MakeMKV" src/share/makemkv_*.mo.gz src/share/*.mmcp.xml

  install -Dm 644 "${srcdir}/makemkv-bin-${pkgver}/src/eula_en_linux.txt" "${pkgdir}/usr/share/licenses/$pkgname/eula_en_linux.txt"

  cd "$srcdir/"
  install -d "${pkgdir}/usr/share/man/man1/"
  install -m 644 -t "${pkgdir}/usr/share/man/man1/" makemkvcon.1 mmdtsdec.1
}
