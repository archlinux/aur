# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=eloquent
pkgver=1.4
pkgrel=2
pkgdesc="Your proofreading assistant"
arch=('any')
url="https://github.com/sonnyp/Eloquent"
license=('GPL-3.0-only')
depends=(
  'fasttext'
  'fasttext-langid-models'
  'gjs'
  'gtk4'
  'languagetool'
  'libadwaita'
)
makedepends=(
  'blueprint-compiler'
  'git'
  'meson'
)
source=("git+https://github.com/sonnyp/Eloquent.git#tag=v$pkgver"
        'git+https://github.com/sonnyp/troll.git'
        'Adjust-paths-and-commands-for-nonflatpak-environment.diff')
sha256sums=('d59c4b53432693919343bd43ccdc81c4e8da4738e73ab1ee92620ab5fc5e8fcf'
            'SKIP'
            'c1e5ee00bd7b38263d7fc64b319fcb95a2cdfb1f2517b15ed6bb6622934ce373')

prepare() {
  cd Eloquent
  git submodule init
  git config submodule.troll.url "$srcdir/troll"
  git -c protocol.file.allow=always submodule update

  git apply -3 ../Adjust-paths-and-commands-for-nonflatpak-environment.diff
}

build() {
  arch-meson Eloquent build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"

  ln -s /usr/bin/re.sonny.Eloquent "$pkgdir/usr/bin/$pkgname"
}
