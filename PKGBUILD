# Maintainer: Tuhana GAYRETLİ <tuhana at tuta dot io>
# shellcheck disable=SC2034,SC2148,SC2164,SC2154

pkgname=kde-material-you-colors-git
_pkgname=${pkgname%-git}
pkgver=0.2.0BETA.r28.g9258f40
pkgrel=1
pkgdesc="Automatic Material You Colors generator from your wallpaper for the Plasma Desktop - git dev branch version"
arch=("x86_64")
url="https://github.com/luisbocanegra/kde-material-you-colors"
license=("APACHE")
makedepends=("git")
depends=(
  "dbus-python"
  "python-numpy"
)
optdepends=(
  "python-colr: colored hex codes printing"
  "python-pywal: theme other programs using Material You Colors"
)
options=("!strip")
conflicts=("$_pkgname")
provides=("$_pkgname")
source=(
  "git+$url.git#branch=dev"
  "material-color-utility"
)
sha256sums=(
  "SKIP"
  "5092efc5ef592272576d0c1a96ca8bad380221aaea4a7e531b8eddf1a9aae39c"
)

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  python -m compileall ./*.py
}

package() {
  cd "$srcdir/$_pkgname"

  local files=(
    kde-material-you-colors.desktop
    sample_config.conf
    kde-material-you-colors.py
    kde-material-you-colors
    color_scheme.py
    color_utils.py
    schemeconfigs.py
    material-color-utility-bin
    libSkiaSharp.so
  )

  for file in "${files[@]}"; do
    if [ "$file" == "kde-material-you-colors.desktop" ] || [ "$file" == "sample_config.conf" ]; then
      install -Dm644 -t "$pkgdir/usr/lib/$_pkgname" "$file" && continue
    elif [ "$file" == "kde-material-you-colors" ]; then
      install -Dm755 -t "$pkgdir/usr/bin" "$file" && continue
    fi

    install -Dm755 -t "$pkgdir/usr/lib/$_pkgname" "$file"
  done

  install -Dm755 -t "$pkgdir/usr/bin" "$srcdir/material-color-utility"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$_pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$_pkgname" README.md
}
