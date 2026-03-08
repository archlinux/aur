# Maintainer: Fight_xing<fightxing@outlook.com>
# Contributor: Qiufuyu123 <qiufuyutony@gmail.com>
pkgname=casioemuneo-git
pkgver=r81.23de343
pkgrel=1
pkgdesc="Casio ClassWiz emulator, assembler and debugger"
arch=('x86_64')
url="https://github.com/qiufuyu123/CasioEmuNeo"
license=('GPL3')
install="${pkgname}.install"
depends=('sdl2' 'sdl2_image' 'lua53')
makedepends=('git' 'xmake')
optdepends=(
  'zenity: desktop directory picker for first-run guide'
  'kdialog: KDE directory picker for first-run guide'
  'noto-fonts-cjk: better CJK font fallback'
)
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/CasioEmuNeo"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/CasioEmuNeo"
  xmake f -m release --yes
  xmake
}

package() {
  cd "${srcdir}/CasioEmuNeo"

  install -Dm755 "build/linux/${CARCH}/release/CasioEmuX" "${pkgdir}/usr/lib/casioemuneo/CasioEmuX"
  install -Dm644 "lua-common.lua" "${pkgdir}/usr/share/casioemuneo/lua-common.lua"
  install -Dm644 "imgui.ini" "${pkgdir}/usr/share/casioemuneo/imgui.ini"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -d "${pkgdir}/usr/share/casioemuneo/lang"
  cp -a lang/*.ini "${pkgdir}/usr/share/casioemuneo/lang/"

  cat > "${pkgdir}/usr/share/casioemuneo/config.ini" << 'EOF'
[settings]
scale=1.000000
font=unifont.otf
model=
[lang]
lang=en
EOF

  install -d "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/casioemuneo" << 'EOF'
#!/bin/sh
set -eu

app_root="/usr/share/casioemuneo"
state_root="${XDG_CONFIG_HOME:-$HOME/.config}/casioemuneo"

mkdir -p "$state_root"

if [ ! -e "$state_root/lang" ]; then
  ln -s "$app_root/lang" "$state_root/lang"
fi

if [ ! -e "$state_root/lua-common.lua" ]; then
  ln -s "$app_root/lua-common.lua" "$state_root/lua-common.lua"
fi

if [ ! -f "$state_root/config.ini" ]; then
  cp "$app_root/config.ini" "$state_root/config.ini"

  locale_lang="${LC_ALL:-${LC_MESSAGES:-${LANG:-en}}}"
  case "${locale_lang}" in
    zh*|ZH*)
      user_lang="cn"
      ;;
    *)
      user_lang="en"
      ;;
  esac

  sed -i "s/^lang=.*/lang=${user_lang}/" "$state_root/config.ini"
fi

if [ ! -f "$state_root/imgui.ini" ]; then
  cp "$app_root/imgui.ini" "$state_root/imgui.ini"
fi

cd "$state_root"
exec /usr/lib/casioemuneo/CasioEmuX "$@"
EOF

  chmod 755 "${pkgdir}/usr/bin/casioemuneo"

  install -Dm644 "${startdir}/casioemuneo.desktop" "${pkgdir}/usr/share/applications/casioemuneo.desktop"
  install -Dm644 "${startdir}/casio.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/casio.png"
}
