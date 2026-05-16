pkgname=faden-git
_pkgname=faden
pkgver=0.r0.g0000000
pkgrel=1
pkgdesc="Faden - desktop app for qualitative interview research"
arch=('x86_64')
url="https://github.com/ReadyPlayerNaN/faden"
license=('MIT')
depends=('ffmpeg' 'webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'libsoup3' 'hicolor-icon-theme')
makedepends=('binutils' 'cargo' 'nodejs' 'npm' 'dpkg' 'patchelf')
provides=('faden')
conflicts=('faden')
source=("$_pkgname::git+https://github.com/ReadyPlayerNaN/faden.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf '%s.r%s.g%s'     "$(git show -s --format=%cd --date=format:%Y%m%d)"     "$(git rev-list --count HEAD)"     "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  export npm_config_cache="$srcdir/npm-cache"
  npm ci
}

build() {
  cd "$srcdir/$_pkgname"
  npm run tauri build -- --bundles deb
}

package() {
  cd "$srcdir/$_pkgname"
  local data_dir
  data_dir="$(find src-tauri/target/release/bundle/deb -type d -path '*/data' | head -n1)"

  if [[ -z "$data_dir" ]]; then
    echo 'Tauri deb bundle data directory not found' >&2
    exit 1
  fi

  cp -a "$data_dir"/. "$pkgdir"/
}
