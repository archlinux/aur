# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=thiefmd
pkgver=0.2.7
pkgrel=1
pkgdesc="The markdown editor worth stealing. Inspired by Ulysses, based on code from Quilter"
arch=('x86_64' 'aarch64')
url="https://thiefmd.com"
license=('GPL-3.0-or-later')
depends=(
  'clutter'
  'discount'
  'gtksourceview4'
  'gtkspell3'
  'libarchive'
  'libgee'
  'link-grammar'
  'libhandy'
  'webkit2gtk-4.1'
)
makedepends=('git' 'meson' 'vala')
_commit=e654b302ce3d0945455bc923caac55967a9fda4e  # tags/0.2.7^0
source=("git+https://github.com/kmwallio/ThiefMD.git#commit=${_commit}"
        'git+https://github.com/flathub/shared-modules.git'
        'git+https://github.com/ThiefMD/libwritegood-vala.git'
        'git+https://github.com/TwiRp/ultheme-vala.git'
        'git+https://github.com/ThiefMD/writeas-vala.git'
        'git+https://github.com/ThiefMD/ghost-vala.git'
        'git+https://github.com/ThiefMD/custom-gtksourceview-languages.git'
        'git+https://github.com/ThiefMD/wordpress-vala.git'
        'git+https://github.com/ThiefMD/BiBtex-vala.git'
        'git+https://github.com/ThiefMD/medium-vala.git'
        'git+https://github.com/ThiefMD/forem-vala.git'
        'git+https://github.com/TwiRp/hashnode-vala.git')
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
            'SKIP'
            'SKIP')

pkgver() {
  cd ThiefMD
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd ThiefMD
  git submodule init
  git config submodule.flatpak/shared-modules.url "$srcdir/shared-modules"
  git config submodule.src/writegood.url "$srcdir/libwritegood-vala"
  git config submodule.src/ultheme.url "$srcdir/ultheme-vala"
  git config submodule.src/writeas.url "$srcdir/writeas-vala"
  git config submodule.src/ghost.url "$srcdir/ghost-vala"
  git config submodule.data/language-specs.url "$srcdir/custom-gtksourceview-languages"
  git config submodule.src/wordpress.url "$srcdir/wordpress-vala"
  git config submodule.src/bibtex.url "$srcdir/BiBtex-vala"
  git config submodule.src/medium.url "$srcdir/medium-vala"
  git config submodule.src/forem.url "$srcdir/forem-vala"
  git config submodule.src/hashnode.url "$srcdir/hashnode-vala"
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
