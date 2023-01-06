# Maintainer: Edward <edward at edward-p dot xyz>
pkgname=colloid-kde-theme-git
_themeName=Colloid
_gitname="$_themeName-kde"
pkgver=r32.315a8fb
pkgrel=1
pkgdesc="colloid theme for KDE Plasma"
arch=('any')
url="https://github.com/vinceliuice/${_gitname}"
license=('GPL3')
optdepends=('plasma-desktop: for included plasma theme' 'kvantum-qt5: for included kvantum theme' 'sddm: for included sddm theme' 'whitesur-icon-theme-git: matching icon theme' 'whitesur-cursor-theme-git: matching cursor theme' 'whitesur-gtk-theme-git: matching gtk theme') 
makedepends=('git')
provides=('colloid-kde-theme')
source=("git+${url}.git")
sha256sums=('SKIP')
pacsave=('/usr/share/sddm/themes/Colloid-dark/theme.conf.user'
  '/usr/share/sddm/themes/Colloid-light/theme.conf.user')

pkgver() {
   cd ${_gitname}
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
   # make folders
   mkdir -p "${pkgdir}/usr/share/aurorae/themes"
   mkdir -p "${pkgdir}/usr/share/color-schemes"
   mkdir -p "${pkgdir}/usr/share/plasma/desktoptheme"
   mkdir -p "${pkgdir}/usr/share/plasma/look-and-feel"
   mkdir -p "${pkgdir}/usr/share/Kvantum"
   mkdir -p "${pkgdir}/usr/share/sddm/themes"
   mkdir -p "${pkgdir}/usr/share/wallpapers"
   
   # aurorae theme
   cp -r "${srcdir}/${_gitname}/aurorae/${_themeName}"-* "${pkgdir}/usr/share/aurorae/themes"
   for theme in "${pkgdir}/usr/share/aurorae/themes/"*-nord; do
     cp -r "${srcdir}/${_gitname}/aurorae/common-nord"/* $theme
   done
   for theme in "${pkgdir}/usr/share/aurorae/themes/"*-{light,dark,round}; do
     cp -r "${srcdir}/${_gitname}/aurorae/common"/* $theme
   done
   
   # kvantum theme
   cp -r "${srcdir}/${_gitname}/Kvantum"/* "${pkgdir}/usr/share/Kvantum"
   # color scheme
   cp -r "${srcdir}/${_gitname}/color-schemes"/* "${pkgdir}/usr/share/color-schemes"
   # desktop theme
   cp -r "${srcdir}/${_gitname}/plasma/desktoptheme"/${_themeName}* "${pkgdir}/usr/share/plasma/desktoptheme"
   cp -r "${srcdir}/${_gitname}/plasma/desktoptheme/icons" "${pkgdir}/usr/share/plasma/desktoptheme/${_themeName}-light"
   cp -r "${srcdir}/${_gitname}/plasma/desktoptheme/icons" "${pkgdir}/usr/share/plasma/desktoptheme/${_themeName}-dark"
   # look and feel
   cp -r "${srcdir}/${_gitname}/plasma/look-and-feel"/* "${pkgdir}/usr/share/plasma/look-and-feel"
   # wallpaper
   cp -r "${srcdir}/${_gitname}/wallpaper/${_themeName}"-* "${pkgdir}/usr/share/wallpapers"
   # sddm
   for color in {dark,light}; do
     cp -r "${srcdir}/${_gitname}/sddm/${_themeName}" "${pkgdir}/usr/share/sddm/themes/${_themeName}-${color}"
     cp -r  "${srcdir}/${_gitname}/sddm/images/${_themeName}-${color}.png" "${pkgdir}/usr/share/sddm/themes/${_themeName}-${color}/background.png"
     cp -r  "${srcdir}/${_gitname}/sddm/images/Preview-${color}.png" "${pkgdir}/usr/share/sddm/themes/${_themeName}-${color}/Preview.png"

     sed -i "/\Name=/s/Colloid/Colloid-${color}/" "${pkgdir}/usr/share/sddm/themes/${_themeName}-${color}/metadata.desktop"
     sed -i "/\Theme-Id=/s/Colloid/Colloid-${color}/" "${pkgdir}/usr/share/sddm/themes/${_themeName}-${color}/metadata.desktop"
     sed -i "s/Colloid/Colloid-${color}/g" "${pkgdir}/usr/share/sddm/themes/${_themeName}-${color}/Main.qml"
   done   
} 
