# Maintainer: sysrqmagician <aur@sysrqmagician.dev>

# This is a modified version of the en-croissant PKGBUILD and accompanying patches (commit 6b975bdec30eb8c37454f49688b892e1c0b36fa1)
# Contributor: Claudia Pellegrino <aur ät cpellegrino.de> (en-croissant maintainer)

pkgname=en-croissant-git
_pkgname=en-croissant
pkgver=v0.11.1.r59.g2a0b134
pkgrel=1
pkgdesc='Modern chess GUI and analysis tool'
arch=('x86_64')
url='https://github.com/franciscoBSalgueiro/en-croissant'
license=('GPL-3.0-only')
depends=(
  'bzip2'
  'cairo'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'

  # https://aur.archlinux.org/packages/en-croissant#comment-1017641
  # https://github.com/tauri-apps/tauri/issues/4642#issuecomment-1643229562
  'gst-plugins-good'

  'gtk3'
  'hicolor-icon-theme'
  'libsoup'
  'openssl'
  'pango'
  'webkit2gtk'
)
makedepends=('cargo' 'pnpm' 'git')
optdepends=(
  'stockfish: chess engine that can be integrated via Engines » Add New » Local'
)
conflicts=(
  'en-croissant-bin'
  'en-croissant'
)
options=(
  # Fixes `/usr/lib/libsqlite3.so.0: error adding symbols: DSO missing from command line`
  '!lto'
)

source=(
  "$_pkgname::git+$url.git"
  'disable-updater.patch'
  'en-croissant.desktop'
)

b2sums=('SKIP'
        '574c254a325116aaf771338bd49acdd23235434198b6b8627faada60d1714ba775fd04af1707b6f749706987ea89b6234848edc4a1a48b1cb742b1b8401e7608'
        '5e3b8c4b56b9a24a7913c12b707566027f33407f20bf440f56cd2147a0388f80895ba058355680fa1af2db5c17634dfe5e8c83112e3f33b93259c3119b8e1378')

prepare() {
  cd "$_pkgname"
  echo >&2 'Applying patch to disable automatic update downloads'
  patch -p1 < '../disable-updater.patch'

  echo >&2 'Installing npm dependencies'
  pnpm install --frozen-lockfile
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  pnpm build
}

check() {
  cd "$_pkgname"
  pnpm test
}

package() {
  cd "$_pkgname"

  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    'LICENSE'

  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    'README.md'

  install -D -m 644 -t "${pkgdir}/usr/share/applications" \
    '../en-croissant.desktop'

  install -D -m 644 -T \
    'src-tauri/icons/icon.png' \
    "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  install -D -m 755 -t "${pkgdir}/usr/bin" \
    "src-tauri/target/release/${_pkgname}"
}

pkgver() {
  cd "$_pkgname"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

