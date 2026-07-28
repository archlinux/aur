# Maintainer: Akiko Kumagara <akikokumagara@proton.me>
execname=gmodpatchtool
pkgname="${execname}-bin"
projname=gmodpatchtool
pkgver=20260722
pkgrel=3
arch=('x86_64')
pkgdesc="🇬🩹🛠 Patches for Garry's Mod. Updates/Improves CEF and Fixes common launch/performance issues (esp. on Linux/Proton/macOS). Formerly GModCEFCodecFix."
url="https://github.com/solsticegamestudios/${projname}"
license=('GPL3')
depends=()
makedepends=('unzip')
source=("${url}/releases/download/${pkgver}/${execname}-Linux.zip")
sha256sums=('23a0946253de5c976ecad4d2528955041f77fb58f80ead602ba82845c01e40ef')

prepare() {
  cd "${srcdir}"
  unzip -o "${execname}-Linux.zip"

  binfile=$(find . -type f -perm -u=x -name "${execname}*" | head -n 1)
  if [[ -z "$binfile" ]]; then
    echo "Error: Could not find executable in archive" >&2
    exit 1
  fi
  echo "$binfile" > "${srcdir}/.binarypath"

  mapfile -t libs < <(ldd "$binfile" 2>/dev/null | awk '/=>/ {print $1}' | sort -u)

  depends_list=()
  for lib in "${libs[@]}"; do
    pkg=$(pacman -Qo "/usr/lib/$lib" 2>/dev/null | awk '{print $5}' | head -n1)
    [[ -n "$pkg" ]] && depends_list+=("$pkg")
  done

  depends_list=($(printf "%s\n" "${depends_list[@]}" | sort -u))
  printf "%s\n" "${depends_list[@]}" > "${srcdir}/.depends"
}

package() {
  cd "${srcdir}"
  binfile=$(<.binarypath)

  install -d "${pkgdir}/opt/${execname}"
  cp -a ./. "${pkgdir}/opt/${execname}"

  install -d "${pkgdir}/usr/bin"

  cat > "${pkgdir}/usr/bin/${execname}" <<EOF
#!/bin/bash
set -e

SYS_DIR="/opt/${execname}"
USER_DIR="\$HOME/.local/share/${execname}"
BIN_PATH="${binfile#./}"
PKGVER="${pkgver}"

if [[ ! -f "\$USER_DIR/.pkgver" ]] || [[ "\$(cat "\$USER_DIR/.pkgver")" != "\$PKGVER" ]]; then
    rm -rf "\$USER_DIR"
    mkdir -p "\$USER_DIR"
    cp -a "\$SYS_DIR"/. "\$USER_DIR"/
    chmod +x "\$USER_DIR/\$BIN_PATH"
    echo "\$PKGVER" > "\$USER_DIR/.pkgver"
fi

cd "\$USER_DIR"
exec "./\$BIN_PATH" "\$@"
EOF

  chmod 755 "${pkgdir}/usr/bin/${execname}"
}

