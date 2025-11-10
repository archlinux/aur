# Maintainer: Joshua Schmeder <joshua@schmeder.dev>

pkgname=archipelagomw-bin
_ghrel=0.6.4
pkgver=0.6.4
pkgrel=1
pkgdesc="A Multi-Game Randomizer and Server"
arch=("x86_64")
url="https://github.com/ArchipelagoMW/Archipelago"
license=("MIT")
depends=("python-colorama" "python-websockets" "python-yaml" "python-jellyfish" "python-jinja" "python-schema" "python-kivy" "python-bsdiff4" "python-platformdirs" "python-certifi" "cython" "python-cymem" "python-orjson" "python-typing_extensions" "xsel" "xclip")
optdepends=("mtdev: Multi-touch device support")
source=("https://github.com/ArchipelagoMW/Archipelago/releases/download/${_ghrel}/Archipelago_${pkgver}_linux-x86_64.tar.gz")
sha512sums=('33bea0271e16615b9438e76774e9223837ae8d8a5f0c17ab7c8ff3ac2621fdb2fd4831cb11b596640ddcc68b440b5513776b3f2b2be6c125c253773536ab1c51')

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
