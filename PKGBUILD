# Maintainer: PoDiax <pd@pdx.ovh>
_pkgname=openstarbound
pkgname=openstarbound-bin
pkgver=0.1.14
pkgrel=1
pkgdesc="OpenStarbound Client (requires original Starbound game assets)"
arch=('x86_64')
url="https://github.com/OpenStarbound/OpenStarbound"
license=('custom')
depends=('glibc')
optdepends=(
  'kdialog: GUI file picker fallback on KDE'
  'zenity: GUI file picker fallback on GNOME/GTK'
  'libnotify: Desktop notifications for asset discovery'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
  "$_pkgname-$pkgver.zip::https://github.com/OpenStarbound/OpenStarbound/releases/download/v$pkgver/OpenStarbound-Linux-Clang-Client.zip"
  "starbound.png"
)
sha256sums=('72ac75f007d6f18186a8be7ee3cb4adc9396d8c2d41478a42a31dc867c29f2ee'
            'c9c86ce8ee065e3a96e25778eb1212bf559affeef61c51f0ec4b2cad76ec9193')

prepare() {
  echo -e "\033[1;34m==>\033[1;37m Pre-flight check: Searching for Starbound assets...\033[0m"
  local EXPECTED_HASH="325d7d4210667b2a4738d805e858b80d7d55e8f834da773984ca6edb993577fe"
  local FOUND_PAK=""

  local STEAM_ROOTS=(
      "$HOME/.local/share/Steam"
      "$HOME/.steam/steam"
      "$HOME/.steam/root"
      "$HOME/.var/app/com.valvesoftware.Steam/.local/share/Steam"
  )

  for root in "${STEAM_ROOTS[@]}"; do
      local TEST_PATH="$root/steamapps/common/Starbound/assets/packed.pak"
      if [[ -f "$TEST_PATH" ]]; then
          FOUND_PAK="$TEST_PATH"
          break
      fi

      local VDF_FILE="$root/steamapps/libraryfolders.vdf"
      if [[ -f "$VDF_FILE" ]]; then
          while read -r lib_path; do
              local TEST_CUSTOM="${lib_path}/steamapps/common/Starbound/assets/packed.pak"
              if [[ -f "$TEST_CUSTOM" ]]; then
                  FOUND_PAK="$TEST_CUSTOM"
                  break 2
              fi
          done < <(grep -oP '"path"\s+"\K[^"]+' "$VDF_FILE" 2>/dev/null)
      fi
  done

  if [[ -n "$FOUND_PAK" ]]; then
      echo -e "\033[1;32m  -> Found packed.pak at: $FOUND_PAK\033[0m"
      echo -e "\033[1;34m  -> Verifying sha256sum (this may take a moment)...\033[0m"

      local CURRENT_HASH
      CURRENT_HASH=$(sha256sum "$FOUND_PAK" | awk '{print $1}')

      if [[ "$CURRENT_HASH" == "$EXPECTED_HASH" ]]; then
          echo -e "\033[1;32m  -> Hash verified successfully! The wrapper script will link this on first launch.\033[0m"
      else
          echo -e "\033[1;31m  -> WARNING: Hash mismatch! The file was found but appears modified. ($CURRENT_HASH)\033[0m"
      fi
  else
      echo -e "\033[1;33m  -> Could not automatically locate packed.pak in Steam directories.\033[0m"
      echo -e "\033[1;33m  -> Don't worry, the game will prompt you to select it on first launch.\033[0m"
  fi
}

