# Maintainer: Tuhana GAYRETLİ <tuhana at tuta dot io>
# shellcheck disable=SC2034,SC2148,SC2164,SC2154

pkgname=kde-material-you-colors-git
_pkgname=${pkgname%-git}
pkgver=0.2.0BETA.r54.g57f706b
pkgrel=1
pkgdesc="Automatic Material You Colors generator from your wallpaper for the Plasma Desktop - Git dev branch version"
arch=(x86_64)
url="https://github.com/luisbocanegra/kde-material-you-colors/tree/dev"
license=(APACHE)
makedepends=(git)
depends=(
  dbus-python
  python-numpy
)
optdepends=(
  "python-colr: colored hex codes printing"
  "python-pywal: theme other programs using Material You Colors"
)
options=(!strip)
conflicts=("$_pkgname")
provides=("$_pkgname")
source=("$pkgname::git+${url/\/tree\/dev/}.git#branch=dev")
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  python -m compileall ./*.py
}

package() {
  cd "$srcdir/$pkgname"

  local files=(
    kde-material-you-colors.desktop
    sample_config.conf
    kde-material-you-colors
    utils.py
    color_utils.py
    schemeconfigs.py
    material-color-utility-bin
    libSkiaSharp.so
  )

  for file in "${files[@]}"; do
    if [ "$file" == "kde-material-you-colors.desktop" ] || [ "$file" == "sample_config.conf" ]; then
      install -Dm644 -t "$pkgdir/usr/lib/$_pkgname" "$file" && continue
    fi

    install -Dm755 -t "$pkgdir/usr/lib/$_pkgname" "$file"
  done

  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/$_pkgname/material-color-utility-bin "$pkgdir/usr/bin/material-color-utility"
  ln -s /usr/lib/$_pkgname/kde-material-you-colors "$pkgdir/usr/bin/kde-material-you-colors"

  install -Dm644 -t "$pkgdir/usr/share/doc/$_pkgname" README.md
}
