# Maintainer: Braulio Oliveira <brauliobo@gmail.com>

pkgname=thorium-browser-updated
pkgver=149.0.7827.114
pkgrel=1
pkgdesc="Chromium fork focused on high performance and security, built from source"
arch=('x86_64')
url="https://github.com/brauliobo/thorium"
license=('BSD-3-Clause')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'desktop-file-utils'
  'expat'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libcups'
  'libffi'
  'libgcc'
  'libgcrypt'
  'libnotify'
  'libpulse'
  'libstdc++'
  'libva'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'libxss'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'pciutils'
  'systemd'
  'systemd-libs'
  'ttf-liberation'
  'xdg-utils'
  'zlib'
)
makedepends=(
  'clang'
  'compiler-rt'
  'git'
  'gn'
  'gperf'
  'java-runtime-headless'
  'lld'
  'ninja'
  'nodejs'
  'npm'
  'patchelf'
  'pipewire'
  'python'
  'python-httplib2'
  'python-pyparsing'
  'python-six'
  'qt6-base'
  'rpm-tools'
  'rsync'
  'rust'
  'rust-bindgen'
)
optdepends=(
  'pipewire: WebRTC desktop sharing under Wayland'
  'kdialog: support for native dialogs in Plasma'
  'gtk4: for --gtk-version=4'
  'qt6-base: Qt support'
  'org.freedesktop.secrets: password storage backend on GNOME, KDE and Xfce'
  'upower: Battery Status API support'
)
provides=('thorium-browser')
conflicts=('thorium-browser' 'thorium-browser-bin' 'thorium-browser-updated-bin')
options=('!lto' '!strip' '!debug')
install="${pkgname}.install"
source=(
  "thorium::git+https://github.com/brauliobo/thorium.git#commit=a18a221cbb9db9e4f5f032051b3ba24b9bfa7ff3"
  "depot_tools::git+https://chromium.googlesource.com/chromium/tools/depot_tools.git"
)
sha256sums=('SKIP' 'SKIP')

_jobs=6

prepare() {
  export CR_DIR="$srcdir/chromium/src"
  export HOME="$srcdir/home"
  export PATH="$srcdir/depot_tools:$PATH"
  export DEPOT_TOOLS_UPDATE=0

  mkdir -p "$HOME"
  ln -sfn "$srcdir/depot_tools" "$HOME/depot_tools"

  cd "$srcdir/thorium"
  ./trunk.sh
  ./version.sh
  ./setup.sh

  cd "$CR_DIR"
  gn gen out/thorium --args="$(
    sed \
      -e 's@^chrome_pgo_phase = .*@chrome_pgo_phase = 0@' \
      -e 's@^pgo_data_path = .*@pgo_data_path = ""@' \
      "$srcdir/thorium/args.gn"
  )"
}

build() {
  export CR_DIR="$srcdir/chromium/src"
  export HOME="$srcdir/home"
  export PATH="$srcdir/depot_tools:$PATH"
  export DEPOT_TOOLS_UPDATE=0
  export NINJA_SUMMARIZE_BUILD=1
  export NINJA_STATUS="[%r processes, %f/%t @ %o/s | %e sec. ] "

  cd "$CR_DIR"
  nice -n 10 ionice -c2 -n7 autoninja -C out/thorium \
    thorium_shell \
    clear_key_cdm \
    chromedriver \
    chrome/installer/linux:strip_chrome_binary \
    chrome/installer/linux:strip_chrome_sandbox \
    chrome/installer/linux:strip_chrome_management_service \
    -j"$_jobs"

  if [[ -f out/thorium/chrome.stripped ]]; then
    ln -f out/thorium/chrome.stripped out/thorium/thorium.stripped
  elif [[ ! -f out/thorium/thorium.stripped ]]; then
    echo "Missing stripped browser binary." >&2
    return 1
  fi

  ln -f out/thorium/chrome_sandbox.stripped out/thorium/thorium_sandbox.stripped
  patchelf --remove-rpath out/thorium/thorium.stripped 2>/dev/null || true
  patchelf --remove-rpath out/thorium/chrome_management_service.stripped 2>/dev/null || true

  cp -f "$srcdir/thorium/thorium_shell/thorium_shell.png" out/thorium/thorium_shell.png
  cp -f "$srcdir/thorium/thorium_shell/thorium.svg" out/thorium/thorium.svg
  cp -f "$srcdir/thorium/thorium_shell/thorium-shell.desktop" out/thorium/thorium-shell.desktop
  cp -f "$srcdir/thorium/thorium_shell/thorium-shell" out/thorium/thorium-shell
  cp -f "$srcdir/thorium/pak_src/binaries/pak" out/thorium/pak
  cp -f "$srcdir/thorium/infra/initial_preferences" out/thorium/initial_preferences
  chmod 755 out/thorium/thorium-shell out/thorium/pak

  if [[ ! -x buildtools/third_party/eu-strip/bin/eu-strip ]] &&
     command -v eu-strip >/dev/null; then
    mkdir -p buildtools/third_party/eu-strip/bin
    ln -sf "$(command -v eu-strip)" buildtools/third_party/eu-strip/bin/eu-strip
  fi

  nice -n 10 ionice -c2 -n7 autoninja -C out/thorium \
    chrome/installer/linux:stable_rpm \
    -j"$_jobs"
}

