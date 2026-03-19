# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=en-croissant
pkgver=0.15.0
pkgrel=1
pkgdesc='Modern chess GUI and analysis tool'
arch=('x86_64')
url='https://github.com/franciscoBSalgueiro/en-croissant'
license=('GPL-3.0-only')
depends=(
  'bzip2'
  'cairo'
  'gdk-pixbuf2'
  'glib2'
  'glibc'

  # https://aur.archlinux.org/packages/en-croissant#comment-1017641
  # https://github.com/tauri-apps/tauri/issues/4642#issuecomment-1643229562
  'gst-plugins-good'

  'gtk3'
  'hicolor-icon-theme'
  'libgcc'
  'libsoup3'
  'openssl'
  'webkit2gtk-4.1'
)
makedepends=('cargo' 'nvm' 'pnpm')
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

sha512sums=('ace5c341c7270ff1d266c5ae80ebf66ff86519b6bdcef6f58707e25ac0f05af8a2a44a015a6ef2ab6d56d9adbe10e8464e678a0075616602687f7cc6a4b577ae'
            'c780d708a0065a47808a115c9f1106f8aa1eb3038496c3cc6cbe1ca3334d7c28bca496a0b309a4e3c5d4814cdaef2fe1950ee249fd10e7d3bb52e6c2330065cd'
            '0ca0416ec4941d0a9194048b7e099c433bdb7f309dd0746e272757f02e5d13bb899090ac390b9fbdd6f075070e5cf54996d63348f5f1cafdc8f5d7d798b92023')

# https://wiki.archlinux.org/title/Node.js_package_guidelines#Using_nvm
_ensure_local_nvm() {
    # let's be sure we are starting clean
    #shellcheck disable=SC2218  # False alarm
    which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
    export NVM_DIR="${srcdir}/.nvm"

    # The init script returns 3 if version specified
    # in ./.nvrc is not (yet) installed in $NVM_DIR
    # but nvm itself still gets loaded ok
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
  cd "${pkgname}-${pkgver}"
  echo >&2 'Applying patch'
  patch -p1 < '../disable-updater.patch'

  _ensure_local_nvm
  # The `store.test.ts` unit test fails on Node.js v25 with the message:
  # _a.getItem is not a function
  echo >&2 'Installing supported Node.js version'
  nvm install lts/krypton

  echo >&2 'Installing npm dependencies'
  pnpm install --frozen-lockfile
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  _ensure_local_nvm
  pnpm build
}

check() {
  cd "${pkgname}-${pkgver}"
  _ensure_local_nvm
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
