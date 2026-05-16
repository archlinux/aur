pkgname=faden
_pkgname=faden
pkgver=0.1.0
pkgrel=1
pkgdesc="Faden - desktop app for qualitative interview research"
arch=('x86_64')
url="https://github.com/ReadyPlayerNaN/faden"
license=('MIT')
options=(!lto)
depends=('ffmpeg' 'sqlite' 'webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'libsoup3' 'hicolor-icon-theme')
makedepends=('cargo' 'nodejs' 'npm' 'patchelf' 'pkgconf')
conflicts=('faden-bin' 'faden-git')
source=("faden-0.1.0.tar.gz::https://github.com/ReadyPlayerNaN/faden/archive/refs/tags/v0.1.0.tar.gz")
sha256sums=('ddc1ce9e6b014b6fecb80494f6ede1c8bd0ad3718124431c426f9e5d2b58cbe3')

prepare() {
  cd "$(find "$srcdir" -maxdepth 1 -type d -name "$_pkgname-*" | head -n1)"
  export npm_config_cache="$srcdir/npm-cache"
  npm ci
}

build() {
  cd "$(find "$srcdir" -maxdepth 1 -type d -name "$_pkgname-*" | head -n1)"
  npm run build
  cargo build --manifest-path src-tauri/Cargo.toml --bins --features tauri/custom-protocol --release
}

package() {
  cd "$(find "$srcdir" -maxdepth 1 -type d -name "$_pkgname-*" | head -n1)"

  install -Dm755 "src-tauri/target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "src-tauri/icons/128x128.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/faden/LICENSE"
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
