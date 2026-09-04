# Maintainer: Loopwire contributors
pkgname=loopwire
pkgver=0.1.0
pkgrel=1
pkgdesc="Linux virtual audio routing application"
arch=("x86_64" "aarch64")
url="https://github.com/sandwichfarm/loopwire"
license=("MIT" "Apache-2.0")
conflicts=("loopwire-bin" "loopwire-git")
depends=("webkit2gtk-4.1" "nodejs>=22.12.0" "pipewire" "wireplumber")
makedepends=("pnpm" "rust")
optdepends=(
  "pipewire-pulse: PulseAudio compatibility"
  "jack2: JACK bridge diagnostics"
  "alsa-utils: ALSA diagnostics"
)
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
  "LICENSE-MIT"
)
sha256sums=(
  "faed5138b8567ba5ae2091d9c0a5bde3d569bda1bfd34533f24b4c84b5e9bee0"
  "9d07730c412aa794131924cb041c098fcd64025176b57da63b5ba62cd6571f79"
)

prepare() {
  cd "${pkgname}-${pkgver}"
  pnpm install --frozen-lockfile
}

build() {
  cd "${pkgname}-${pkgver}"
  pnpm --filter @loopwire/core build
  pnpm --filter @loopwire/audio-host build

  local release_config
  release_config="$(printf '{"version":"%s"}' "${pkgver}")"
  pnpm --filter @loopwire/desktop exec tauri build --no-bundle --config "${release_config}"

  SOURCE_DATE_EPOCH="${SOURCE_DATE_EPOCH:-0}" bash scripts/package-release.sh \
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

  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm644 packaging/common/loopwire.desktop \
    "${pkgdir}/usr/share/applications/loopwire.desktop"
  install -Dm644 apps/desktop/src-tauri/icons/icon.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/loopwire.svg"
  install -Dm644 "${srcdir}/LICENSE-MIT" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
