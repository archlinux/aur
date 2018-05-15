# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Olaf Bauer <hydro@freenet.de>

pkgname=makemkv-cli
pkgver=1.12.2
pkgrel=2
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
sha512sums=('25b6be8dcea8aa521f2cf4b4ebac1a7a29ed1de603c5c14ee50f94fbf6a2968bf94116ba2dc39129334fb62497966d01032da4b276563c2e819a5f62f93d4d94'
            'd418dbb14b55bc69937d2265220b3df9dd4baf7d083ba94ff51ed5d9eb2e65c0c4dd2527076dfdcc539ccde7da24dcba94e471bef47998921f0d154330dc2980'
            'cbed2ae086634883e307760948c969a7b18dc212d33b4c04012210a06dce907b33377bef6864b6a8096c6fc12da78d63ac125147d440512b3f16a790b29de4c6'
            '1c1ea3deefebc440f40c7cc710ac2123e20df8d6921846250ca50c39125afa0ef0bf6b3ecbcb71dd29e0b49772d7f77aa5af789bfd22746c92e44d15473637c2')

prepare() {
  cd "$srcdir/makemkv-oss-${pkgver}"
  sed -i 's/CODEC_FLAG_GLOBAL_HEADER/AV_CODEC_FLAG_GLOBAL_HEADER/' libffabi/src/ffabi.c
  sed -i 's/FFM_AV_CODEC_FLAG_GLOBAL_HEADER/FFM_CODEC_FLAG_GLOBAL_HEADER/' libffabi/src/ffabi.c
}

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
