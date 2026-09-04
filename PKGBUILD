# Maintainer: Loopwire contributors
pkgname=loopwire-git
pkgver=0.1.0.r8.g007e47e
pkgrel=1
pkgdesc="Linux virtual audio routing application (development version)"
arch=("x86_64" "aarch64")
url="https://github.com/sandwichfarm/loopwire"
license=("MIT" "Apache-2.0")
provides=("loopwire=${pkgver}")
conflicts=("loopwire")
depends=("webkit2gtk-4.1" "nodejs>=22.12.0" "pipewire" "wireplumber")
makedepends=("git" "pnpm" "rust")
optdepends=(
  "pipewire-pulse: PulseAudio compatibility"
  "jack2: JACK bridge diagnostics"
  "alsa-utils: ALSA diagnostics"
)
source=(
  "loopwire::git+${url}.git#branch=master"
  "LICENSE-MIT"
)
sha256sums=(
  "SKIP"
  "9d07730c412aa794131924cb041c098fcd64025176b57da63b5ba62cd6571f79"
)

pkgver() {
  cd loopwire
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd loopwire
  pnpm install --frozen-lockfile
}

build() {
  cd loopwire
  pnpm --filter @loopwire/core build
  pnpm --filter @loopwire/audio-host build

  local app_version source_epoch
  app_version="${pkgver/.r/-dev.}"
  source_epoch="$(git log -1 --format=%ct)"
  pnpm --filter @loopwire/desktop exec tauri build --no-bundle \
    --config "$(printf '{"version":"%s"}' "${app_version}")"

  SOURCE_DATE_EPOCH="${source_epoch}" bash scripts/package-release.sh \
    --binary apps/desktop/src-tauri/target/release/loopwire \
    --version "${pkgver}" \
    --arch "${CARCH}" \
    --output-dir "${srcdir}/release"
}

package() {
  local release_root="${srcdir}/release-root"
  mkdir -p "${release_root}"
  tar -xzf "${srcdir}/release/loopwire-linux-${CARCH}.tar.gz" -C "${release_root}"

  install -Dm755 "${release_root}/loopwire" "${pkgdir}/usr/bin/loopwire"
  install -Dm755 "${release_root}/loopwire-dsp-provider" "${pkgdir}/usr/bin/loopwire-dsp-provider"
  install -Dm755 "${release_root}/loopwire-jack-ports" "${pkgdir}/usr/bin/loopwire-jack-ports"
  install -Dm755 "${release_root}/loopwire-detect-audio" "${pkgdir}/usr/bin/loopwire-detect-audio"
  install -dm755 "${pkgdir}/usr/lib/loopwire"
  cp -R "${release_root}/libexec/loopwire/." "${pkgdir}/usr/lib/loopwire/"
  find "${pkgdir}/usr/lib/loopwire" -type d -exec chmod 0755 {} +
  find "${pkgdir}/usr/lib/loopwire" -type f -exec chmod 0644 {} +
  chmod 0755 "${pkgdir}/usr/lib/loopwire/loopwire-gui"

  cd "${srcdir}/loopwire"
  install -Dm644 packaging/common/loopwire.desktop \
    "${pkgdir}/usr/share/applications/loopwire.desktop"
  install -Dm644 apps/desktop/src-tauri/icons/icon.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/loopwire.svg"
  install -Dm644 "${srcdir}/LICENSE-MIT" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