package() {
  cd "$srcdir"

  unzip -o "$_pkgname-$pkgver.zip" -d "$srcdir"
  tar -xf "$srcdir/client.tar" -C "$srcdir"
  mv "$srcdir/client_distribution" "$srcdir/$_pkgname"

  rm -f "$srcdir/$_pkgname/linux/sbinit.config"

  rm -rf "$srcdir/$_pkgname/mods"
  rm -rf "$srcdir/$_pkgname/assets/user"
  rm -rf "$srcdir/$_pkgname/storage"
  rm -rf "$srcdir/$_pkgname/logs"

  install -dm755 "$pkgdir/opt/$_pkgname"
  cp -r "$srcdir/$_pkgname"/* "$pkgdir/opt/$_pkgname"

  install -Dm644 "$srcdir/starbound.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/starbound.png"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" <<EOF
[Desktop Entry]
Name=OpenStarbound
Exec=/usr/bin/$_pkgname
Icon=starbound
Type=Application
Categories=Game;
EOF

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" <<'EOF'
#!/bin/bash
USER_DIR="$HOME/.config/openstarbound"
PAK_DEST="$USER_DIR/assets/packed.pak"
EXPECTED_HASH="325d7d4210667b2a4738d805e858b80d7d55e8f834da773984ca6edb993577fe"

if [[ -d "$USER_DIR/linux" ]]; then
    rm -rf "$USER_DIR/linux"
fi
rm -f "$USER_DIR/assets/opensb.pak" 2>/dev/null

mkdir -p "$USER_DIR/logs" "$USER_DIR/mods" "$USER_DIR/storage" "$USER_DIR/assets"

cat > "$USER_DIR/sbinit.config" <<CONFIG_EOF
{
  "assetDirectories" : [
    "/opt/openstarbound/assets/",
    "$USER_DIR/assets/",
    "$USER_DIR/mods/"
  ],
  "storageDirectory" : "$USER_DIR/storage/",
  "defaultConfiguration" : {
    "gameServerBind" : "*",
    "queryServerBind" : "*",
    "rconServerBind" : "*"
  }
}
CONFIG_EOF

if [[ ! -f "$PAK_DEST" && ! -f "/opt/openstarbound/assets/packed.pak" ]]; then
    FOUND_PAK=""
    STEAM_ROOTS=("$HOME/.local/share/Steam" "$HOME/.steam/steam" "$HOME/.steam/root" "$HOME/.var/app/com.valvesoftware.Steam/.local/share/Steam")

    for root in "${STEAM_ROOTS[@]}"; do
        TEST_PATH="$root/steamapps/common/Starbound/assets/packed.pak"
        if [[ -f "$TEST_PATH" ]]; then
            FOUND_PAK="$TEST_PATH"
            break
        fi

        VDF_FILE="$root/steamapps/libraryfolders.vdf"
        if [[ -f "$VDF_FILE" ]]; then
            while read -r lib_path; do
                TEST_CUSTOM="${lib_path}/steamapps/common/Starbound/assets/packed.pak"
                if [[ -f "$TEST_CUSTOM" ]]; then
                    FOUND_PAK="$TEST_CUSTOM"
                    break 2
                fi
            done < <(grep -oP '"path"\s+"\K[^"]+' "$VDF_FILE" 2>/dev/null)
        fi
    done

    if [[ -n "$FOUND_PAK" ]]; then
        ln -s "$FOUND_PAK" "$PAK_DEST"
        if command -v notify-send &> /dev/null; then
            notify-send "OpenStarbound" "Linked game assets from:\n$FOUND_PAK" --icon=starbound --urgency=normal
        fi
    else
        USER_SELECTED=""
        if command -v kdialog &> /dev/null; then
            kdialog --msgbox "OpenStarbound needs your original 'packed.pak' file from Starbound.\n\nCould not find it automatically. Please locate it in the next window." --title "OpenStarbound Setup"
            USER_SELECTED=$(kdialog --title "Select packed.pak" --getopenfilename "$HOME" "packed.pak (packed.pak)")
        elif command -v zenity &> /dev/null; then
            zenity --info --text="OpenStarbound needs your original 'packed.pak' file.\n\nCould not find it automatically. Please locate it." --title="OpenStarbound Setup"
            USER_SELECTED=$(zenity --file-selection --title="Select packed.pak" --filename="packed.pak")
        else
            echo -e "\033[1;31m[ERROR] GUI dialog tools not found.\033[0m"
            echo -e "Please manually symlink or copy 'packed.pak' to: $PAK_DEST"
            exit 1
        fi

        if [[ -n "$USER_SELECTED" && -f "$USER_SELECTED" && $(basename "$USER_SELECTED") == "packed.pak" ]]; then
            ln -s "$USER_SELECTED" "$PAK_DEST"
            if command -v notify-send &> /dev/null; then
                notify-send "OpenStarbound" "Successfully linked assets." --icon=starbound
            fi
        else
            if command -v kdialog &> /dev/null; then
                kdialog --error "Setup cancelled or invalid file selected. You must provide 'packed.pak' to play OpenStarbound."
            elif command -v zenity &> /dev/null; then
                zenity --error --text="Setup cancelled or invalid file selected."
            fi
            exit 1
        fi
    fi
fi

if [[ -f "$PAK_DEST" ]]; then
    ACTIVE_PAK="$PAK_DEST"
else
    ACTIVE_PAK="/opt/openstarbound/assets/packed.pak"
fi

CURRENT_HASH=$(sha256sum "$ACTIVE_PAK" | awk '{print $1}')
if [[ "$CURRENT_HASH" != "$EXPECTED_HASH" ]]; then
    echo -e "\033[1;31m[WARNING] Hash mismatch detected for 'packed.pak'. The game might not run correctly.\033[0m"
fi

cd /opt/openstarbound/linux || exit 1
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:./"

exec ./starbound -bootconfig "$USER_DIR/sbinit.config" "$@"
EOF

  install -Dm644 /dev/stdin "$pkgdir/usr/share/licenses/$pkgname/LICENSE" <<EOF
OpenStarbound is distributed under a custom license.
For more information, visit: $url
EOF
}
