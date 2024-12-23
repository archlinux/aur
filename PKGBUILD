# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Evangelos Foutras <foutrelis@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: Hugo Doria <hugo@archlinux.org>
# Contributor: TuxSpirit<tuxspirit@archlinux.fr>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=p7zip
pkgver=17.05
pkgrel=3
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
sha256sums=('d2788f892571058c08d27095c22154579dfefb807ebe357d145ab2ddddefb1a6'
            'b5f56b592f2e090a1871953438d4496a8082731e3eb2fcec0caad4834a1d38a9'
            'e7da5f830640611b306f0176874046bf224feaa9bec961f9cd0598e99d0a6b7d'
            '7dbb147d1d12bd11a95590182cae208be76d8cda13b385d8d150d8c179c21c3b'
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
  make OPTFLAGS="$CFLAGS $CPPFLAGS" 7z 7zr 7za
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
