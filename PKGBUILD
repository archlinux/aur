pkgname=faden-git
_pkgname=faden
pkgver=0.r0.g0000000
pkgrel=1
pkgdesc="Faden - desktop app for qualitative interview research"
arch=('x86_64')
url="https://github.com/ReadyPlayerNaN/faden"
license=('MIT')
depends=('ffmpeg' 'sqlite' 'webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'libsoup3' 'hicolor-icon-theme')
makedepends=('cargo' 'nodejs' 'npm' 'patchelf' 'pkgconf')
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
  npm run build
  cargo build --manifest-path src-tauri/Cargo.toml --bins --features tauri/custom-protocol --release
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dm755 "src-tauri/target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "src-tauri/icons/128x128.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/faden-git/LICENSE"
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" <<DESKTOP
[Desktop Entry]
Type=Application
Name=Faden
Comment=Faden - desktop app for qualitative interview research
Exec=$_pkgname
Icon=$_pkgname
Terminal=false
Categories=Office;AudioVideo;
StartupWMClass=faden
DESKTOP
}
