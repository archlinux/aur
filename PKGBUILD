# Maintainer: Akiko Kumagara <akikokumagara@proton.me>
execname=gmodpatchtool
pkgname="${execname}-bin"
projname=gmodpatchtool
pkgver=20250921
pkgrel=1
arch=('x86_64')
pkgdesc="🇬🩹🛠 Patches for Garry's Mod. Updates/Improves CEF and Fixes common launch/performance issues (esp. on Linux/Proton/macOS). Formerly GModCEFCodecFix."
url="https://github.com/solsticegamestudios/${projname}"
license=('GPL3')
depends=()
makedepends=('unzip')
source=("${url}/releases/download/${pkgver}/${execname}-Linux.zip")
sha256sums=('178ea90a64f9f7ea50d9117f5ec776b0a51f6d81592baea82f5f57a72dde5440')

prepare() {
  cd "${srcdir}"
  unzip -o "${execname}-Linux.zip"

  # Auto-detect main binary: first executable file matching execname*
  binfile=$(find . -type f -perm -u=x -name "${execname}*" | head -n 1)
  if [[ -z "$binfile" ]]; then
    echo "Error: Could not find executable in archive" >&2
    exit 1
  fi
  echo "$binfile" > "${srcdir}/.binarypath"

  # Detect required libraries
  mapfile -t libs < <(ldd "$binfile" 2>/dev/null | awk '/=>/ {print $1}' | sort -u)

  # Convert library names to Arch package names
  depends_list=()
  for lib in "${libs[@]}"; do
    pkg=$(pacman -Qo "/usr/lib/$lib" 2>/dev/null | awk '{print $5}' | head -n1)
    [[ -n "$pkg" ]] && depends_list+=("$pkg")
  done

  # Remove duplicates
  depends_list=($(printf "%s\n" "${depends_list[@]}" | sort -u))
  printf "%s\n" "${depends_list[@]}" > "${srcdir}/.depends"
}

package() {
  cd "${srcdir}"
  binfile=$(<.binarypath)

  # Install everything into /opt
  install -d "${pkgdir}/opt/${execname}"
  cp -r ./* "${pkgdir}/opt/${execname}"

  # Create wrapper in /usr/bin
  install -d "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/${execname}" <<EOF
#!/bin/bash
SYS_DIR="/opt/${execname}"
USER_DIR="\$HOME/.local/share/${execname}"
BIN_NAME="$(basename "$binfile")"

# If writable, run from system directory
if [ -w "\$SYS_DIR" ]; then
    cd "\$SYS_DIR" || exit 1
    exec "./\$BIN_NAME" "\$@"
else
    # Copy to user directory if not already present
    if [ ! -d "\$USER_DIR" ]; then
        mkdir -p "\$USER_DIR"
        cp -r "\$SYS_DIR"/* "\$USER_DIR"/
    fi
    cd "\$USER_DIR" || exit 1
    exec "./\$BIN_NAME" "\$@"
fi
EOF
  chmod +x "${pkgdir}/usr/bin/${execname}"
}

