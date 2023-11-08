# Maintainer: Trustin Lee <t@motd.kr>
# Former Maintainer: Arnaud Dovi <mr.dovi@gmail.com>

pkgname=restream-chat
pkgver=2.5.4
pkgrel=2
pkgdesc='Keep your streaming chats in one place by Restream.io'
arch=('x86_64')
url='https://restream.io/chat'
license=()
provides=(
  'restream-chat'
)
conflicts=(
  'restream-chat'
)
depends=(
  # [FIXME?] libffpmeg.so is not an official library, is it necessary to bring it to AUR ? (currently only lib32-libffpmeg exists in the AUR...)
  'alsa-lib'
  'avahi'
  'gmp'
  'gnutls'
  'gtk3'
  'krb5'
  'libglvnd'
  'libnotify'
  'libxau'
  'libxdmcp'
  'libxss'
  'nss'
)
optdepends=(
  'libappindicator-gtk2' # libappindicator is shipped in the original AppImage but I'm unsure if it is necessary.
)
makedepends=(
  'coreutils'
)
_srcname="squashfs-root"
_pkgname="Restream+Chat-${pkgver}-beta.AppImage"
source=(
  "https://chat-client.restream.io/${_pkgname}"
)
sha512sums=(
  '0bab803e1904c38758816f28e4cf1146a6dd9b4344f972cf88aa537d5ca3b7d9e90e8349804b5c3d411d23c88e82c7b376eb926be163ebb0cbb8fa367b6bd594'
)
_stop='\e[m'
_color="\e[33m"
_bold='\e[1m'
_prefix=" ${_bold}${_color}==>${_stop} "

prepare() {
  #cd "$_srcname" || return
  echo -e "${_prefix}Extracting the official AppImage file"
  chmod +x "$_pkgname"
  ./"$_pkgname" --appimage-extract
}

package() {
  cd "$_srcname" || return

  echo -e "${_prefix}Creating the package base"
  install -d "$pkgdir"/{opt/"${pkgname}",usr/bin,usr/share/pixmaps}
  install -d "$pkgdir/opt/${pkgname}"/{locales,resources}

  echo -e "${_prefix}Copying the package files"
  install -Dm 644 locales/* -t "$pkgdir"/opt/"${pkgname}"/locales
  cp -r resources/* -t "$pkgdir"/opt/"${pkgname}"/resources
  install -Dm 644 icudtl.dat -t "$pkgdir"/opt/"${pkgname}"
  install -Dm 644 snapshot_blob.bin -t "$pkgdir"/opt/"${pkgname}"
  install -Dm 644 v8_context_snapshot.bin -t "$pkgdir"/opt/"${pkgname}"
  install -Dm 644 natives_blob.bin -t "$pkgdir"/opt/"${pkgname}"
  install -Dm 644 chrome_100_percent.pak -t "$pkgdir"/opt/"${pkgname}"
  install -Dm 644 chrome_200_percent.pak -t "$pkgdir"/opt/"${pkgname}"
  install -Dm 644 resources.pak -t "$pkgdir"/opt/"${pkgname}"
  # [FIXME?] libffpmeg.so is not an official library, is it necessary to bring it to AUR ? (currently only lib32-libffpmeg exists in the AUR...)
  install -Dm 644 libffmpeg.so -t "$pkgdir"/opt/"${pkgname}"

  echo -e "${_prefix}Copying the package binaries"
  install -Dm 755 chrome-sandbox -t "$pkgdir"/opt/"${pkgname}"
  install -Dm 755 restream-chat -t "$pkgdir"/opt/"${pkgname}"

  echo -e "${_prefix}Setting up /usr/bin launcher"
  ln -s /opt/"${pkgname}"/restream-chat "$pkgdir"/usr/bin/restream-chat

  echo -e "${_prefix}Setting up desktop icon"
  cp restream-chat.png "$pkgdir"/usr/share/pixmaps/restream-chat.png

  echo -e "${_prefix}Setting up desktop shortcuts"
  sed -e "s|Exec=AppRun|Exec=restream-chat --no-sandbox|" -i restream-chat.desktop
  install -Dm 644 restream-chat.desktop -t "$pkgdir"/usr/share/applications
}
