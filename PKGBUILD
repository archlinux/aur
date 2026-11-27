# Maintainer: hotline1337 <denuvo at tuta dot io>

pkgname=openbot
pkgver=0.81.0
pkgrel=1
pkgdesc="Local-first desktop workspace for persistent AI teammates."
arch=("x86_64" "aarch64")
url="https://openbot.run"
license=("PolyForm-Noncommercial-1.0.0")
depends=(
  "alsa-lib"
  "at-spi2-core"
  "cairo"
  "dbus"
  "expat"
  "gcc-libs"
  "glib2"
  "glibc"
  "gtk3"
  "hicolor-icon-theme"
  "libcups"
  "libsecret"
  "libx11"
  "libxcb"
  "libxcomposite"
  "libxdamage"
  "libxext"
  "libxfixes"
  "libxi"
  "libxkbcommon"
  "libxrandr"
  "libxss"
  "mesa"
  "nspr"
  "nss"
  "pango"
  "systemd-libs"
  "xdg-utils"
)
makedepends=(
  "7zip"
  "desktop-file-utils"
  "imagemagick"
)
optdepends=(
  "bubblewrap: sandbox for Codex agents"
  "git: repository cloning for Hermes agent installer"
  "gnome-keyring: Secret Service storage when no other provider is running"
  "libappindicator: system tray integration"
  "libatomic: Node.js runtime for Hermes agent installer"
  "libevdev: upstream x86_64 remote-desktop runtime"
  "libnotify: desktop notifications"
  "libpulse: upstream x86_64 remote-desktop runtime"
  "libva: upstream x86_64 remote-desktop runtime"
  "libxtst: upstream x86_64 remote-desktop runtime"
  "nodejs: Local scripts API command-line client"
  "numactl: upstream x86_64 remote-desktop runtime"
  "socat: workspace isolation for Claude agents"
)
provides=(
  "openbot=${pkgver}"
  "openbot-desktop=${pkgver}"
  "openbot-cli=${pkgver}"
  "openbot-bin=${pkgver}"
)
conflicts=(
  "openbot-bin"
  "openbot-desktop"
  "openbot-cli"
)
options=("!strip" "!debug")

_github="https://github.com/nightly-labs/openbot"
_raw="https://raw.githubusercontent.com/nightly-labs/openbot"
_icons=(16 22 24 32 48 64 128 256 512)

source=(
  "openbot-LICENSE-${pkgver}::${_raw}/v${pkgver}/LICENSE"
  "openbot-NOTICE-${pkgver}::${_raw}/v${pkgver}/NOTICE"
)
source_x86_64=(
  "OpenBot-${pkgver}-x86_64.AppImage::${_github}/releases/download/v${pkgver}/OpenBot-${pkgver}-x86_64.AppImage"
)
source_aarch64=(
  "OpenBot-${pkgver}-arm64.AppImage::${_github}/releases/download/v${pkgver}/OpenBot-${pkgver}-arm64.AppImage"
)
noextract=(
  "OpenBot-${pkgver}-x86_64.AppImage"
  "OpenBot-${pkgver}-arm64.AppImage"
)
b2sums=('be7e2f7213f7ff6da53ad0557d9b4cd8028a85295f79efeec460e9a0d373612f241bf9cdfa3084181e4c40f36cbcf77a4ffd6241d454f5f20cf3c2446036f2bf'
        'e81ef6a7200ae602399e4f7040d91018179f253f31fc739b4e784e5a0ffe83e227f48a779956159da913a9615f1962a2d411499197174721c1838852165934b0')
b2sums_x86_64=('48b7749e053a43da450c3596c9f3d6136bc2f33981df70f84e38ca1792bd760ec5f930fb77d0bbcdc496101c0ada98b0d324cfb29839f1b315f2334da0522f88')
b2sums_aarch64=('a8a02d9c560cad829105931d5253047a43d0dbbe8551545fc07f08b4ff208b2429a7da894918432d8d51d626a9c4a2ab8cbec5a22b7bff0ac104d8f3fe422a13')

