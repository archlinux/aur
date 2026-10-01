# Maintainer: MapleProjects <mapleprojects@users.noreply.github.com>

pkgname=orchard-git
pkgver=5.0.0.beta.9.39.ge6cf95b
pkgrel=1
pkgdesc='Power-user desktop client for YouTube Music with beat-matched crossfade, audiophile EQ and local replay'
arch=('x86_64')
url='https://github.com/SFG5453/Orchard'
license=('AGPL-3.0-or-later')
depends=('electron')
makedepends=('git' 'nodejs' 'npm' 'rust')
provides=('orchard')
conflicts=('orchard' 'orchard-packages')
options=('!lto')
source=(
  "$pkgname::git+https://github.com/SFG5453/Orchard.git#branch=main"
  'orchard.desktop'
  'orchard.sh'
)
sha256sums=('SKIP'
            '8d4add46970cda72a79eef79dad5943fdb818299795443e938cb326053eb8492'
            '0245fdeaa257b91ea98e8cda0e7625167cbf65b6d7c8f35ea2fefe232396a7b9')

pkgver() {
  cd "$pkgname"
  local desc
  desc=$(git describe --tags --long 2>/dev/null)
  if [[ -n $desc ]]; then
    printf '%s' "${desc#v}" | sed 's/-/./g'
  else
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

prepare() {
  cd "$pkgname"
  npm ci --ignore-scripts --no-audit --no-fund
}

build() {
  cd "$pkgname"
  npm run build
  npm prune --omit=dev
  rm -rf node_modules/onnxruntime-node/bin/napi-v6/{darwin,win32}
  find node_modules/onnxruntime-node/bin/napi-v6/linux \
    -mindepth 1 -maxdepth 1 -type d ! -name x64 -exec rm -rf {} +
}

package() {
  cd "$pkgname"

  install -dm755 "$pkgdir/opt/orchard"
  cp -a \
    package.json \
    LICENSE \
    electron \
    shared \
    dist \
    models \
    packages \
    node_modules \
    "$pkgdir/opt/orchard/"

  install -dm755 \
    "$pkgdir/opt/orchard/native-audio-rust" \
    "$pkgdir/opt/orchard/native-media"
  cp -a native-audio-rust/index.cjs native-audio-rust/build \
    "$pkgdir/opt/orchard/native-audio-rust/"
  cp -a native-media/index.cjs native-media/build \
    "$pkgdir/opt/orchard/native-media/"

  install -Dm755 "$srcdir/orchard.sh" "$pkgdir/usr/bin/orchard"
  install -Dm644 "$srcdir/orchard.desktop" \
    "$pkgdir/usr/share/applications/dev.sfg.orchard.desktop"
  install -Dm644 public/orchard-logo.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/dev.sfg.orchard.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
