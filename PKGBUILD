# Maintainer: Osilvfe <osilvfe@gmail.com>

pkgname=yaqmc-git
pkgver=0.1.1.r5.gb4c6531
pkgrel=1
pkgdesc='Unofficial QQ Music client (git version)'
arch=('x86_64' 'aarch64')
url='https://github.com/YAQMC/YAQMC'
license=('GPL-3.0-or-later')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'expat'
  'glib2'
  'gtk3'
  'hicolor-icon-theme'
  'libcups'
  'libnotify'
  'libsecret'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'libxss'
  'libxtst'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'systemd-libs'
  'xdg-utils'
)
optdepends=('libayatana-appindicator: system tray support')
makedepends=(
  'git'
  'nodejs'
  'npm'
  'pkgconf'
  'python'
  'rust'
)
provides=('yaqmc')
conflicts=('yaqmc' 'yaqmc-bin')
# makepkg's default -flto=auto breaks aws-lc-sys static linking with lld.
# Cargo still applies the upstream release profile LTO settings independently.
options=('!strip' '!debug' '!lto')
source=(
  "${pkgname}::git+https://github.com/YAQMC/YAQMC.git"
  'yaqmc.desktop'
)
sha256sums=(
  'SKIP'
  '25a56522c4de0ecc762d91f43335a3ffb6e93ea8466ccbe37ed730204a76a851'
)

pkgver() {
  cd "${pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

prepare() {
  cd "${pkgname}"

  export npm_config_cache="${srcdir}/npm-cache"
  npm ci --engine-strict=false --no-audit --no-fund --replace-registry-host=always

  export CARGO_HOME="${srcdir}/cargo-home"
  cargo fetch --locked
}

build() {
  cd "${pkgname}"

  local _electron_arch
  case "$CARCH" in
    x86_64) _electron_arch=x64 ;;
    aarch64) _electron_arch=arm64 ;;
    *) exit 1 ;;
  esac

  export npm_config_cache="${srcdir}/npm-cache"
  export CARGO_HOME="${srcdir}/cargo-home"
  export ELECTRON_CACHE="${srcdir}/electron-cache"
  export RUSTFLAGS="${RUSTFLAGS:+${RUSTFLAGS} }--remap-path-prefix=${CARGO_HOME}=/usr/src/cargo --remap-path-prefix=${srcdir}=/usr/src/${pkgname}"
  export YAQMC_BUILD_PROFILE=production
  export CARGO_PROFILE_RELEASE_LTO=true
  export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1

  cargo build -p yaqmc-core --release --locked
  node scripts/stage-core.mjs --profile release
  npm run ci:frontend-build
  npm run build -w @yaqmc/desktop

  (
    cd apps/desktop
    ../../node_modules/.bin/electron-builder \
      --projectDir . \
      --config electron-builder.yml \
      --dir "--${_electron_arch}" \
      --publish never
  )
}

package() {
  cd "${pkgname}"

  local _unpacked _size
  _unpacked=$(find release-electron -maxdepth 1 -type d -name '*-unpacked' -print -quit)
  if [[ -z "${_unpacked}" ]]; then
    echo 'electron-builder did not produce an unpacked application directory' >&2
    exit 1
  fi

  install -d "${pkgdir}/opt/yaqmc"
  cp -a "${_unpacked}/." "${pkgdir}/opt/yaqmc/"

  install -d "${pkgdir}/usr/bin"
  ln -s /opt/yaqmc/yaqmc "${pkgdir}/usr/bin/yaqmc"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/yaqmc.desktop" \
    "${pkgdir}/usr/share/applications/org.yaqmc.desktop"

  for _size in 32x32 64x64 128x128; do
    install -Dm644 "apps/desktop/resources/${_size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/yaqmc.png"
  done
  install -Dm644 apps/desktop/resources/128x128@2x.png \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/yaqmc.png"
  install -Dm644 apps/desktop/resources/icon.png \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/yaqmc.png"

  chmod 0755 "${pkgdir}/opt/yaqmc/chrome-sandbox"
}
