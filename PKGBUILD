# Maintainer: PoDiax <pd@pdx.ovh>
pkgname=openstarbound
pkgver=0.1.7
pkgrel=2
pkgdesc="OpenStarbound Client (requires original Starbound game assets)"
arch=('x86_64')
url="https://github.com/OpenStarbound/OpenStarbound"
license=('custom')
depends=('glibc')
source=(
  "$pkgname-$pkgver.zip::https://github.com/OpenStarbound/OpenStarbound/releases/download/v$pkgver/OpenStarbound-Linux-Client.zip"
  "starbound.png"
)
sha256sums=('e5d72792d893a35e835c10ef5685a5617072c8b3ff7ae3e4064d387a30ce5b62'
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
  read -rp "Do you have the 'packed.pak' file from the original game? [y/N]: " has_pak

  if [[ "$has_pak" == "y" || "$has_pak" == "Y" ]]; then
    read -rp "Please provide the full path to your 'packed.pak' file: " pak_path

    if [[ -f "$pak_path" ]]; then
      echo "Copying 'packed.pak' from provided path to build directory..."
      cp "$pak_path" "$srcdir/packed.pak"
    else
      echo "Invalid path provided for 'packed.pak'. Installation aborted."
      exit 1
    fi
  else
    echo "'packed.pak' file is not required for the installation. Proceeding without it."
  fi

  cd "$srcdir"

  unzip -o "$pkgname-$pkgver.zip" -d "$srcdir"
  tar -xf "$srcdir/client.tar" -C "$srcdir"
  mv "$srcdir/client_distribution" "$srcdir/openstarbound"

  install -dm755 "$pkgdir/opt/openstarbound"
  cp -r "$srcdir/openstarbound"/* "$pkgdir/opt/openstarbound"

  chmod -R 777 "$pkgdir/opt/openstarbound"

  if [[ -f "/opt/openstarbound/assets/packed.pak" ]]; then
    if [[ $has_pak == "y" || $has_pak == "Y" ]]; then
      echo -e "\n\033[1;33mWARNING: 'packed.pak' file already exists in the installation directory.\033[0m" 
      read -rp "Do you want to replace it? [y/N]: " replace_pak
      if [[ "$replace_pak" == "y" || "$replace_pak" == "Y" ]]; then
        rm -f "/opt/openstarbound/assets/packed.pak"
        echo "Copying 'packed.pak' to the final package..."
        install -Dm644 "$srcdir/packed.pak" "$pkgdir/opt/openstarbound/assets/packed.pak"
      else
        echo "Skipping 'packed.pak' file replacement."
      fi
    fi
  else
    if [[ $has_pak == "y" || $has_pak == "Y" ]]; then
      echo "Copying 'packed.pak' to the final package..."
      install -Dm644 "$srcdir/packed.pak" "$pkgdir/opt/openstarbound/assets/packed.pak"
    fi
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


