# Maintainer: Sean Greenslade <aur@seangreenslade.com>
# Contributor: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: FadeMind <fademind@gmail.com>
# Contributor: Richard Jackson <rj@iinet.net.au>
pkgname=abiword-gtk2
_pkgname=abiword
pkgver=3.0.6
pkgrel=2
pkgdesc='Fully-featured word processor, GTk2, No plugins, Lite version'
arch=('i686' 'x86_64')
license=('GPL')
depends=('fribidi' 'wv' 'librsvg' 'enchant' 'desktop-file-utils' 'gtk2' 'libxslt')
makedepends=('boost' 'autoconf-archive')
optdepends=('hunspell: for spell checking')
conflicts=('abiword' 'abiword-plugins')
url='https://www.abisource.com'
source=(
  "git+https://gitlab.gnome.org/World/AbiWord.git?signed#tag=release-$pkgver"
)
b2sums=(   0e96a9cecd1cb96c3a2df7399167eccea1f61bea44866fc6f2981835b99cbfaa3e4cb5b4cf6cc4be2b6489ef5b4bbe74468abaaa711335e9be0c477eb02d4d09
)
validpgpkeys=('6C44DB3E0BF3EAF5B433239A5FEE05E6A56E15A3') # Hubert Figuiere

prepare() {
  cd AbiWord

  # A bunch of commits releated to icons broke on GTK2. Revert them.
  git revert -n 240b5d8fd4885ebee6e4df711382a5493c26eb0a
  git revert -n 72845672ac3d7a388bead68169871d8d2f41ee7e
  git revert -n 022208db943e46e2fbcd0b1f7e6406ea543eb557
  git revert -n b74e516e8f3b2390288ee5c99626139a4ba50a6e
  git revert -n 5fd00f2d41c44c7665a54349f826b136abe3af89
  git revert -n 1f2c36fbe8a45cc914029bc500e7aeb61979d2a4

  # Port to enchant 2
  git cherry-pick -n ae05e92df5a5d6151641622c83d35a6fdba47b1f

  ./autogen-common.sh
  autoreconf -fi
}

build() {
  cd AbiWord

  CXXFLAGS="-std=c++14"

  ./configure --prefix=/usr \
    --enable-shared \
    --disable-static \
    --with-gtk2 \
    --enable-clipart \
    --enable-templates \
    --enable-spell \
    --without-redland \
    --without-libical \
    --disable-builtin-plugins \
    --disable-default-plugins \
    --disable-collab-backend-service \
    --disable-collab-backend-tcp
  make -C goffice-bits2
  make
}

package() {
  cd AbiWord
  make DESTDIR="$pkgdir" install
}
