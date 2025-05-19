# Maintainer:

: ${_install_path:=usr/lib}

_pkgname="legcord"
pkgname="$_pkgname-bin"
pkgver=1.1.4
pkgrel=1
pkgdesc="Discord client with builtin client mod and theme support"
url="https://github.com/Legcord/Legcord"
license=('OSL-3.0')
arch=('x86_64' 'aarch64')

provides=("$_pkgname")
conflicts=("$_pkgname")

options=('!strip')

_pkgsrc="${_pkgname^}-$pkgver-linux-$CARCH"
_pkgext="rpm"

source_x86_64=("${_pkgname^}-$pkgver-linux-x86_64.$_pkgext"::"$url/releases/download/v$pkgver/${_pkgname^}-$pkgver-linux-x86_64.$_pkgext")
source_aarch64=("${_pkgname^}-$pkgver-linux-aarch64.$_pkgext"::"$url/releases/download/v$pkgver/${_pkgname^}-$pkgver-linux-aarch64.$_pkgext")

sha256sums_x86_64=('2354530a0ef2d478503a69be2b2d618c7b24f8502ca226af1060c8512891b8f9')
sha256sums_aarch64=('e0ba99601a8455a511a12260af8a1a604b42f70cbf5495b52390044b500b39b6')

package() {
  install -dm755 "$pkgdir/$_install_path/$_pkgname"
  mv opt/Legcord/* "$pkgdir/$_install_path/$_pkgname/"

  install -Dm644 "usr/share/icons/hicolor/1024x1024/apps/legcord.png" -t "$pkgdir/usr/share/pixmaps/"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/legcord" << END
#!/usr/bin/env bash

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

exec "/$_install_path/$_pkgname/$_pkgname" "\${flags[@]}" "\$@"
END

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << END
[Desktop Entry]
Type=Application
Name=${_pkgname^}
Comment=$pkgdesc
Exec=$_pkgname
Icon=$_pkgname
Categories=Internet;Network;InstantMessaging;
END

  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}
