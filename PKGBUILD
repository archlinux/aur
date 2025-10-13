

_pkgname="fchat-horizon"
pkgname="${_pkgname}-git"
pkgver=1.34.0.beta.1.r8.gbd055e8
_pkgsrc="Horizon"
pkgrel=1
pkgdesc="Horizon (F-Chat) Electron client - development snapshot using system Electron runtime"
arch=('any')
url="https://github.com/Fchat-Horizon/Horizon"
license=('GPL3')

depends=(
  electron
  libnotify
  libsecret
  libappindicator-gtk3
)
makedepends=(git nodejs pnpm)
optdepends=('xdg-utils: open URLs with default handlers')

conflicts=( "${_pkgname}" )
provides=( "${_pkgname}=${pkgver%%.r*}" 'fchat=3' )

source=("${_pkgsrc}::git+${url}.git#branch=development")
sha256sums=('SKIP')
: "${_electron_dist:=/usr/lib/electron}"

prepare() {
  cd "${_pkgsrc}"
  local _electron_version
  _electron_version="$(<"${_electron_dist}/version")"
  sed -E -i "s#(\"electron\"[[:space:]]*:[[:space:]]*\")([^\"]+)(\")#\1${_electron_version}\3#" package.json || true
  sed -E -i "s#(\"electron\"[[:space:]]*:[[:space:]]*\")([^\"]+)(\")#\1${_electron_version}\3#" electron/package.json || true
}

pkgver() {
  cd "${_pkgsrc}"
  git describe --long --tags --abbrev=7 2>/dev/null \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
    || printf '0.r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  export HOME="${srcdir}/.home"
  export XDG_CACHE_HOME="${srcdir}/.cache"
  export XDG_CONFIG_HOME="${srcdir}/.config"
  export XDG_DATA_HOME="${srcdir}/.data"
  export XDG_STATE_HOME="${srcdir}/.state"

  cd "${_pkgsrc}"
  pnpm install --frozen-lockfile || pnpm install
  cd electron
  pnpm install --frozen-lockfile || pnpm install
  pnpm run webpack:prod
  pnpm -c exec "electron-builder --linux dir -c.electronDist=${_electron_dist} -c.electronVersion=$(<${_electron_dist}/version)" || \
    npx electron-builder --linux dir -c.electronDist="${_electron_dist}" -c.electronVersion="$(<${_electron_dist}/version)"
}

package() {
  cd "${_pkgsrc}/electron"

  install -d "${pkgdir}/usr/lib/${_pkgname}"
  cp -a dist/linux-unpacked/resources "${pkgdir}/usr/lib/${_pkgname}/"

  install -d "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/${_pkgname}" <<'EOF'
#!/bin/bash
exec /usr/bin/electron /usr/lib/fchat-horizon/resources/app.asar "$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/${_pkgname}"

  install -d "${pkgdir}/usr/share/applications"
  cat > "${pkgdir}/usr/share/applications/${_pkgname}.desktop" <<'EOD'
[Desktop Entry]
Name=Horizon (F-Chat)
Comment=The F-Chat Horizon Client (development)
Exec=fchat-horizon
Terminal=false
Type=Application
Icon=fchat-horizon
Categories=Network;Chat;
StartupWMClass=Horizon
EOD

  install -d "${pkgdir}/usr/share/pixmaps"
  install -m644 build/icon.png "${pkgdir}/usr/share/pixmaps/fchat-horizon.png"

  install -Dm644 "${srcdir}/${_pkgsrc}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
