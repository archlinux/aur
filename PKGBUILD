# Maintainer: Dominik Nakamura <dnaka91@gmail.com>
# https://github.com/dnaka91/pkgbuilds

pkgbase=graphite-grub-theme
_pkgbase=Graphite-gtk-theme
pkgname=('graphite-grub-theme-default-1080p'
         'graphite-grub-theme-default-2k'
         'graphite-grub-theme-default-4k'
         'graphite-grub-theme-nord-1080p'
         'graphite-grub-theme-nord-2k'
         'graphite-grub-theme-nord-4k')
pkgver=2023.04.26
_pkgver="${pkgver//./-}"
pkgrel=1
pkgdesc="Graphite grub theme"
arch=('any')
url="https://github.com/vinceliuice/Graphite-gtk-theme"
license=('GPL3')
depends=('grub')
makedepends=()
source=("$pkgbase-$pkgver.tar.gz::$url/archive/$_pkgver.tar.gz")
b2sums=('5aebc31ee71c2575594187393623dac7fa89f5438919df00ff28f7c3c6878b35d30bff3ae77ea1d89500e986a07007f6755824ebf8a54d7fc3d20c477fb038fb')

_package() {
  cd "$srcdir/$_pkgbase-$_pkgver"
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/"$_pkgname"

  cd other/grub2
  _name="graphite-$_theme-$_resolution"
  _colorscheme=''
  if [[ "$_theme" != "default" ]]; then
    _colorscheme="-$_theme"
  fi

  install -dm 755 "$pkgdir"/usr/share/grub/themes/"$_name"
  install -Dm 644 common/* -t "$pkgdir"/usr/share/grub/themes/"$_name"
  install -Dm 644 config/theme-"$_resolution".txt "$pkgdir"/usr/share/grub/themes/"$_name"/theme.txt
  install -Dm 644 backgrounds/"$_resolution"/"wave-dark$_colorscheme.png" "$pkgdir"/usr/share/grub/themes/"$_name"/background.png
  install -Dm 644 assets/"logos$_colorscheme"/"$_resolution"/*.png -t "$pkgdir"/usr/share/grub/themes/"$_name"/icons
  install -Dm 644 assets/"assets$_colorscheme"/"$_resolution"/*.png -t "$pkgdir"/usr/share/grub/themes/"$_name"
}

main() {
  for _pkgname in "${pkgname[@]}"; do
    eval "package_$_pkgname() {
      provides=("$_pkgname")
      _pkgname="$_pkgname"
      _theme="$(echo $_pkgname | sed 's/graphite-grub-theme-//' | awk -F '-' '{print $1}')"
      _resolution="$(echo $_pkgname | sed 's/graphite-grub-theme-//' | awk -F '-' '{print $2}')"
      _package
    }"
  done
}

main
