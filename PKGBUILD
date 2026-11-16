# Maintainer: Ovenoboyo <your-email@example.com>
pkgname=bw-ssh-agent-git
_pkgname=bw-ssh-agent
pkgver=r11.g940f710
pkgrel=1
pkgdesc="Hardened SSH agent backed by Bitwarden CLI with Polkit and Pinentry support"
arch=('x86_64' 'aarch64')
url="https://github.com/Ovenoboyo/bw-cli-ssh-agent"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=(
  'bitwarden-cli'
  'polkit'
)
optdepends=(
  'pinentry: native GUI/curses password dialogs'
  'gnome-keyring: libsecret session persistence'
  'kwallet: KDE Wallet session persistence'
  'zenity: GTK fallback password dialog'
  'kdialog: KDE fallback password dialog'
)
makedepends=(
  'git'
  'go'
)
source=("${_pkgname}::git+https://github.com/Ovenoboyo/bw-cli-ssh-agent.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  export GOPATH="${srcdir}/go"
  export GOFLAGS="-modcacherw"
  go mod download -x
}

build() {
  cd "${srcdir}/${_pkgname}"
  export CGO_ENABLED=0
  export GOPATH="${srcdir}/go"
  export GOFLAGS="-trimpath -mod=readonly -modcacherw"

  go build -ldflags="-s -w" -o "${_pkgname}" ./cmd
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 /dev/stdin "${pkgdir}/usr/lib/systemd/user/bw-ssh-agent.service" << 'EOF'
[Unit]
Description=Bitwarden CLI SSH Agent
Documentation=https://github.com/Ovenoboyo/bw-cli-ssh-agent
After=graphical-session.target

[Service]
Type=simple
ExecStart=/usr/bin/bw-ssh-agent
ExecReload=/bin/kill -HUP $MAINPID
Restart=on-failure
RestartSec=2

[Install]
WantedBy=default.target
EOF

  install -Dm644 /dev/stdin "${pkgdir}/usr/lib/environment.d/90-bw-ssh-agent.conf" << 'EOF'
SSH_AUTH_SOCK=${XDG_RUNTIME_DIR}/bw-ssh-agent.sock
EOF

  if [ -f LICENSE ]; then
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
}
