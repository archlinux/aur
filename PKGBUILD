# Maintainer: Aditya Hebballe <adityahebballe@proton.me>

pkgname=harbor-stremio-git
_pkgname=harbor
pkgver=0.9.69.r280.g8a8ef36
pkgrel=1
pkgdesc='A Stremio client built for adventure'
arch=('x86_64')
url='https://github.com/harborstremio/harbor'
license=('MIT')
options=('!lto')

depends=(
  'ffmpeg'
  'gst-libav'
  'gst-plugins-bad'
  'gst-plugins-good'
  'gtk3'
  'libayatana-appindicator'
  'mpv'
  'webkit2gtk-4.1'
  'yt-dlp'
)

makedepends=(
  'cargo'
  'git'
  'libarchive'
  'nodejs'
  'pnpm'
  'pkgconf'
  'rust'
)

provides=('harbor-stremio' 'harbor')
conflicts=('harbor-stremio' 'harbor' 'harbor-stremio-bin')

source=("$_pkgname::git+https://github.com/harborstremio/harbor.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  local version revision commit
  version="$(node -p "require('./package.json').version")"
  revision="$(git rev-list --count HEAD)"
  commit="$(git rev-parse --short HEAD)"

  printf '%s.r%s.g%s' "$version" "$revision" "$commit"
}

prepare() {
  cd "$srcdir/$_pkgname"

  cat > pnpm-workspace.yaml <<'EOF'
packages:
  - "."

allowBuilds:
  esbuild: true

onlyBuiltDependencies:
  - esbuild
EOF

  pnpm install --frozen-lockfile
  pnpm run setup:fonts
}

build() {
  cd "$srcdir/$_pkgname"

  pnpm run tauri:build:linux-system --bundles deb
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  local deb data_archive
  deb="$(find src-tauri/target -path '*/release/bundle/deb/*.deb' -type f | head -n 1)"

  if [[ -z "$deb" ]]; then
    echo "Debian bundle not found" >&2
    return 1
  fi

  rm -rf "$srcdir/deb-extract"
  mkdir -p "$srcdir/deb-extract"
  bsdtar -xf "$deb" -C "$srcdir/deb-extract"

  data_archive="$(find "$srcdir/deb-extract" -maxdepth 1 -type f -name 'data.tar.*' | head -n 1)"
  if [[ -z "$data_archive" ]]; then
    echo "Debian data archive not found" >&2
    return 1
  fi

  bsdtar -xf "$data_archive" -C "$pkgdir"

  if [[ -x "$pkgdir/usr/bin/harbor" && ! -e "$pkgdir/usr/bin/harbor-stremio" ]]; then
    ln -s harbor "$pkgdir/usr/bin/harbor-stremio"
  fi
}
