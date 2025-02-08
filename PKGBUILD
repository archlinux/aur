# Maintainer: Fabio J Matos Nieves <fabio.matos999@gmail.com>
pkgname=waytrogen
pkgver=0.6.8
pkgdesc='A lightning fast gui wallpaper setter written in Rust.'
depends=('ffmpeg' 'gtk4>=4.12.0' 'gettext' 'sqlite' 'glib2' 'gobject-introspection' 'graphene' 'harfbuzz' 'fribidi' 'fontconfig' 'libepoxy' 'libxi' 'libx11' 'libcloudproviders' 'tinysparql' 'libpng' 'libtiff' 'libjpeg-turbo' 'libxkbcommon' 'wayland' 'libxext' 'libxcursor' 'libxdamage' 'libxfixes' 'libxrandr' 'libxinerama' 'libthai' 'libthai' 'zlib' 'freetype2' 'libxrender' 'libxcb' 'pixman' 'util-linux-libs' 'libffi' 'pcre' 'graphite' 'expat' 'json-glib' 'libxml2' 'zstd' 'xz' 'lzo' 'libdatrie' 'bzip2' 'brotli' 'libxau' 'libxdmcp' 'icu' 'bash' )
url="https://github.com/nikolaizombie1/waytrogen"
source=("$pkgname-$pkgver.tar.gz::https://github.com/nikolaizombie1/waytrogen/archive/refs/tags/"$pkgver".tar.gz")
pkgrel=1
makedepends=('rust' 'cargo' 'gcc' )
optdepends=('hyprpaper: hyprland wallpaper setter'
	    'swaybg: sway wallpaper setter'
	    'mpvpaper: animated wallpapers using mpv'
	    'swww: wallpaper setter with transitions')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
sha256sums=('SKIP')
license=('Unlicence')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd "$pkgname-$pkgver"
  cargo build --frozen --release
}

package_waytrogen() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm0644 -t "$pkgdir/usr/share/glib-2.0/schemas/" org.Waytrogen.Waytrogen.gschema.xml
  install -Dm0644 waytrogen.desktop $pkgdir/usr/share/applications/waytrogen.desktop
  install -Dm0644 README-Assets/WaytrogenLogo.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/waytrogen.svg
  while IFS= read -r lang; do
        mkdir -p $pkgdir/usr/share/locale/$lang/LC_MESSAGES
        msgfmt locales/$lang/LC_MESSAGES/waytrogen.po -o $pkgdir/usr/share/locale/$lang/LC_MESSAGES/waytrogen.mo
  done < locales/LINGUAS
}
