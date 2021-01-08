# Maintainer: Jeffrey Bouter <aur@kn0x.org>

export PIP_CONFIG_FILE=/dev/null
export PIP_DISABLE_PIP_VERSION_CHECK=true

pkgname=hushboard-git
_pkgname=hushboard
epoch=
pkgver=r02.223b6f9
pkgrel=0
pkgdesc='Mute your microphone while typing.'
arch=(any)
url="https://github.com/stuartlangridge/$_pkgname"
license=(MIT)
depends=(python libappindicator-gtk3 python-gobject python-xlib gtk3)
## EXTRA_DEPENDS ##
makedepends=(python-pip python-wheel git)
checkdepends=()
provides=("$_pkgname")
conflicts=(${provides%=*})  # No quotes, to avoid an empty entry.
noextract=()
source+=("git+https://github.com/stuartlangridge/$_pkgname.git")
md5sums+=(SKIP)
source+=(LICENSE)
md5sums+=(3ce314c6b503c298b2ebba2d176915a4)

pkgver()
{
  cd "$_pkgname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package()
{
  cd "$_pkgname"
  python setup.py install --root="$pkgdir"

  # Install the icon
  install -Dm644 "$srcdir/$_pkgname/hushboard-512.png" "$pkgdir/usr/share/icons/hushboard-512.png"

  # Replace the icon path from SNAP to system location
  sed -i 's/Icon=.*/Icon=\/usr\/share\/icons\/hushboard-512.png/g' "$srcdir/$_pkgname/snap/gui/hushboard.desktop"

  # Install the desktop file
  install -Dm644 "$srcdir/$_pkgname/snap/gui/hushboard.desktop" "$pkgdir/usr/share/applications/hushboard.desktop"
}
