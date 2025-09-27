# Maintainer:
# Contributor: Daniel Peukert <dan.peukert@gmail.com>

_pkgname="cecilia"
pkgname="cecilia-git"
pkgver=5.4.1.r16.g4bf519e
pkgrel=1
pkgdesc="Audio signal processing environment aimed at sound designers"
url="https://github.com/belangeo/cecilia5"
license=('GPL-3.0-or-later')
arch=('any')

makedepends=(
  'git'
  'imagemagick'
  'python'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

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
    'python-numpy'
    'python-pyo' # AUR
    'python-wxpython'
  )

  cd "$_pkgsrc"
  local _libdir="usr/lib/cecilia"
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  # specify python version to prevent untracked pyc files
  local _pyver_major _pyver_minor
  _pyver_major=$(python -c 'import sys; print(sys.version_info.major)')
  _pyver_minor=$(python -c 'import sys; print(sys.version_info.minor)')

  eval "depends+=(
    'python>=${_pyver_major}.${_pyver_minor}'
    'python<${_pyver_major}.$((_pyver_minor + 1))'
  )"

  # files
  install -Dm644 "Cecilia5.py" -t "$pkgdir/$_libdir/"
  cp -r --no-preserve=ownership --preserve=mode 'Resources/' "$pkgdir/$_libdir/Resources/"

  # create pyc files
  python -m compileall -f -p / -s "$pkgdir" "$pkgdir/"

  # icon
  mkdir -pm755 "$pkgdir/usr/share/pixmaps"
  magick "Resources/Cecilia5.ico[4]" "$pkgdir/usr/share/pixmaps/$_pkgname.png"

  # script
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" << END
#!/bin/sh
cd '/$_libdir/'
exec python 'Cecilia5.py' "\$@"
END

  # launcher
  install -Dm755 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << END
[Desktop Entry]
Type=Application
Name=${_pkgname^}
Comment=$pkgdesc
Icon=$_pkgname
Exec=$_pkgname
Terminal=false
Categories=AudioVideo;Audio;
END
}
