# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

_themename=Monterey
_gitname="$_themename-kde"
pkgname="${_themename,,}-kde-theme-plasmoids-git"
pkgver=1.0.0
pkgrel=1
pkgdesc='Monterey theme for KDE plasma'
url="https://github.com/ProjectOSX/$_gitname"
license=('LGPL3')
arch=(any)
makedepends=('git')
optdepends=('plasma-desktop: for included plasma theme'
            'kvantum-qt5: for included kvantum theme'
            'sddm: for included sddm theme'
            'latte-dock: for included latte theme')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')
provides=(Monterey-kde-theme-plasmoids-git)
conflicts=(Monterey-kde-theme-plasmoids-git monterey-kde-theme-git)
pkgver() {
	cd "${_pkgname}"
    printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
  install -dm0755 "$pkgdir"/usr/share/{aurorae/themes,color-schemes,plasma/{desktoptheme,look-and-feel,plasmoids},Kvantum,sddm/themes,wallpapers,latte/layouts}

  cp -r "$pkgname/aurorae"/* "$pkgdir/usr/share/aurorae/themes"

  cp -r "$pkgname/Kvantum"/* "$pkgdir/usr/share/Kvantum"

  cp -r "$pkgname/color-schemes"/* "$pkgdir/usr/share/color-schemes"

  cp -r "$pkgname/plasma/desktoptheme"/$_themename* "$pkgdir/usr/share/plasma/desktoptheme"
  cp -r "$pkgname/plasma/desktoptheme/icons" "$pkgdir/usr/share/plasma/desktoptheme/$_themename"
  cp -r "$pkgname/plasma/desktoptheme/icons" "$pkgdir/usr/share/plasma/desktoptheme/$_themename-dark"

  cp -r "$pkgname/plasma/look-and-feel"/* "$pkgdir/usr/share/plasma/look-and-feel"

  cp -r "$pkgname/plasma/plasmoids"/* "$pkgdir/usr/share/plasma/plasmoids"

  cp -r "$pkgname/wallpaper"/* "$pkgdir/usr/share/wallpapers"

  for color in "" "-light" "-dark"; do
    cp -r "$pkgname/sddm/$_themename" "$pkgdir/usr/share/sddm/themes/$_themename$color"
    cp "$pkgname/sddm/images/$_themename$color.png" "$pkgdir/usr/share/sddm/themes/$_themename$color/background.png"
    cp "$pkgname/sddm/images/Preview$color.png" "$pkgdir/usr/share/sddm/themes/$_themename$color/Preview.png"

    sed -i "/\Name=/s/$_themename/$_themename$color/" "$pkgdir/usr/share/sddm/themes/$_themename$color/metadata.desktop"
    sed -i "/\Theme-Id=/s/$_themename/$_themename$color/" "$pkgdir/usr/share/sddm/themes/$_themename$color/metadata.desktop"
    sed -i "s/$_themename/$_themename$color/g" "$pkgdir/usr/share/sddm/themes/$_themename$color/Main.qml"
  done

  cp "$pkgname/latte-dock"/* "$pkgdir/usr/share/latte/layouts"
}
