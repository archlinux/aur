# Maintainer: EduHoff <ehcs.business@proton.me>
pkgname=battle-cats-normal-rolls-git
_pkgname=battle-cats-normal-rolls
pkgver=r22.e155d12
pkgrel=1
pkgdesc="Local Battle Cats normal seed tracking server with high-performance Rust seeker"
arch=('x86_64' 'aarch64')
url="https://github.com/EduHoff/battle-cats-normal-rolls"
license=('AGPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'curl')
optdepends=('zenity')
makedepends=('git' 'cargo')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
b2sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgname}"
  export CARGO_HOME="${srcdir}/cargo-home"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${_pkgname}"
  export CARGO_HOME="${srcdir}/cargo-home"
  cargo build --frozen --release
}

check() {
  cd "${_pkgname}"
  export CARGO_HOME="${srcdir}/cargo-home"
  cargo test --frozen
}

package() {
  cd "${_pkgname}"

  install -d "${pkgdir}/usr/share/webapps/${_pkgname}"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/pixmaps"

  install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/share/webapps/${_pkgname}/${_pkgname}"

  cp -r templates "${pkgdir}/usr/share/webapps/${_pkgname}/"
  cp -r static "${pkgdir}/usr/share/webapps/${_pkgname}/"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "static/img/normal-cat-ticket.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"

  cat <<'EOF' > "${pkgdir}/usr/bin/battle-cats-normal-rolls-run"
#!/bin/bash

echo "=================================================="
echo "    BATTLE CATS NORMAL ROLLS LOCAL SERVER         "
echo "=================================================="
echo ""

cd "/usr/share/webapps/battle-cats-normal-rolls" || exit

LOCAL_IP=$(ip route get 1.1.1.1 2>/dev/null | grep -oP 'src \K\S+')
[ -z "$LOCAL_IP" ] && LOCAL_IP="127.0.0.1"

PORT=3000

(
    echo ":: Waiting for local service initialization..."
    until curl -s -o /dev/null -w "%{http_code}" "http://localhost:${PORT}" | grep -qE "200|302|304" 2>/dev/null; do
        sleep 0.3
    done
    echo ":: Server is up and stable! Launching local instance in your browser..."
    xdg-open "http://localhost:${PORT}"
) &

echo ":: Starting Rust application stack..."
echo ":: Local Address:   http://localhost:${PORT}"
echo ":: Network Access:  http://${LOCAL_IP}:${PORT}"
echo ":: To stop the server, simply close this terminal window."
echo "--------------------------------------------------"

if ! ./battle-cats-normal-rolls; then
    echo ""
    echo "[-] Server crashed or failed to start."
    echo ":: Press Enter to close this window."
    read -r
fi
EOF
  chmod +x "${pkgdir}/usr/bin/battle-cats-normal-rolls-run"

  cat <<'EOF' > "${pkgdir}/usr/bin/battle-cats-normal-rolls-launcher"
#!/bin/bash

TERMINALS=('kitty' 'alacritty' 'ghostty' 'foot' 'gnome-terminal' 'konsole' 'xfce4-terminal' 'terminator' 'guake' 'yakuake')
FOUND_TERM=""

for term in "${TERMINALS[@]}"; do
    if command -v "$term" &> /dev/null; then
        FOUND_TERM="$term"
        break
    fi
done

if [ -z "$FOUND_TERM" ]; then
    if command -v zenity &> /dev/null; then
        FOUND_TERM=$(zenity --entry --title="Battle Cats Normal Rolls" --text="Nenhum terminal padrão foi detectado.\nPor favor, digite o comando do seu emulador de terminal:")
    fi
    if [ -z "$FOUND_TERM" ]; then
        exit 1
    fi
fi

case "$FOUND_TERM" in
    "kitty" | "foot")
        $FOUND_TERM /usr/bin/battle-cats-normal-rolls-run
        ;;
    "alacritty" | "ghostty" | "terminator" | "guake" | "yakuake")
        $FOUND_TERM -e /usr/bin/battle-cats-normal-rolls-run
        ;;
    "gnome-terminal" | "konsole" | "xfce4-terminal")
        $FOUND_TERM -- /usr/bin/battle-cats-normal-rolls-run
        ;;
    *)
        $FOUND_TERM -e /usr/bin/battle-cats-normal-rolls-run
        ;;
esac
EOF
  chmod +x "${pkgdir}/usr/bin/battle-cats-normal-rolls-launcher"

  cat <<EOF > "${pkgdir}/usr/share/applications/battle-cats-normal-rolls.desktop"
[Desktop Entry]
Version=1.0
Type=Application
Name=Battle Cats Normal Rolls
Comment=Launch the local normal seed tracking engine inside a terminal window
Exec=/usr/bin/battle-cats-normal-rolls-launcher
Icon=battle-cats-normal-rolls
Terminal=false
Categories=Game;Utility;
StartupNotify=true
EOF
}
