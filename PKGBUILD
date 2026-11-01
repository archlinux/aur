# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=editide
_app_id="io.frama.$pkgname.$pkgname"
pkgver=4.0.6
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
  'desktop-file-utils'
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
sha256sums=('4ff1f087a3f4b3e8283a0314dc959cad7e174c2caf30c6eb0481a6ae1fa6bed8'
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
