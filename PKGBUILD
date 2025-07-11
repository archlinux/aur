# Maintainer: PoDiax <pd@pdx.ovh>
pkgname=openstarbound
pkgver=0.1.14
pkgrel=1
pkgdesc="OpenStarbound Client (requires original Starbound game assets)"
arch=('x86_64')
url="https://github.com/OpenStarbound/OpenStarbound"
license=('custom')
depends=('glibc')
source=(
  "$pkgname-$pkgver.zip::https://github.com/OpenStarbound/OpenStarbound/releases/download/v$pkgver/OpenStarbound-Linux-Clang-Client.zip"
  "starbound.png"
)
sha256sums=('72ac75f007d6f18186a8be7ee3cb4adc9396d8c2d41478a42a31dc867c29f2ee'
'c9c86ce8ee065e3a96e25778eb1212bf559affeef61c51f0ec4b2cad76ec9193'
)


build() {
  echo -e "\033[1;33mOpenStarbound requires the original Starbound game assets.\033[0m"
  echo -e "\033[1;33mYou must copy the \033[1;34mpacked.pak\033[1;33m file from the original game to \033[1;34m/opt/openstarbound/assets\033[1;33m.\033[0m"
  read -rp "Do you confirm you own Starbound on Steam or other legal platform and agree to these terms? [y/N]: " confirm
  if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
    echo "Installation aborted."
    exit 1
  fi

}

package() {
  local expected_hash="325d7d4210667b2a4738d805e858b80d7d55e8f834da773984ca6edb993577fe"

  check_hash() {
    sha256sum "$1" | awk '{print $1}'
  }

    if [[ -f "/opt/openstarbound/assets/packed.pak" ]]; then
    mkdir -p "$pkgdir/opt/openstarbound/assets"

    if [[ "$(check_hash "/opt/openstarbound/assets/packed.pak")" == "$expected_hash" ]]; then
      echo "Existing 'packed.pak' is valid. Copying to the final package."
      cp "/opt/openstarbound/assets/packed.pak" "$pkgdir/opt/openstarbound/assets/packed.pak"
    else
      echo "Hash mismatch detected for existing 'packed.pak'."
      replace_pak_prompt=true
    fi
  else
    echo "'packed.pak' does not exist. Prompting user for input."
    replace_pak_prompt=true
  fi

  if [[ "$replace_pak_prompt" == true ]]; then
    read -rp "Do you have the 'packed.pak' file from the original game? [y/N]: " has_pak
    if [[ "$has_pak" == "y" || "$has_pak" == "Y" ]]; then
      read -rp "Please provide the full path to your 'packed.pak' file: " pak_path
      if [[ -f "$pak_path" ]]; then
        if [[ "$(check_hash "$pak_path")" == "$expected_hash" ]]; then
          echo "Copying 'packed.pak' from provided path to build directory..."
          cp "$pak_path" "$srcdir/packed.pak"
        else
          echo "Hash mismatch! The provided 'packed.pak' is invalid. Aborting."
          exit 1
        fi
      else
        echo "Invalid path provided for 'packed.pak'. Installation aborted."
        exit 1
      fi
    else
      echo -e "'packed.pak' file is not provided, proceeding without it. \033[1;31mMake sure to copy it to /opt/openstarbound/assets/ before trying to launching the game.\033[0m"
    fi
  fi

  cd "$srcdir"

  unzip -o "$pkgname-$pkgver.zip" -d "$srcdir"
  tar -xf "$srcdir/client.tar" -C "$srcdir"
  mv "$srcdir/client_distribution" "$srcdir/openstarbound"

  rm -rf "$srcdir/openstarbound/mods"
  rm -rf "$srcdir/openstarbound/assets/user"

  install -dm755 "$pkgdir/opt/openstarbound"
  cp -r "$srcdir/openstarbound"/* "$pkgdir/opt/openstarbound"

  chmod -R 777 "$pkgdir/opt/openstarbound"

  mkdir -p "$HOME/.config/openstarbound/logs"
  mkdir -p "$HOME/.config/openstarbound/mods"
  mkdir -p "$HOME/.config/openstarbound/storage"
  mkdir -p "$HOME/.config/openstarbound/assets/user"


  ln -sf "$HOME/.config/openstarbound/logs" "$pkgdir/opt/openstarbound/logs"
  ln -sf "$HOME/.config/openstarbound/mods" "$pkgdir/opt/openstarbound/mods"
  ln -sf "$HOME/.config/openstarbound/storage" "$pkgdir/opt/openstarbound/storage"
  ln -sf "$HOME/.config/openstarbound/assets/user" "$pkgdir/opt/openstarbound/assets/user"

  if [[ -f "$srcdir/packed.pak" ]]; then
    echo "Copying 'packed.pak' to the final package..."
    install -Dm644 "$srcdir/packed.pak" "$pkgdir/opt/openstarbound/assets/packed.pak"
  fi


  install -Dm644 "$srcdir/starbound.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/starbound.png"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/openstarbound.desktop" <<EOF
[Desktop Entry]
Name=OpenStarbound
Exec=/usr/bin/openstarbound
Icon=starbound
Type=Application
Categories=Game;
EOF

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/openstarbound" <<EOF
#!/bin/bash
cd /opt/openstarbound/linux || exit 1
export LD_LIBRARY_PATH="\$LD_LIBRARY_PATH:./"
exec ./starbound "\$@"
EOF

  install -Dm644 /dev/stdin "$pkgdir/usr/share/licenses/$pkgname/LICENSE" <<EOF
OpenStarbound is distributed under a custom license.
For more information, visit: $url
EOF
}


