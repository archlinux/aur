# Maintainer:
# Contributor: Daniel Peukert <dan.peukert@gmail.com>

## useful links
# http://ajaxsoundstudio.com/software/cecilia
# https://github.com/belangeo/cecilia5

_pkgname="cecilia"
pkgname="cecilia-git"
pkgver=5.4.1.r15.gc592f8e
pkgrel=1
pkgdesc='Audio signal processing environment aimed at sound designers - git version'
url="https://github.com/belangeo/cecilia5"
license=('GPL-3.0-or-later')
arch=('any')

makedepends=(
  'git'
  'imagemagick'
)

provides=("cecilia")
conflicts=("cecilia")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  depends+=(
    'python'
    'python-numpy'
    'python-wxpython'

    # AUR
    'python-pyo'
  )

  cd "$_pkgsrc"
  local _libdir="usr/lib/cecilia"

  install -Dm644 "Cecilia5.py" -t "$pkgdir/$_libdir/"
  cp -r --no-preserve=ownership --preserve=mode 'Resources/' "$pkgdir/$_libdir/Resources/"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" <<END
#!/bin/sh
cd '/$_libdir/'
exec python 'Cecilia5.py' "\$@"
END

  install -Dm755 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" <<END
[Desktop Entry]
Type=Application
Name=Cecilia
Comment=Audio signal processing environment aimed at sound designers
Icon=$_pkgname
Exec=$_pkgname
Terminal=false
Categories=AudioVideo;Audio;
END

  install -dm755 "$pkgdir/usr/share/pixmaps/"
  convert "Resources/Cecilia5.ico[4]" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
}
