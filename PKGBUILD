# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Olaf Bauer <hydro@freenet.de>

pkgname=makemkv-cli
pkgver=1.10.8
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
sha512sums=('8a71c60598ca73369e68ff4a9377e6a74e29e13d82de58b8e18baf6446ebad31169d86e6377de3a14bb13c46bd5fde60fa965a6524917d916be5c9eb0308f78e'
            'c76438adca70af8049774c8f9e2d8109d04e121b7eafeb08f0aa7b2f149dfc9fa691e73aced7b08f1a296e1907e411ffd673199e6f59841d2921ab3f01f6f468'
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
