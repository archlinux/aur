# Maintainer: Darkstardevx <dev@cybercoretech.net>
#
# AUR source package for DWCode. Canonical copy lives in the upstream repo at
# packaging/aur/dwcode/PKGBUILD — `tools/aur-release.sh` is what bumps pkgver,
# recomputes sha256sums, regenerates .SRCINFO and pushes to
# ssh://aur@aur.archlinux.org/dwcode.git. Hand edits on the AUR copy are lost
# on the next release; change the upstream file instead.
#
# The sha256 below is SKIP only until the first tag exists: GitHub's tag
# tarball cannot be checksummed before `v${pkgver}` is pushed, and the release
# script refuses to publish while it is still SKIP.
pkgname=dwcode
pkgver=0.1.0
pkgrel=1
pkgdesc="Keyboard-first Cybercore desktop editor"
arch=('x86_64')
url="https://github.com/cybercoretech/dwcode"
license=('MIT')
depends=('qt6-base' 'qt6-declarative' 'qt6-webchannel' 'qt6-webengine' 'hicolor-icon-theme')
makedepends=('nodejs' 'npm' 'qt6-base' 'qt6-declarative' 'qt6-webchannel' 'qt6-webengine')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a02a631d477f18c67a64b1d8583ab7a0233b23def19d42459983765880891db5')

prepare() {
  cd "$pkgname-$pkgver"
  # The Monaco bundle is built from npm dependencies; both steps need network,
  # which makepkg allows during prepare()/build().
  npm ci --no-audit --no-fund
  npm run build
}

build() {
  cd "$pkgname-$pkgver"
  mkdir -p build
  cd build
  # DWCODE_WEB_ROOT is baked in at compile time and must match package().
  qmake6 "DWCODE_WEB_ROOT=/usr/share/dwcode/web" ../dwcode.pro
  make
}

check() {
  cd "$pkgname-$pkgver"
  # Declarative pack schema, theme token sets, local SVG icons, snippet shapes.
  npm run validate:packs
  # Backend suite: files, conflicts, path boundaries, terminal, themes, pack
  # loading, TypeScript LSP, session restore. The UI suite is left out on
  # purpose — it drives the real Qt WebEngine window offscreen and needs a
  # display stack an AUR build machine may not have.
  mkdir -p build/tests
  cd build/tests
  qmake6 ../../tests/backend.pro
  make
  ./backend-tests
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/dwcode "$pkgdir/usr/bin/dwcode"
  install -Dm644 packaging/arch/dwcode.desktop \
    "$pkgdir/usr/share/applications/dwcode.desktop"
  install -Dm644 brand/railshift/svg/railshift-favicon.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/dwcode.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -d "$pkgdir/usr/share/dwcode"
  cp -a web/dist "$pkgdir/usr/share/dwcode/web"
}
