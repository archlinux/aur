# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=thiefmd
_app_id="com.github.kmwallio.$pkgname"
pkgver=0.3.2
pkgrel=1
pkgdesc="The markdown editor worth stealing. Inspired by Ulysses, based on code from Quilter"
arch=('x86_64' 'aarch64')
url="https://thiefmd.com"
license=('GPL-3.0-or-later')
depends=(
  'discount'
  'gtk4'
  'gtksourceview5'
  'json-glib'
  'libadwaita'
  'libarchive'
  'libgee'
  'libsecret'
  'libsoup3'
  'libspelling'
  'libxml2'
  'link-grammar'
  'webkitgtk-6.0'
)
makedepends=(
  'git'
  'meson'
  'vala'
)
source=("git+https://github.com/kmwallio/ThiefMD.git#tag=v$pkgver"
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
sha256sums=('89f9e0cc84e5c7c94484247faea85fd0eb3d67f5112ecda5cf18b51fe913e654'
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

prepare() {
  cd ThiefMD
  git submodule init \
    src/writegood \
    src/ultheme \
    src/writeas \
    src/ghost \
    data/language-specs \
    src/wordpress \
    src/bibtex \
    src/medium \
    src/forem \
    src/hashnode
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

check() {
  cd ThiefMD
  appstreamcli validate --no-net "data/${_app_id}.appdata.xml" || :
  desktop-file-validate "data/${_app_id}.desktop"
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"

  ln -s "/usr/bin/com.github.kmwallio.$pkgname" "$pkgdir/usr/bin/$pkgname"
}
