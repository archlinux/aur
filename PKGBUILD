# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=editide
_app_id="io.frama.$pkgname.$pkgname"
pkgver=4.0.2
pkgrel=1
pkgdesc="Source-code editor with basic project support"
arch=('x86_64')
url="https://editide.frama.io"
license=('CC0-1.0 AND CC-BY-SA-3.0 AND LGPL-2.1-or-later')
depends=(
  'gtk4'
  'gtksourceview5'
  'python-gobject'
)
makedepends=(
  'git'
  'meson'
  'setconf'
)
checkdepends=('appstream')
optdepends=(
  'ctags: For symbols'
  'git: For the git extension'
  'libadwaita: For the Adwaita theme and recoloring'
  'libspelling: For the spellchecking extension'
)
source=("git+https://framagit.org/editide/releases.git#tag=$pkgver"
        'git+https://framagit.org/editide/editide.git')
sha256sums=('068f57977ca35f6ff36763453570049361bf72579f59d03df44cf5094e9b55c2'
            'SKIP')

prepare() {
  cd releases
  setconf .gitmodules url https://framagit.org/editide/editide.git

  git submodule init
  git config "submodule.src/$pkgname.url" "$srcdir/$pkgname"
  git -c protocol.file.allow=always submodule update
}

build() {
  arch-meson releases build
  meson compile -C build

  desktop-file-edit --set-key=Exec --set-value="$pkgname" \
    --set-key=StartupWMClass --set-value=localhost.EdiTidE4 \
    "build/data/${_app_id}.desktop"
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
