# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=thiefmd
pkgver=0.2.6+2+g9f430c2
pkgrel=1
pkgdesc="The markdown editor worth stealing. Inspired by Ulysses, based on code from Quilter"
arch=('x86_64' 'aarch64')
url="https://thiefmd.com"
license=('GPL3')
depends=('clutter' 'discount' 'gtksourceview4' 'gtkspell3' 'libarchive' 'libgee'
         'link-grammar' 'libhandy' 'webkit2gtk')
makedepends=('git' 'meson' 'vala')
_commit=9f430c25f41983a0e7b9ddac88c502ad7e1bdd2f
source=("git+https://github.com/kmwallio/ThiefMD.git#commit=${_commit}"
        'git+https://github.com/ThiefMD/BiBtex-vala.git'
        'git+https://github.com/ThiefMD/forem-vala.git'
        'git+https://github.com/ThiefMD/ghost-vala.git'
        'git+https://github.com/TwiRp/hashnode-vala.git'
        'git+https://github.com/ThiefMD/medium-vala.git'
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
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir/ThiefMD"
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd "$srcdir/ThiefMD"
  git submodule init
  git config submodule.src/bibtex.url "$srcdir/BiBtex-vala"
  git config submodule.src/forem.url "$srcdir/forem-vala"
  git config submodule.src/ghost.url "$srcdir/ghost-vala"
  git config submodule.src/hashnode.url "$srcdir/hashnode-vala"
  git config submodule.src/medium.url "$srcdir/medium-vala"
  git config submodule.src/ultheme.url "$srcdir/ultheme-vala"
  git config submodule.src/wordpress.url "$srcdir/wordpress-vala"
  git config submodule.src/writeas.url "$srcdir/writeas-vala"
  git config submodule.src/writegood.url "$srcdir/libwritegood-vala"
  git config submodule.data/language-specs.url "$srcdir/custom-gtksourceview-languages"
  git -c protocol.file.allow=always submodule update
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
