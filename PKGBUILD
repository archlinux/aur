# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Olaf Bauer <hydro@freenet.de>

pkgname=makemkv-cli
pkgver=1.12.0
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
sha512sums=('039a60308b90434c9aa39a18c03078cd67c8f5594ea20578dcc2c2eb75fbf2bc1918f976cb35b97c977c3380cbef27c5cb819593276343b6357cd0b384ac6c22'
            '36c6f1e447081e2bd003fb75e6b70eaac4c6ed5ea2b39615bf81599664c66631c3ae84dcb04448ac8877724fdc4112b351af8c16aa3d1463ce8a7ac871524469'
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
