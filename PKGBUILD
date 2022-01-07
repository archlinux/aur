# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=thiefmd
pkgver=0.2.4
_codename=easypdf
pkgrel=1
pkgdesc="The markdown editor worth stealing. Inspired by Ulysses, based on code from Quilter"
arch=('x86_64' 'aarch64')
url="https://thiefmd.com"
license=('GPL3')
depends=('clutter' 'discount' 'gtksourceview4' 'gtkspell3' 'libarchive' 'libgee'
         'link-grammar' 'libhandy' 'webkit2gtk')
makedepends=('git' 'meson' 'vala')
source=("git+https://github.com/kmwallio/ThiefMD.git#tag=v$pkgver-$_codename"
        'git+https://github.com/ThiefMD/BiBtex-vala.git'
        'git+https://github.com/ThiefMD/ghost-vala.git'
        'git+https://github.com/TwiRp/ultheme-vala.git'
        'git+https://github.com/ThiefMD/wordpress-vala.git'
        'git+https://github.com/ThiefMD/writeas-vala.git'
        'git+https://github.com/ThiefMD/libwritegood-vala.git'
        'git+https://github.com/ThiefMD/custom-gtksourceview-languages.git')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir/ThiefMD"
  git describe --tags | sed "s/^v//;s/-$_codename//;s/-/+/g"
}

prepare() {
  cd "$srcdir/ThiefMD"
  git submodule init src/bibtex
  git config submodule.BiBtex-vala.url $srcdir/BiBtex-vala

  git submodule init src/ghost
  git config submodule.ghost-vala.url $srcdir/ghost-vala

  git submodule init src/ultheme
  git config submodule.ultheme-vala.url $srcdir/ultheme-vala

  git submodule init src/wordpress
  git config submodule.wordpress-vala.url $srcdir/wordpress-vala

  git submodule init src/writeas
  git config submodule.writeas-vala.url $srcdir/writeas-vala

  git submodule init src/writegood
  git config submodule.libwritegood-vala.url $srcdir/libwritegood-vala

  git submodule init data/language-specs
  git config submodule.custom-gtksourceview-languages.url $srcdir/custom-gtksourceview-languages

  git submodule update
}

build() {
  arch-meson ThiefMD build
  meson compile -C build
}

# Requires build_tests=true
#check() {
#  meson test -C build --print-errorlogs
#}

package() {
  meson install -C build --destdir "$pkgdir"

  ln -s "/usr/bin/com.github.kmwallio.$pkgname" "$pkgdir/usr/bin/$pkgname"
}
