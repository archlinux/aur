# Maintainer: Tuhana GAYRETLİ <tuhana at proton dot me>
# shellcheck disable=SC2034,SC2148,SC2164,SC2154

pkgname=kde-material-you-colors-git
_pkgname=${pkgname%-git}
pkgver=0.9.1.r11.g2d304b5
pkgrel=1
pkgdesc='Automatic Material You Colors generator from your wallpaper for the Plasma Desktop - Git dev branch version'
arch=(x86_64)
url='https://github.com/luisbocanegra/kde-material-you-colors/tree/dev'
license=(GPL3)
makedepends=(git)
depends=(
  dbus-python
  python-numpy
  python-material-color-utilities
)
optdepends=(
  'python-colr: colored hex codes printing'
  'python-pywal: theme other programs using Material You Colors'
)
conflicts=("$_pkgname")
provides=("$_pkgname")
source=("$pkgname::git+${url/\/tree\/dev/}.git#branch=dev")
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname/src"
  python -m compileall ./*.py
}

package() {
  cd "$srcdir/$pkgname/src"

  local files=(
    color_utils.py
    extra_image_utils.py
    kde-material-you-colors
    kde-material-you-colors.desktop
    sample_config.conf
    schemeconfigs.py
    utils.py
  )

  for file in "${files[@]}"; do
    if [ "$file" == "kde-material-you-colors.desktop" ] || [ "$file" == "sample_config.conf" ]; then
      install -Dm644 -t "$pkgdir/usr/lib/$_pkgname" "$file" && continue
    fi

    install -Dm755 -t "$pkgdir/usr/lib/$_pkgname" "$file"
  done

  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/$_pkgname/kde-material-you-colors "$pkgdir/usr/bin/kde-material-you-colors"

  install -Dm644 -t "$pkgdir/usr/share/doc/$_pkgname" ../README.md
}
