# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=en-croissant
pkgver=0.10.0
pkgrel=1
pkgdesc='Modern chess GUI and analysis tool'
arch=('x86_64')
url='https://github.com/franciscoBSalgueiro/en-croissant'
license=('GPL-3.0-only')
depends=(
  'cairo'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libsoup'
  'openssl'
  'pango'
  'webkit2gtk'
)
makedepends=('cargo' 'pnpm')
optdepends=(
  'stockfish: chess engine that can be integrated via Engines » Add New » Local'
)
conflicts=(
  'en-croissant-appimage'
  'en-croissant-bin'
)
options=(
  # Fixes `/usr/lib/libsqlite3.so.0: error adding symbols: DSO missing from command line`
  '!lto'
)

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/franciscoBSalgueiro/en-croissant/archive/v${pkgver}.tar.gz"
  'disable-updater.patch'
  'en-croissant.desktop'
)

sha512sums=(
  'f5c72be4efa7a12e14cde95f9a8b93417cb0073e681f9e35ba01fb4b92962284948ed9bdeff648f59355a0ac03e3b509c068a32835388e639a943d8114f6785e'
  'fe5dbb7df6b25d9c1512bf9e38dc4eb8096d5c9bcafe328f7e55fb42064695234016e3baed7008bded04501494e149bcbb34ad5ebbaa885eda880497d8cd208e'
  '0ca0416ec4941d0a9194048b7e099c433bdb7f309dd0746e272757f02e5d13bb899090ac390b9fbdd6f075070e5cf54996d63348f5f1cafdc8f5d7d798b92023'
)

prepare() {
  cd "${pkgname}-${pkgver}"
  echo >&2 'Applying patch'
  patch -p1 < '../disable-updater.patch'

  echo >&2 'Installing npm dependencies'
  pnpm install --frozen-lockfile
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  pnpm build
}

check() {
  cd "${pkgname}-${pkgver}"
  pnpm test
}

package() {
  cd "${pkgname}-${pkgver}"

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    'LICENSE'

  echo >&2 'Packaging the README'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    'README.md'

  echo >&2 'Packaging the desktop file'
  install -D -m 644 -t "${pkgdir}/usr/share/applications" \
    '../en-croissant.desktop'

  echo >&2 'Packaging the icon'
  install -D -m 644 -T \
    'src-tauri/icons/icon.png' \
    "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  echo >&2 'Packaging the executable'
  install -D -m 755 -t "${pkgdir}/usr/bin" \
    "src-tauri/target/release/${pkgname}"
}
