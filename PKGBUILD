pkgbase=redmond97se-themes
pkgname=(
  obsidian-pure-icon-theme
  redmond97se-gtk-theme
  redmond97se-metacity-theme
  redmond97se-wine-theme
  redmond97se-xfwm4-theme
)
pkgver=2.05
pkgrel=1
pkgdesc='Redmond97-SE themes'
arch=('any')
url='https://codeberg.org/Sliver_X/Redmond97-SE'
license=('GPL3')
makedepends=(7zip grep sed tar)
source=("https://codeberg.org/Sliver_X/Redmond97-SE/releases/download/v${pkgver}/Redmond97-SE_v${pkgver}.7z")
sha256sums=('18551c4835a7daa346a29ffe0b28f44d85b7ea003713819f1340abaf453b303a')

prepare() {
  find -type f -executable -exec chmod -x {} \;
}

package_obsidian-pure-icon-theme() {
  url='https://github.com/madmaxms/iconpack-obsidian'
  description='Faenza-based Obsidian Icon theme'
  conflicts=(obsidian-icon-theme)

  mkdir -p "${pkgdir}/usr/share/icons"
  7z x ./icons/Obsidian_Pure.tar.7z
  tar -xvf ./Obsidian_Pure.tar -C "${pkgdir}/usr/share/icons"
  rm ./Obsidian_Pure.tar
}

_package_subthemes() {
  subdir=$1

  declare -a sdirs
  readarray -t sdirs < \
    <(find themes/{Old,New}/ -mindepth 3 -maxdepth 5 -name "${subdir}" -type d)
  for sdir in "${sdirs[@]}"; do
    tdir="$(echo "${sdir}" | grep -o "/Redmond97 SE [^/]*/${subdir}\$")"
    mkdir -p "${pkgdir}/usr/share/themes/${tdir}"
    cp -a "${sdir}"/* "${pkgdir}/usr/share/themes/${tdir}/"
    #copy over index.theme for gtk theme only
    if [ "${sdir}" == "gtk-3.0" ]; then
      install -m0644 "${sdir}/../index.theme" "${pkgdir}/usr/share/themes/${tdir}/../"
    fi
  done
}

package_redmond97se-gtk-theme() {
  pkgdesc='Redmond97-SE GTK and GNOME themes'
  optdepends=(obsidian-pure-icon-theme)
  _package_subthemes 'gtk-2.0'
  _package_subthemes 'gtk-2.0-hidpi'
  _package_subthemes 'gtk-3.0'
  _package_subthemes 'gtk-4.0'
}

package_redmond97se-metacity-theme() {
  pkgdesc='Redmond97-SE Metacity themes'
  optdepends=(redmond97se-gtk-theme metacity)
  _package_subthemes metacity-1
}

package_redmond97se-wine-theme() {
  pkgdesc='Redmond97-SE WINE themes'
  optdepends=(redmond97se-gtk-theme wine)
  _package_subthemes wine
}

package_redmond97se-xfwm4-theme() {
  pkgdesc='Redmond97-SE XFWM4 themes'
  optdepends=(obsidian-pure-icon-theme redmond97se-gtk-theme xfwm4)
  _package_subthemes xfwm4
}

# vim:set ts=2 sw=2 et:
