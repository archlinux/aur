# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=eloquent
pkgver=1.5
pkgrel=1
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
  'libportal'
  'libportal-gtk4'
)
makedepends=(
  'blueprint-compiler'
  'git'
  'meson'
)
source=("git+https://github.com/sonnyp/Eloquent.git#tag=v$pkgver"
        'git+https://github.com/sonnyp/troll.git'
        'Adjust-paths-and-commands-for-nonflatpak-environment.diff')
sha256sums=('2c343d3a01ccb5994e0b934d356d2b23a679695634dbcd99bbf4a4dde7779ef2'
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
