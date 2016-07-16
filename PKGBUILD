# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Olaf Bauer <hydro@freenet.de>

pkgname=makemkv-cli
pkgver=1.10.0
pkgrel=1
pkgdesc="DVD and Blu-ray to MKV converter and network streamer - CLI only"
arch=('i686' 'x86_64')
url="http://www.makemkv.com"
license=('LGPL' 'MPL' 'custom')
depends=('ffmpeg')
conflicts=('makemkv')
if [ "$CARCH" = "x86_64" ]; then
  optdepends=('lib32-glibc: dts support')
fi
install=makemkv.install
source=(${url}/download/makemkv-bin-${pkgver}.tar.gz
        ${url}/download/makemkv-oss-${pkgver}.tar.gz
        makemkvcon.1
        mmdtsdec.1)
sha512sums=('77394409c4180ba8f46e5e86fec1ba295ae1a846bb368f05ee01821000a2d5008fc5f18b4d227a1c4d176d591ae8fa0c22a1ca125a873fa64d993762ee997ba0'
            '6c819aee37a0298680f70c1726a2f4f6a5d22ee91384bf8dfeb9dc594ef811c1749b26583fed450099526e8fb62a67560034c742f110e7c689badc3566622942'
            'cbed2ae086634883e307760948c969a7b18dc212d33b4c04012210a06dce907b33377bef6864b6a8096c6fc12da78d63ac125147d440512b3f16a790b29de4c6'
            '1c1ea3deefebc440f40c7cc710ac2123e20df8d6921846250ca50c39125afa0ef0bf6b3ecbcb71dd29e0b49772d7f77aa5af789bfd22746c92e44d15473637c2')

build() {
  cd $srcdir/makemkv-oss-${pkgver}
  ./configure --prefix=/usr --disable-gui
  make
}

package() {
  cd ${srcdir}/makemkv-oss-${pkgver}
  make DESTDIR="${pkgdir}" install

  cd $srcdir/makemkv-bin-${pkgver}
  install -d ${pkgdir}/usr/bin/
  install -t ${pkgdir}/usr/bin/ bin/i386/mmdtsdec
  if [ "$CARCH" = "x86_64" ]; then
    install -t ${pkgdir}/usr/bin/ bin/amd64/makemkvcon
  else
    install -t ${pkgdir}/usr/bin/ bin/i386/makemkvcon
  fi
  install -d ${pkgdir}/usr/share/MakeMKV
  install -m 644 -t ${pkgdir}/usr/share/MakeMKV src/share/makemkv_*.mo.gz src/share/*.mmcp.xml
  
  install -Dm 644 ${srcdir}/makemkv-bin-${pkgver}/src/eula_en_linux.txt ${pkgdir}/usr/share/licenses/$pkgname/eula_en_linux.txt

  cd $srcdir/
  install -d ${pkgdir}/usr/share/man/man1/
  install -m 644 -t ${pkgdir}/usr/share/man/man1/ makemkvcon.1 mmdtsdec.1
}
