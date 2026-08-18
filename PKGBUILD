pkgname=simplex-chat
pkgver=7.0.1
pkgrel=1
pkgdesc='The first messaging network operating without user identifiers of any kind (CLI client)'
arch=('x86_64')
url='https://github.com/simplex-chat/simplex-chat'
license=('AGPL-3.0-only')
depends=(
  'ca-certificates'
  'gmp'
  'openssl'
  'zlib'
)

# Arch cabal-install package brings in a bunch of haskell-* libraries,
# and cabal build fails because of these
makedepends=(
  'ghcup-hs-bin'
  'git'
  'pkgconf'
)
conflicts=(
  'simplex-chat-bin'
  'simplex-chat-git'
)
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
  '0d14c7d9a47f7b48a84023cf48c7a840d136da81a42d80579d0b0da25ef6956d'
)
options=(
  '!lto'
  '!debug'
)

_ghcver=9.6.3

_setup_env() {
  export HOME="${srcdir}/.home"
  export CABAL_DIR="${srcdir}/.cabal"
  export XDG_CACHE_HOME="${srcdir}/.cache"
  export XDG_CONFIG_HOME="${srcdir}/.config"
  export PATH="${HOME}/.ghcup/bin:${HOME}/.cabal/bin:${PATH}"

  mkdir -p "${HOME}" "${CABAL_DIR}" "${XDG_CACHE_HOME}" "${XDG_CONFIG_HOME}"
}

_setup_toolchain() {
  _setup_env

  if [[ ! -x "${HOME}/.ghcup/bin/ghc" ]] || [[ "$("${HOME}/.ghcup/bin/ghc" --numeric-version 2>/dev/null || true)" != "${_ghcver}" ]]; then
    ghcup install ghc "${_ghcver}"
    ghcup set ghc "${_ghcver}"
  fi

  if [[ ! -x "${HOME}/.ghcup/bin/cabal" ]]; then
    ghcup install cabal recommended
    ghcup set cabal recommended
  fi

  cabal user-config init --force >/dev/null 2>&1 || true
}

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cat >cabal.project.local <<'EOF'
ignore-project: False
package direct-sqlcipher
    flags: +openssl
EOF

  cat >"${srcdir}/${pkgname}.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=SimpleX Chat
Comment=The first messaging network operating without user identifiers of any kind
Exec=simplex-chat
Icon=simplex-chat
Terminal=true
Categories=Network;Chat;InstantMessaging;
Keywords=chat;messaging;privacy;
EOF
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  _setup_toolchain

  cabal clean
  cabal update
  cabal build -j
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  _setup_toolchain

  install -Dm755 "$(cabal list-bin simplex-chat)" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "media-logos/simplex-symbol-dark.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
