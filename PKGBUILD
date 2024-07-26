# Maintainer: Joshua Schmeder <joshua@schmeder.dev>

pkgname=archipelagomw-bin
pkgver=0.5.0
pkgrel=3
pkgdesc="A Multi-Game Randomizer and Server"
arch=("x86_64")
url="https://github.com/ArchipelagoMW/Archipelago"
license=("MIT")
depends=("python-colorama" "python-websockets" "python-yaml" "python-jellyfish" "python-jinja" "python-schema" "python-kivy" "python-bsdiff4" "python-platformdirs" "python-certifi" "cython" "python-cymem" "python-orjson" "python-typing_extensions")
source=("https://github.com/ArchipelagoMW/Archipelago/releases/download/$pkgver/Archipelago_${pkgver}_linux-x86_64.tar.gz")
sha512sums=('2a326246b6ff72b4b0c91462da38a2f35deec31dd4f189eebea5f2502f8f16acb8c9e1502c4daee5cc60b57aff3f10cc9c80c425e3a3d5ebfeed3a53cc67a3ca')

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