prepare() {
  local -A _arch_map=([x86_64]="x86_64" [aarch64]="arm64")
  local -r _image_arch="${_arch_map[${CARCH}]:?unsupported architecture: ${CARCH}}"

  rm -rf -- "app"
  7z x -y -bd -bso0 -o"app" -- "OpenBot-${pkgver}-${_image_arch}.AppImage"

  # FreeDesktop entry conformance: sanitize Exec key
  desktop-file-edit --set-exec="openbot %U" "app/openbot.desktop"

  # Asynchronously scale upstream master icon into standard hicolor buckets
  local -i _size
  for _size in "${_icons[@]}"; do
    magick "app/openbot.png" -resize "${_size}x${_size}" -strip "PNG32:icon-${_size}.png" &
  done
  wait

  # Prune upstream AppImage runtime artifacts
  rm -rf -- app/{usr,AppRun,.DirIcon,openbot.png}
}

check() {
  # Specification conformance: validate modified desktop entry
  desktop-file-validate "app/openbot.desktop"

  # Invariant: Chromium sandbox must remain intact
  ! grep -qF -- '--no-sandbox' "app/openbot.desktop" || return 1

  local -A _driver_map=([x86_64]="x64" [aarch64]="arm64")
  local -r _cua_arch="${_driver_map[${CARCH}]:?unsupported architecture: ${CARCH}}"

  local -a _executables=(
    "app/openbot"
    "app/resources/cua-driver/linux/${_cua_arch}/cua-driver"
  )
  local -a _payloads=(
    "app/resources/app.asar"
    "app/resources/cli/openbot-cli.mjs"
    "app/resources/voice/runtime/libonnxruntime.so"
    "app/resources/voice/runtime/sherpa-onnx.node"
  )

  local _bin
  for _bin in "${_executables[@]}"; do
    [[ -x "${_bin}" ]] || {
      printf >&2 "Assertion failed: executable binary missing or non-executable: %s\n" "${_bin}"
      return 1
    }
  done

  local _payload
  for _payload in "${_payloads[@]}"; do
    [[ -s "${_payload}" ]] || {
      printf >&2 "Assertion failed: critical payload missing or zero-sized: %s\n" "${_payload}"
      return 1
    }
  done

  local -i _size
  for _size in "${_icons[@]}"; do
    [[ -s "icon-${_size}.png" ]] || {
      printf >&2 "Assertion failed: missing generated icon: icon-%d.png\n" "${_size}"
      return 1
    }
  done
}

package() {
  install -dm755 "${pkgdir}/opt/openbot"
  install -dm755 "${pkgdir}/usr/bin"

  # Application bundle
  cp -dr --preserve=mode,timestamps app/. "${pkgdir}/opt/openbot/"

  # Desktop integration
  install -Dm644 "app/openbot.desktop" "${pkgdir}/usr/share/applications/openbot.desktop"

  # Standard hicolor icons
  local -i _size
  for _size in "${_icons[@]}"; do
    install -Dm644 "icon-${_size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/openbot.png"
  done

  # Licenses
  install -Dm644 "openbot-LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "openbot-NOTICE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"

  # Prune redundant desktop file from application directory
  rm -f -- "${pkgdir}/opt/openbot/openbot.desktop"

  # Single-pass permission normalization for directories, shared objects, and native addons
  find "${pkgdir}/opt/openbot" \
    -type d -exec chmod 755 -- {} + \
    -o -type f \( -name '*.so*' -o -name '*.node' \) -exec chmod 755 -- {} +

  # SUID sandbox requirements for Chromium zygote process
  chmod 4755 -- "${pkgdir}/opt/openbot/chrome-sandbox"

  # CLI helper executable permissions
  chmod 755 -- "${pkgdir}/opt/openbot/resources/cli/openbot-cli.mjs"

  # Binary and CLI symlinks
  ln -sf -- /opt/openbot/resources/cli/openbot-cli.mjs "${pkgdir}/usr/bin/openbot-cli"
  ln -sf -- /opt/openbot/openbot "${pkgdir}/usr/bin/openbot"
  ln -sf -- /opt/openbot/openbot "${pkgdir}/usr/bin/openbot-desktop"

  # User update preferences
  local _config_dir="${XDG_CONFIG_HOME:-$HOME/.config}/OpenBot"
  mkdir -p "${_config_dir}"
  cat > "${_config_dir}/openbot-update-preference-v1.json" << 'EOF'
{"version":1,"autoDownload":false,"allowRemoteUpdates":false,"autoInstall":false}
EOF
}
