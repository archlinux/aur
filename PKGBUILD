# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Olaf Bauer <hydro@freenet.de>

pkgname=makemkv-cli
pkgver=1.14.4
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
sha512sums=('ef48c09f56b3c46edd25a690b27dd0216b701ff84133e99742c263157f5ea032fd76286b9d8e3979cdd0da8ddceacab4fe0981e056df65228394ac91228c3c09'
            '05fab5d97fe0f0678c2000dd7580532ccafa6c0232bc61a5f17e79f1c02577b6317a78bb12af481d5fdc8eff2e0633aa58a430c256d6d72f04247774e2044b20'
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
