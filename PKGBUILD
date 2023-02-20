# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: Hugo Doria <hugo@archlinux.org>
# Contributor: TuxSpirit<tuxspirit@archlinux.fr>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=p7zip
pkgver=17.05
pkgrel=1
epoch=1
pkgdesc="Command-line file archiver with high compression ratio"
arch=('x86_64')
url="https://github.com/p7zip-project/p7zip"
license=('LGPL' 'custom:unRAR')
depends=('gcc-libs' 'sh')
source=(https://github.com/p7zip-project/p7zip/archive/v$pkgver/$pkgname-v$pkgver.tar.gz
        oemcp-iconv.patch::https://github.com/p7zip-project/p7zip/commit/c104127e6a93.patch
        oemcp-cygwin.patch::https://github.com/p7zip-project/p7zip/commit/0e0a1a8316b6.patch
        oemcp-apple.patch::https://github.com/p7zip-project/p7zip/commit/334a01e3f8bc.patch
        do-not-gzip-man-pages.patch)
sha256sums=('9473e324de6a87d89cb7ff65b0fec4ae3f147f03ffc138189c336a4650d74804'
            '50f2068124c1c6adc2d9ccf455e9816eccd39d31920b953ab8fcb853232d452c'
            '789789216ca46e5ea9b6780e353f964a1f46e9a2bcaa6b16413adcf9a89eb374'
            'dfe1a625f80078c3ec68038f0aae8ba3a82ea96d0aeb97cb3586dc7fb3ef9650'
            '2179e67764eb46cb414ce9b5c978a532a6499617a6a685deb323b6da122aba00')

prepare() {
  cd $pkgname-$pkgver

  # Leave man page compression to makepkg to maintain reproducibility
  patch -Np1 -i ../do-not-gzip-man-pages.patch

  # https://github.com/p7zip-project/p7zip/issues/112
  patch -Rp1 -i ../oemcp-apple.patch
  patch -Rp1 -i ../oemcp-cygwin.patch
  patch -Rp1 -i ../oemcp-iconv.patch
}

build() {
  cd $pkgname-$pkgver
  make OPTFLAGS="$CPPFLAGS $CFLAGS" 7z 7zr 7za
}

package() {
  cd $pkgname-$pkgver

  make install \
    DEST_DIR="$pkgdir" \
    DEST_HOME=/usr \
    DEST_MAN=/usr/share/man

  # Remove documentation for the GUI file manager
  rm -r "$pkgdir/usr/share/doc/p7zip/DOC/MANUAL/fm"

  install -d "${pkgdir}"/usr/share/licenses/p7zip
  ln -s -t "$pkgdir/usr/share/licenses/p7zip/" \
    /usr/share/doc/p7zip/DOC/License.txt \
    /usr/share/doc/p7zip/DOC/unRarLicense.txt
}

# vim:set ts=2 sw=2 et:
