# Maintainer:
# Contributor: Xuanwo <xuanwo@archlinuxcn.org>

: ${_install_path:=opt}

_pkgname="logseq-desktop"
pkgname="$_pkgname-bin"
pkgver=0.10.11
pkgrel=2
pkgdesc="Privacy-first, open-source platform for knowledge sharing and management"
url="https://github.com/logseq/logseq"
license=('AGPL-3.0-or-later')
arch=('x86_64' 'aarch64')

provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")

options=('!debug' '!strip')

_pkgsrc="Logseq-linux-x64"
[[ "$CARCH" == "aarch64" ]] && _pkgsrc="Logseq-linux-arm64"

_pkgext="zip"
source_x86_64=("$url/releases/download/$pkgver/Logseq-linux-x64-$pkgver.$_pkgext")
source_aarch64=("$url/releases/download/$pkgver/Logseq-linux-arm64-$pkgver.$_pkgext")

sha256sums_x86_64=('6920a08e87a7be9217cdfcf47a5233176c85a34052e5b2b18ebd8b58019330de')
sha256sums_aarch64=('bdf0c48ac97e2a92b14925e0d0ac684bd0df05eec6ba34d7dd5f87914794021f')

# appimage - missing icon
if [[ "${_pkgext::1}" == "A" ]]; then
  source+=("$_pkgname.png"::"$url/raw/master/resources/icons/logseq.png")
  sha256sums+=('2c04bad999ef75b874bd185b84c4df560486685f5a36c2801224ef9b67642006')
fi

prepare() {
  # appimage - extract
  if [[ "${_pkgext::1}" == "A" ]]; then
    chmod +x "$_pkgsrc-$pkgver.$_pkgext"
    "./$_pkgsrc-$pkgver.$_pkgext" --appimage-extract
    ln -sf "squashfs-root" "$_pkgsrc"
  fi
}

package() {
  if [[ "${_pkgext::1}" == "A" ]]; then
    # appimage - icons
    install -Dm644 "$_pkgname.png" "$pkgdir/usr/share/pixmaps/logseq.png"

    # appimage - remove unneeded
    rm -- "$_pkgsrc/AppRun"
    rm -- "$_pkgsrc/Logseq.desktop"
    rm -- "$_pkgsrc/Logseq.png"
  else
    # zip - icons
    install -Dm644 "$_pkgsrc/resources/app/icon.png" "$pkgdir/usr/share/pixmaps/logseq.png"
  fi

  # main files
  mkdir -pm755 "$pkgdir/$_install_path/$_pkgname"
  cp -a "$_pkgsrc"/* "$pkgdir/$_install_path/$_pkgname/"

  # launcher
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << END
[Desktop Entry]
Type=Application
Name=Logseq
Comment=$pkgdesc
Exec=logseq %u
Icon=logseq
Terminal=false
StartupNotify=true
Categories=Office;
MimeType=x-scheme-handler/logseq;
StartupWMClass=Logseq
END

  # script
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/logseq" << END
#!/usr/bin/env bash

name=logseq
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

exec "/$_install_path/logseq-desktop/Logseq" "\${flags[@]}" "\$@"
END

  # permissions
  chmod -R u=rwX,go=rX "$pkgdir"
}
