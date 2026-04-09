# Maintainer: Omer Elbushra <omaralbushra99@gmail.com>

pkgname=agenthub-bin
_pkgname=agenthub
pkgver=0.1.0
pkgrel=1
pkgdesc='Multi-agent conversation hub with an Electron desktop shell and bundled Next.js backend (prebuilt binary)'
arch=('x86_64')
url='https://github.com/Albaloola/AgentHub'
license=('Apache-2.0')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'gtk3'
  'libdrm'
  'libxkbcommon'
  'libnotify'
  'libsecret'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'hicolor-icon-theme'
  'xdg-utils'
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}" "${_pkgname}-git")
options=('!strip' '!debug')
source_x86_64=(
  "${_pkgname}-${pkgver}-linux-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x86_64.tar.gz"
  'agenthub.sh'
  'agenthub.desktop'
)
sha256sums_x86_64=(
  'bb650013838d4968ab9994071a8ae5f70522b8846f70ccef7da24edbae84c7fc'
  'SKIP'
  'SKIP'
)

package() {
  cd "${srcdir}"

  install -dm755 "${pkgdir}/opt/${_pkgname}"
  # The release tarball is expected to contain an unpacked linux-unpacked
  # tree at its root (produced via `electron-builder --linux --dir` and
  # packaged with `tar -C release/linux-unpacked -czf ...`).
  cp -a linux-unpacked/. "${pkgdir}/opt/${_pkgname}/"

  install -Dm755 "${srcdir}/agenthub.sh" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/agenthub.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # Install scalable icon from the unpacked app resources.
  if [[ -f "${pkgdir}/opt/${_pkgname}/resources/app/public/globe.svg" ]]; then
    install -Dm644 "${pkgdir}/opt/${_pkgname}/resources/app/public/globe.svg" \
      "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
  fi

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  cat > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<'EOF'
AgentHub is distributed under the Apache License, Version 2.0.
The full text is available at https://www.apache.org/licenses/LICENSE-2.0
and is referenced in the upstream README.md.
EOF

  if [[ -f "${pkgdir}/opt/${_pkgname}/chrome-sandbox" ]]; then
    chmod 4755 "${pkgdir}/opt/${_pkgname}/chrome-sandbox"
  fi
}
