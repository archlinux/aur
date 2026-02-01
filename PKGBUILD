# Maintainer: BlackFrame42 <black_frame42@yahoo.com>
# Contributor: Ian D. Scott <ian@perebruin.com>
# Contributor: John Pate <jkpate@jkpate.net>
pkgname=naev-git
_pkgname=naev
pkgver=0.14.0.alpha.2.r83.g8595c1e
pkgrel=1
pkgdesc='2D action/rpg space game'
arch=('x86_64')
url="https://codeberg.org/naev/naev"
license=('GPL3')
depends=('glu' 'openal' 'libvorbis' 'sdl3' 'libgl' 'libxml2' 'freetype2' 'libpng' 'libzip'
         'luajit' 'glpk' 'physfs' 'libunibreak' 'suitesparse' 'openblas' 'cmark' 'enet'
         'opus' 'dav1d')
makedepends=('freeglut' 'zip' 'meson' 'git' 'python-yaml' 'rust' 'rust-bindgen' 'git-lfs')
conflicts=('naev')
provides=("naev=${pkgver}")
source=(
  "naev::git+https://codeberg.org/naev/naev.git"
  "shlinters::git+https://codeberg.org/johann1764/shlinters#branch=main"
  "smd::git+https://codeberg.org/johann1764/smd"
  "u_codespell::git+https://codeberg.org/johann1764/u_codespell#branch=main"
  "assets::git+https://codeberg.org/naev/naev-assets-lossy.git"
  "lua-repl::git+https://github.com/hoelzro/lua-repl.git"
  "mingw-bundledlls::git+https://github.com/ProjectSynchro/mingw-bundledlls.git#branch=ucrt_blacklist"
)
sha512sums=(
  "SKIP"
  "SKIP"
  "SKIP"
  "SKIP"
  "SKIP"
  "SKIP"
  "SKIP"
)
pkgver() {
  cd "$_pkgname"
  git describe --long --tags --exclude=nightly --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
prepare() {
  cd "$srcdir/$_pkgname"
  repo="."
  git -C $repo submodule init
  git -C $repo config submodule.assets.url "file://$srcdir/assets"
  git -C $repo config submodule.dat/lua-repl.url "file://$srcdir/lua-repl"
  git -C $repo config submodule.extras/windows/mingw-bundledlls.url "file://$srcdir/mingw-bundledlls"
  git -C $repo config submodule.utils/shlinters.url "file://$srcdir/shlinters"
  git -C $repo -c protocol.file.allow=always submodule update
  git -C assets lfs install --local
  git -C assets remote add network-origin https://codeberg.org/naev/naev-assets-lossy.git 2>/dev/null || true
  git -C assets lfs pull network-origin
  repo="./utils/shlinters"
  git -C $repo submodule init
  git -C $repo config submodule.smd.url "file://$srcdir/smd"
  git -C $repo config submodule.u_codespell.url "file://$srcdir/u_codespell"
  git -C $repo -c protocol.file.allow=always submodule update
}
options=('!lto')
build() {
  cd "$srcdir/$_pkgname"
  meson setup --buildtype=release -Dprefix=/usr -Dndata_path=/usr/share/naev/ndata build .
  cd build
  meson compile
}
package() {
  cd "$srcdir/$_pkgname/build"
  DESTDIR="$pkgdir" meson install
}
