# Maintainer: LightDot <lightdot -a-t- server.si>

pkgname=gemini-openai-proxy-git
_pkgname=gemini-openai-proxy
pkgver=r13.27d588c
pkgrel=1
pkgdesc="Gemini CLI wrapper to serve Gemini models through an OpenAI-compatible API."
arch=('any')
url="https://github.com/Brioch/gemini-openai-proxy"
license=('MIT')
depends=('nodejs' 'npm' 'ts-node')
optdepends=('gemini-cli')
makedepends=('git')
provides=('gemini-openai-proxy')
conflicts=('gemini-openai-proxy')
install=${_pkgname}.install
source=("git+https://github.com/Brioch/gemini-openai-proxy.git"
        "${_pkgname}.service")
sha256sums=('SKIP'
            'ba6fcee1f4e2526b17f1ba1b0b276bc114b5b1507d5502ac973a34cdfa06b59f')

pkgver() {
  cd ${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${_pkgname}
  npm i --omit=dev
}

package() {
  cd ${_pkgname}
  install -dm755 "${pkgdir}/usr/share/${_pkgname}"
  cp -pr . "${pkgdir}/usr/share/${_pkgname}/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  # Environment file example
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/${_pkgname}/${_pkgname}.env" <<'EOF'
PORT=11434

# can be any of 'oauth-personal', 'gemini-api-key', 'vertex-ai'. Use oauth-personal for free access to Gemini 2.5 Pro by logging in to a Google account.
AUTH_TYPE='oauth-personal'

# API key is only used with AUTH_TYPE='gemini-api-key'
GEMINI_API_KEY=

# Use 'gemini-2.5-flash' or 'gemini-2.5-pro'. Leave empty to let a client choose its preferred model.
MODEL=
EOF

  # Wrapper script
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${_pkgname}" <<'EOF'
#!/bin/sh
exec /usr/bin/npm start --prefix /usr/share/gemini-openai-proxy
EOF

  # User level systemd service
  install -Dm644 "${srcdir}/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/user/${_pkgname}.service"
}
