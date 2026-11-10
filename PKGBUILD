# Maintainer: XSilverTH <XSilverTH@proton.me>

pkgname=silverscreen-git
pkgver=0.1.0.r0.g0000000
pkgrel=1
pkgdesc='Native GTK4 YouTube client that plays videos with MPV'
arch=('x86_64')
url='https://github.com/XSilverTH/SilverScreen'
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'webkitgtk-6.0' 'libsoup3' 'mpv' 'yt-dlp' 'hicolor-icon-theme')
makedepends=('git' 'dotnet-sdk>=10' 'blueprint-compiler' 'glib2' 'clang' 'pkgconf')
provides=('silverscreen')
conflicts=('silverscreen')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd SilverScreen
  local desc
  if desc=$(git describe --long --tags 2>/dev/null); then
    printf '%s' "$desc" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf '0.1.0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

prepare() {
  cd SilverScreen
  if [ -d "$srcdir/Hi3Helper.SharpDiscordRPC" ]; then
    git submodule init lib/Hi3Helper.SharpDiscordRPC
    git config submodule.lib/Hi3Helper.SharpDiscordRPC.url "$srcdir/Hi3Helper.SharpDiscordRPC"
  fi
  if [ -d "$srcdir/YoutubeAPI" ]; then
    git submodule init lib/YoutubeAPI
    git config submodule.lib/YoutubeAPI.url "$srcdir/YoutubeAPI"
  fi

  local origin_url
  origin_url=$(git config remote.origin.url)
  if [ -d "$origin_url" ]; then
    origin_url=$(git -C "$origin_url" -c safe.bareRepository=all config remote.origin.url 2>/dev/null || true)
  fi
  if [ -n "$origin_url" ]; then
    git remote set-url origin "$origin_url"
  else
    git remote set-url origin "${url%.git}.git"
  fi

  git -c protocol.file.allow=always submodule update --init --recursive
}

build() {
  cd SilverScreen
  dotnet publish src/SilverScreen.App/SilverScreen.App.csproj \
    /p:DebugType=None /p:DebugSymbols=false \
    -o "$srcdir/SilverScreen/publish"
}

package() {
  cd SilverScreen
  install -Dm755 "publish/SilverScreen" "$pkgdir/usr/bin/SilverScreen"
  ln -s SilverScreen "$pkgdir/usr/bin/silverscreen"
  install -Dm644 packaging/io.github.silverscreen.SilverScreen.desktop \
    "$pkgdir/usr/share/applications/io.github.silverscreen.SilverScreen.desktop"
  install -Dm644 packaging/io.github.silverscreen.SilverScreen.metainfo.xml \
    "$pkgdir/usr/share/metainfo/io.github.silverscreen.SilverScreen.metainfo.xml"
  install -Dm644 packaging/io.github.silverscreen.SilverScreen.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.silverscreen.SilverScreen.svg"
  install -Dm644 lib/Hi3Helper.SharpDiscordRPC/LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/DiscordRPC.LICENSE"
  install -Dm644 lib/YoutubeAPI/LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/YoutubeAPI.LICENSE"
}
