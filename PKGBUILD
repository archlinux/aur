# Maintainer: Alex Potapenko <opotapenko@gmail.com>

pkgname=patreon-dl-gui
pkgver=2.10.0
pkgrel=1
pkgdesc='Patreon downloader with a graphical user interface'
url='https://github.com/patrickkfkan/patreon-dl-gui'
arch=('x86_64')
license=('MIT')

_nodever=24.20.0

depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'expat'
  'gcc-libs'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libcups'
  'libnotify'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'systemd-libs'
  'xdg-utils'
)
makedepends=(
  'git'
  'python'
  'imagemagick'
)
optdepends=(
  'libpulse: PulseAudio audio support'
  'gvfs: trash and file-manager integration'
  'kde-cli-tools: KDE trash integration'
  'trash-cli: command-line trash support'
)

options=('!strip' '!debug')

source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "no-target-identified-url-fallback.diff"
    "https://nodejs.org/dist/v${_nodever}/node-v${_nodever}-linux-x64.tar.xz"
    "${pkgname}.desktop"
)

noextract=("node-v${_nodever}-linux-x64.tar.xz")

sha256sums=('48b94bb10c2f5adcf876c3d876f38d0b4096b03abce5bf4571ec9a10fdf76f52'
            '2371f87a070ba06a5eca5c954c5ac6473af21f048296fa95a7260f25a00ca9f0'
            '2f2c0da162318f0de47665410c7c8c2ed3d36c8f3105de4bbc61176c70a7cbf2'
            'ee44697fe8dcaf4a9e198af8d86e4b2f35c594435d97a5a823440a4f34c6a3ae')

prepare() {
    bsdtar -xf "node-v${_nodever}-linux-x64.tar.xz"

    cd "${pkgname}-${pkgver}"

    # https://github.com/patrickkfkan/patreon-dl-gui/pull/88
    # Fall back to the currently loaded browser URL when identifying the
    # download target from the Patreon page data fails.
    patch -Np1 -i "${srcdir}/no-target-identified-url-fallback.diff"
}

build() {
    export PATH="${srcdir}/node-v${_nodever}-linux-x64/bin:${PATH}"

    # Keep every download the build performs inside $srcdir.
    export npm_config_cache="${srcdir}/npm-cache"
    export ELECTRON_CACHE="${srcdir}/electron-cache"
    export PKG_CACHE_PATH="${srcdir}/pkg-cache"

    # @electron/node-gyp is locked to an ssh:// remote, which needs credentials
    # nobody building a package has. Fetch it over https instead.
    export GIT_CONFIG_COUNT=1
    export GIT_CONFIG_KEY_0='url.https://github.com/.insteadOf'
    export GIT_CONFIG_VALUE_0='ssh://git@github.com/'

    cd "${pkgname}-${pkgver}"

    npm ci
    npm run package
}

package() {
    cd "${pkgname}-${pkgver}"

    local _appdir="/usr/lib/${pkgname}"

    install -dm755 "${pkgdir}${_appdir}"
    cp -a "out/${pkgname}-linux-x64/." "${pkgdir}${_appdir}/"

    chmod 755 "${pkgdir}${_appdir}"

    # Some bundled modules ship prebuilt binaries for every platform they
    # support. Keep only the one this package is built for.
    local _prebuilds
    while IFS= read -r -d '' _prebuilds; do
        find "${_prebuilds}" -mindepth 1 -maxdepth 1 -type d \
            ! -name linux-x64 -exec rm -rf {} +
    done < <(find "${pkgdir}${_appdir}/resources/node_modules" \
        -type d -name prebuilds -print0)

    # Chromium's setuid sandbox helper.
    chmod 4755 "${pkgdir}${_appdir}/chrome-sandbox"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "${_appdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 "${srcdir}/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "src/resources/packaging/${pkgname}-server-console.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}-server-console.desktop"

    install -dm755 "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
    magick assets/electron.ico \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png"

    # Upstream ships no licence file of its own; the bundled Electron runtime
    # carries the MIT text the project is released under.
    install -Dm644 "${pkgdir}${_appdir}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 assets/attributions.txt \
        "${pkgdir}/usr/share/licenses/${pkgname}/attributions.txt"
}