package() {
  local rpm
  rpm="$srcdir/chromium/src/out/thorium/thorium-browser_${pkgver}_AVX.rpm"
  [[ -f "$rpm" ]] || {
    echo "Unable to find built Thorium RPM" >&2
    return 1
  }

  cd "$srcdir"
  rpm2cpio "$rpm" | bsdtar -xf -

  install -dm755 "$pkgdir/opt"
  mv opt/chromium.org/thorium "$pkgdir/opt/thorium-browser"
  cp -a usr "$pkgdir/"
  cp -a etc "$pkgdir/" 2>/dev/null || true

  rm -rf \
    "$pkgdir/etc/cron.daily" \
    "$pkgdir/opt/thorium-browser/cron" \
    "$pkgdir/usr/share/doc" \
    "$pkgdir/usr/share/menu"

  rm -f \
    "$pkgdir/usr/bin/thorium-browser" \
    "$pkgdir/usr/bin/thorium-browser-stable" \
    "$pkgdir/usr/bin/pak" \
    "$pkgdir/usr/share/man/man1/thorium-browser-stable.1" \
    "$pkgdir/usr/share/man/man1/thorium-browser-stable.1.gz"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/thorium-browser" <<'END'
#!/usr/bin/env bash
set -euo pipefail

name=thorium
flags_file="${XDG_CONFIG_HOME:-$HOME/.config}/${name}-flags.conf"

lines=()
if [[ -f "${flags_file}" ]]; then
  mapfile -t lines < "${flags_file}"
fi

flags=()
for line in "${lines[@]}"; do
  if [[ ! "${line}" =~ ^[[:space:]]*#.* ]] && [[ -n "${line}" ]]; then
    flags+=("${line}")
  fi
done

exec /opt/thorium-browser/thorium-browser "${flags[@]}" "$@"
END

  find "$pkgdir/usr/share/applications" -name '*.desktop' -type f -exec \
    sed -i 's@/usr/bin/thorium-browser-stable@/usr/bin/thorium-browser@g' {} +

  if [[ -f "$pkgdir/usr/bin/thorium-shell" ]]; then
    sed -E -i 's@/opt/chromium.org/thorium/@/opt/thorium-browser/@g' \
      "$pkgdir/usr/bin/thorium-shell"
  fi

  if [[ -f "$pkgdir/usr/share/gnome-control-center/default-apps/thorium-browser.xml" ]]; then
    sed -E -i 's@/opt/chromium.org/thorium/@/opt/thorium-browser/@g' \
      "$pkgdir/usr/share/gnome-control-center/default-apps/thorium-browser.xml"
  fi

  chmod 4755 "$pkgdir/opt/thorium-browser/chrome-sandbox"

  if [[ -f "$pkgdir/opt/thorium-browser/product_logo_256.png" ]]; then
    install -Dm644 "$pkgdir/opt/thorium-browser/product_logo_256.png" \
      "$pkgdir/usr/share/icons/hicolor/256x256/apps/thorium-browser.png"
  fi
  if [[ -f "$pkgdir/opt/thorium-browser/thorium_shell.png" ]]; then
    install -Dm644 "$pkgdir/opt/thorium-browser/thorium_shell.png" \
      "$pkgdir/usr/share/icons/hicolor/256x256/apps/thorium-shell.png"
  fi

  find "$pkgdir" -type d -exec chmod 755 {} +
}
