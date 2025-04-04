# Maintainer: Joshua Schmeder <joshua@schmeder.dev>

pkgname=archipelagomw-bin
_ghrel=0.6.1
pkgver=0.6.1
pkgrel=1
pkgdesc="A Multi-Game Randomizer and Server"
arch=("x86_64")
url="https://github.com/ArchipelagoMW/Archipelago"
license=("MIT")
depends=("python-colorama" "python-websockets" "python-yaml" "python-jellyfish" "python-jinja" "python-schema" "python-kivy" "python-bsdiff4" "python-platformdirs" "python-certifi" "cython" "python-cymem" "python-orjson" "python-typing_extensions" "xsel" "xclip")
optdepends=("mtdev: Multi-touch device support")
source=("https://github.com/ArchipelagoMW/Archipelago/releases/download/${_ghrel}/Archipelago_${pkgver}_linux-x86_64.tar.gz")
sha512sums=('a414b0c6eb4a73fe367f6d6f1426f26c314e2c15a750fa6b57057bc8f81aa7d5fb992bb99d55b881a580418e48a8302c489322b90d8fd35786aea6db51add422')

package() {
  install -d "$pkgdir/opt"
  cp -r "$srcdir/Archipelago/" "$pkgdir/opt"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/applications"
  while IFS= read -r -d '' i; do
    file="${i##*/}"
    # wrapper for binaries to run in the install dir
    cat <<EOF >"$pkgdir/usr/bin/$file"
#!/bin/bash
cd /opt/Archipelago
./$file "\$@"
EOF
    chmod +x "$pkgdir/usr/bin/$file"
    # desktop entries
    if [ "$ARCHIPELAGO_ALL_DESKTOPS" = "1" ]; then
      cat <<EOF >"$pkgdir/usr/share/applications/$file.desktop"
[Desktop Entry]
Version=1.0
Exec=/opt/Archipelago/$file
Path=/opt/Archipelago/
Name=$file
Type=Application
Icon=/opt/Archipelago/icon.png
Categories=Game;
Keywords=multi-game;randomizer;
EOF
    fi

  done < <(find "$pkgdir/opt/Archipelago" -maxdepth 1 -type f -name "Archipelago*" -executable -print0)

  if [ "$ARCHIPELAGO_ALL_DESKTOPS" != "1" ]; then
    cat <<EOF >"$pkgdir/usr/share/applications/ArchipelagoLauncher.desktop"
[Desktop Entry]
Version=1.0
Exec=/opt/Archipelago/ArchipelagoLauncher
Path=/opt/Archipelago/
Name=Archipelago Launcher
Comment=Multi-Game Randomizer and Server
Type=Application
Icon=/opt/Archipelago/icon.png
Categories=Game;
Keywords=multi-game;randomizer;
EOF
  fi
}
