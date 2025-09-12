# Maintainer: PoDiax <pd@pdx.ovh>
pkgname=openstarbound-nightly
pkgver=0.3
pkgrel=5
pkgdesc="OpenStarbound Client (Nightly Build, requires original Starbound game assets)"
arch=('x86_64')
url="https://github.com/OpenStarbound/OpenStarbound"
license=('custom')
depends=('glibc')
source=(
  "$pkgname-$pkgver.zip::https://nightly.link/OpenStarbound/OpenStarbound/workflows/build/main/OpenStarbound-Linux-Clang-Client.zip"
  "starbound.png"
  )
sha256sums=('SKIP'
'c9c86ce8ee065e3a96e25778eb1212bf559affeef61c51f0ec4b2cad76ec9193'
)


build() {
  echo -e "\033[1;33mThis is a nightly build of OpenStarbound.\033[0m"
  echo -e "\033[1;33mExpect bugs and crashes.\033[0m"
  echo -e "\033[1;33mPlease report any issues to the OpenStarbound GitHub repository.\033[0m"
  read -rp "Do you want to continue with the installation? [y/N]: " confirm
  if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
    echo "Installation aborted."
    exit 1
  fi

  echo -e "\033[1;33mOpenStarbound requires the original Starbound game assets.\033[0m"
  echo -e "\033[1;33mYou must copy the \033[1;34mpacked.pak\033[1;33m file from the original game to \033[1;34m/opt/openstarbound-nightly/assets\033[1;33m.\033[0m"
  read -rp "Do you confirm you own Starbound on Steam or other legal platform and agree to these terms? [y/N]: " confirm
  if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
    echo "Installation aborted."
    exit 1
  fi

}

pre_install() {
  if [[ -f "/opt/openstarbound-nightly/assets/packed.pak" ]]; then 
    echo "Removing old 'packed.pak' file..."
    rm -f "/opt/openstarbound-nightly/assets/packed.pak"
  fi
}


package() {
  local expected_hash="325d7d4210667b2a4738d805e858b80d7d55e8f834da773984ca6edb993577fe"

  check_hash() {
    sha256sum "$1" | awk '{print $1}'
  }

  if [[ -f "/opt/openstarbound-nightly/assets/packed.pak" ]]; then
    mkdir -p "$pkgdir/opt/openstarbound-nightly/assets"

    if [[ "$(check_hash "/opt/openstarbound-nightly/assets/packed.pak")" == "$expected_hash" ]]; then
      echo "Existing 'packed.pak' is valid. Copying to the final package."
      cp "/opt/openstarbound-nightly/assets/packed.pak" "$pkgdir/opt/openstarbound-nightly/assets/packed.pak"
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
      echo -e "'packed.pak' file is not provided, proceeding without it. \033[1;31mMake sure to copy it to /opt/openstarbound-nightly/assets/ before trying to launching the game.\033[0m"
    fi
  fi

  cd "$srcdir"

  unzip -o "$pkgname-$pkgver.zip" -d "$srcdir"
  tar -xf "$srcdir/client.tar" -C "$srcdir"
  mv "$srcdir/client_distribution" "$srcdir/openstarbound-nightly"

  rm -rf "$srcdir/openstarbound-nightly/mods"
  rm -rf "$srcdir/openstarbound-nightly/assets/user"

  install -dm755 "$pkgdir/opt/openstarbound-nightly"
  cp -r "$srcdir/openstarbound-nightly"/* "$pkgdir/opt/openstarbound-nightly"

  chmod -R 777 "$pkgdir/opt/openstarbound-nightly"

  mkdir -p "$HOME/.config/openstarbound-nightly/logs"
  mkdir -p "$HOME/.config/openstarbound-nightly/mods"
  mkdir -p "$HOME/.config/openstarbound-nightly/storage"
  mkdir -p "$HOME/.config/openstarbound-nightly/assets/user"


  ln -sf "$HOME/.config/openstarbound-nightly/logs" "$pkgdir/opt/openstarbound-nightly/logs"
  ln -sf "$HOME/.config/openstarbound-nightly/mods" "$pkgdir/opt/openstarbound-nightly/mods"
  ln -sf "$HOME/.config/openstarbound-nightly/storage" "$pkgdir/opt/openstarbound-nightly/storage"
  ln -sf "$HOME/.config/openstarbound-nightly/assets/user" "$pkgdir/opt/openstarbound-nightly/assets/user"

  if [[ -f "$srcdir/packed.pak" ]]; then
    echo "Copying 'packed.pak' to the final package..."
    install -Dm644 "$srcdir/packed.pak" "$pkgdir/opt/openstarbound-nightly/assets/packed.pak"
  fi

  install -Dm644 "$srcdir/starbound.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/starbound-nightly.png"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/openstarbound-nightly.desktop" <<EOF
[Desktop Entry]
Name=OpenStarbound Nightly
Exec=/usr/bin/openstarbound-nightly
Icon=starbound-nightly
Type=Application
Categories=Game;
EOF

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/openstarbound-nightly" <<EOF
#!/bin/bash
cd /opt/openstarbound-nightly/linux || exit 1
export LD_LIBRARY_PATH="\$LD_LIBRARY_PATH:./"
exec ./starbound "\$@"
EOF

  install -Dm644 /dev/stdin "$pkgdir/usr/share/licenses/$pkgname/LICENSE" <<EOF
OpenStarbound is distributed under a custom license.
For more information, visit: $url
EOF
}
