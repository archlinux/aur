# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=atoms
pkgver=2.0.1
pkgrel=1
pkgdesc="Easily manage Linux Chroot(s) and Containers"
arch=('x86_64')
url="https://github.com/AtomsDevs/Atoms"
license=('GPL-3.0-only')
depends=(
  'cpak'
  'gtk4'
  'gtk4-layer-shell'
  'gtksourceview5'
  'json-glib'
  'libadwaita'
  'libgee'
  'libpeas-2'
  # 'libsingularity'  ## TODO
  'libsoup3'
  'vte4'
)
makedepends=(
  'git'
  'meson'
  'sassc'
  'vala'
)
checkdepends=('xorg-server-xvfb')
provides=(
  'atoms-cli'
  'atoms-core'
  'atoms-provider-cpak'
  'libatoms-core-2.so=2'
  'libsingularity.so=0'
)
conflicts=(
  'atoms-cli'
  'atoms-core'
  'libsingularity'
)
source=("git+https://github.com/AtomsDevs/Atoms.git#tag=v$pkgver"
        'git+https://github.com/AtomsDevs/atoms-cli.git'
        'git+https://github.com/AtomsDevs/atoms-core.git'
        'git+https://github.com/AtomsDevs/atoms-provider-cpak.git')
sha256sums=('4fd3e15d1b79aabc62149cec3b64d2fa878895a3ee55bcedcbfbd55d89075559'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd Atoms
  git submodule init
  git config submodule.atoms-cli.url "$srcdir/atoms-cli"
  git config submodule.atoms-core.url "$srcdir/atoms-core"
  git config submodule.atoms-provider-cpak.url "$srcdir/atoms-provider-cpak"
  git -c protocol.file.allow=always submodule update

  # Use libsingularity subproject until libsingularity-git AUR package can be used
  meson subprojects download
}

build() {
  arch-meson Atoms build
  meson compile -C build
}

check() {
  xvfb-run meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
