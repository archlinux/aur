# Maintainer: aur.chaotic.cx
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org>
# Contributor: Eric S. Londres <ericlondres@protonmail.com>
# Contributor: Mandeep Sangwan <mandeep@sangwan.me>
# Contributor: Joakim Nylén <me@jnylen.nu>
# Contributor: Rashintha Maduneth <rashinthamaduneth@gmail.com>
# Contributor: Dhananjay Balan <mail@dbalan.in>

: ${_install_path:=usr/lib}

_pkgname="mailspring"
pkgname="$_pkgname"
pkgver=1.23.0
pkgrel=1
pkgdesc="A beautiful and fast mail client"
url="https://github.com/Foundry376/Mailspring"
license=('GPL-3.0-only')
arch=('x86_64')

depends=(
  'db5.3'
  'gnome-keyring'
)
makedepends=(
  'git'
  'nvm'
  'python'
  'patchelf'
)

_pkgsrc="$_pkgname"
source=("$_pkgname"::"git+$url.git#tag=$pkgver")
sha256sums=('d10372d596a37bfd587a3db5c28d2c263266f195e10c994ddd0f4cb4f00ed0b0')

_nvm_env() {
  [ -n "$NVM_DIR" ] && return
  export NVM_DIR="$SRCDEST/node-nvm"

  # set up nvm
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
  nvm install node
  nvm use node
}

_electron_env() {
  [ -n "$ELECTRON_SKIP_BINARY_DOWNLOAD" ] && return
  export ELECTRON_SKIP_BINARY_DOWNLOAD=1

  local _electron_version=$(grep -Pom1 '^\s*"electron":\s*"\K[0-9.]+' "$srcdir/$_pkgsrc/package.json")
  : ${_electron_version:?}

  export SYSTEM_ELECTRON_VERSION=$(LC_ALL=C pacman -Si "electron${_electron_version%%.*}" | grep -Pom1 '^Version\s+:\s+\K\S+(?=-[0-9])')
  : ${SYSTEM_ELECTRON_VERSION:?}

  export ELECTRON_VERSION=$(sed -E 's&\..*&&' <<< "${SYSTEM_ELECTRON_VERSION%%.*}")
  : ${ELECTRON_VERSION:?}
}

prepare() {
  _electron_env

  cd "$_pkgsrc"

  # set electron version
  sed -E \
    -e 's&^(\s*)("electron"): "(.*)"(,?)$&\1\2: "'"$SYSTEM_ELECTRON_VERSION"'"\4&' \
    -i "package.json" "app/package.json"

  # allow any npm version
  sed -E \
    -e 's&^(\s*)"(node|npm)": "(.*)"(,?)$&\1"\2": ">=1.0.0"\4&' \
    -i "package.json"

  # don't try to create deb or rpm
  sed -E -e "/await (createRpmInstaller|createDebInstaller)/d" -i app/build/build.js
}

build() (
  _nvm_env
  _electron_env

  cd "$_pkgsrc"
  npm install --no-audit --no-fund
  npm run-script build
)

package() {
  _electron_env
  depends+=("electron${ELECTRON_VERSION:-}")

  cd "$_pkgsrc"

  # resources
  mkdir -pm755 "${pkgdir}/$_install_path/$_pkgname"
  cp -r app/dist/mailspring-linux-x64/resources/* "$pkgdir/$_install_path/$_pkgname/"

  # fix rpath
  patchelf --set-rpath '$ORIGIN' "$pkgdir/$_install_path/$_pkgname/app.asar.unpacked/mailsync.bin"

  # icon
  install -Dm0644 "app/build/resources/linux/icons/512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_pkgname.png"

  # launcher
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << END
$(
    sed -E \
      -e 's&<%= productName %>&'"${_pkgname^}"'&' \
      -e 's&<%= description %>&'"${pkgdesc}"'&' \
      "app/build/resources/linux/Mailspring.desktop.in"
  )
END

  # metainfo
  install -Dm644 /dev/stdin "$pkgdir/usr/share/metainfo/$_pkgname.appdata.xml" << END
$(sed -E -e 's&<%= productName %>&Mailspring&g' "app/build/resources/linux/mailspring.appdata.xml.in")
END

  # script
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" << END
#!/usr/bin/env bash

set -euo pipefail

name=$_pkgname
flags_file="\${XDG_CONFIG_HOME:-\$HOME/.config}/\${name}-flags.conf"

lines=()
if [[ -f "\${flags_file}" ]]; then
  mapfile -t lines < "\${flags_file}"
fi

flags=()
for line in "\${lines[@]}"; do
  if [[ ! "\${line}" =~ ^[[:space:]]*#.* ]] && [[ -n "\${line}" ]]; then
    flags+=("\${line}")
  fi
done

: \${ELECTRON_IS_DEV:=0}
export ELECTRON_IS_DEV
: \${ELECTRON_FORCE_IS_PACKAGED:=true}
export ELECTRON_FORCE_IS_PACKAGED

exec electron${ELECTRON_VERSION:-} "\${flags[@]}" "/$_install_path/$_pkgname/app.asar" --password-store="gnome-libsecret" "\$@"
END
}
