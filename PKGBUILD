# Maintainer: John-Michael Mulesa <jmulesa at gmail dot com>

pkgname=broforce-steam
_pkgname=broforce
pkgver=1130_20201008
pkgrel=1
_steamid=274190
pkgdesc="Broforce Linux-native with data via Steam"
arch=("i686" "x86_64")
url="https://store.steampowered.com/app/274190/Broforce/"
license=("custom")
groups=("games")
provides=('broforce')
conflicts=('broforce-gog')
source=("${_pkgname}.sh" "${_pkgname}.desktop")
depends=(libgl libx11 libxext desktop-file-utils)
makedepends=('steamcmd')
sha256sums=('d7d6801f8928f0929b88f318cc18abc3c75664c598e8d549cc877c5cf2a6ceb9'
            'f4d0ab0b9014724ded958a7cf4a6c62e6bcc056c1ffc27ea21a11d506f22bebf')

prepare() {
    mkdir -p $srcdir/${_pkgname}

    # Use steamcmd to get data.
    printf "Enter your Steam username:"
    read steam_username
    steamcmd +@sSteamCmdForcePlatformType linux +@ShutdownOnFailedCommand 1 +force_install_dir $srcdir/${_pkgname} +login $steam_username "+app_update ${_steamid} validate" +quit
}

package() {
  # game files
  mkdir -p "${pkgdir}/opt/${_pkgname}"
  cp -r "${srcdir}/${_pkgname}/"* "${pkgdir}/opt/${_pkgname}/"
  rm -rf "${pkgdir}/opt/${_pkgname}/steamapps"

  # launcher and permissions
  # Note: Saves and Levels data may be permissions restricted to one user by default.
  chmod 755 "${pkgdir}/opt/${_pkgname}/Broforce.x86_64"
  chmod 755 "${pkgdir}/opt/${_pkgname}/Broforce.x86"
  chmod 777 "${pkgdir}/opt/${_pkgname}"
  install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"

  # desktop environment integration
  install -Dm644 \
    "${srcdir}/${_pkgname}/Broforce_Data/Resources/UnityPlayer.png" \
    "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -Dm644 \
    "${srcdir}/${_pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
