# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Hugo Courtial <hugo [at] courtial [not colon] me>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=openfx-io
pkgver=2.3.13
pkgrel=2
arch=("x86_64")
pkgdesc="A set of Readers/Writers plugins written using the OpenFX standard"
url="https://github.com/NatronGitHub/openfx-io"
license=("GPL")
depends=("ffmpeg" "libraw" "openimageio" "seexpr")
makedepends=("git")
optdepends=("natron-plugins")
source=("$pkgname::git+https://github.com/NatronGitHub/openfx-io#tag=Natron-$pkgver"
        'git+https://github.com/NatronGitHub/openfx'
        'git+https://github.com/NatronGitHub/SequenceParsing'
        'git+https://github.com/NatronGitHub/openfx-supportext'
        'git+https://github.com/NatronGitHub/tinydir')
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd "$srcdir/$pkgname"
  git config submodule.openfx.url $srcdir/openfx
  git config submodule.IOSupport/SequenceParsing.url $srcdir/SequenceParsing
  git config submodule.SupportExt.url $srcdir/openfx-supportext
  git submodule update

  cd IOSupport/SequenceParsing
  git config submodule.tinydir.url $srcdir/tinydir
  git submodule update
}

build() {
  cd "$srcdir/$pkgname"
  make CONFIG=release \
       BITS=64
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p "$pkgdir/usr/OFX/Plugins"
  make install PLUGINPATH=$pkgdir/usr/OFX/Plugins \
               CONFIG=release \
               BITS=64
}
