# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=eloquent
pkgver=1.2
pkgrel=2
pkgdesc="Your proofreading assistant"
arch=(any)
url="https://github.com/sonnyp/Eloquent"
license=(GPL-3.0-only)
depends=(gjs libadwaita languagetool fasttext fasttext-langid-models)
makedepends=(gobject-introspection blueprint-compiler git meson)
checkdepends=(appstream-glib)
source=("git+https://github.com/sonnyp/Eloquent.git#tag=v$pkgver"
        "git+https://github.com/sonnyp/troll.git#commit=53155a0" # submodule commit for this tag so far
        "Adjust-paths-and-commands-for-nonflatpak-environment.diff"
        "fix-metainfo-syntax.diff")
b2sums=('fc946c026b7c8f041ba690e227237c56864906be993f84037e27a3b08f460cd04050091b43a8adf68ff039312a949adafe73e1ca6c01df3243139c6883d98609'
        '4321bc52b2fa758a55e8f49bd14b58b1ba13b2f67f7dcdfec453e5b8ae6fc946fb61b3efe3790e3c7531b056116a1118d22d360e0a04fb90b0017fce58457d84'
        'aff8f2193330aed1205bc3f45d9eeb901588ad89b27db05b6de72ff9af5797c675ca8904ec170cf55c7cf564bd201fc5e1a44ff665aaccb479bfb5a96f4ab8c6'
        '64d7725b6a5ccb727dca3a77682960e4ac7a0eee3ad835ddccbf4abfd8a0c25c87af157f2650dd17eee923fcecfc93ee22563eaf41f0b6e7737b199d09319dd6')

prepare() {
  cd Eloquent
  git submodule init
  git config submodule.troll.url "$srcdir/troll"
  git -c protocol.file.allow=always submodule update

  git apply ../Adjust-paths-and-commands-for-nonflatpak-environment.diff
  git apply ../fix-metainfo-syntax.diff
}

build() {
  arch-meson Eloquent build
  meson compile -C build
}

# https://github.com/sonnyp/Eloquent/issues/13
check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
