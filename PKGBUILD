# Maintainer: Lars Sjostrom <lars at radicore dot se>
pkgname=iptvnator-git
pkgver=r1915.f87a261
pkgrel=1
pkgdesc="Cross-platform IPTV player application with multiple features, such as support of m3u and m3u8 playlists, favorites, TV guide, TV archive/catchup and more."
arch=('x86_64')
url="https://github.com/4gray/iptvnator"
license=('MIT')
depends=(
  'cairo'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libsoup3'
  'webkit2gtk-4.1'
  'openssl'
  'pango'
  'sqlite'
)
makedepends=(
  'git'
  'nodejs'
  'pnpm'
  'python'
)
optdepends=(
  'ffmpeg: audio and video libraries'
  'mpv: media player'
  'vlc: media player'
)
provides=('iptvnator')
conflicts=('iptvnator')
options=(!strip)
source=($pkgname::git+$url)
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  corepack enable
  pnpm install --frozen-lockfile
}

build() {
  cd "$srcdir/$pkgname"
  corepack enable

  python - <<'PY'
import json
from pathlib import Path

p = Path("electron-builder.json")
data = json.loads(p.read_text())

data["linux"]["target"] = [
    {
        "target": "pacman",
        "arch": ["x64"]
    }
]

p.write_text(json.dumps(data, indent=2) + "\n")
PY

  pnpm run make:app
}

package() {
  cd "$srcdir/$pkgname"

  local pacpkg
  pacpkg=$(find dist/executables -maxdepth 1 -type f -name '*.pacman' | head -n1)

  if [[ -z "$pacpkg" ]]; then
    echo "Could not find generated pacman package in dist/executables" >&2
    return 1
  fi

  bsdtar \
    --exclude '.BUILDINFO' \
    --exclude '.INSTALL' \
    --exclude '.MTREE' \
    --exclude '.PKGINFO' \
    -xpf "$pacpkg" -C "$pkgdir"

  install -d "$pkgdir/usr/bin"
  ln -sf /opt/IPTVnator/iptvnator "$pkgdir/usr/bin/iptvnator"
}
