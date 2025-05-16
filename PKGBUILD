# Maintainer:
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Alexander F. Rødseth <xyproto at archlinux dot org>
# Contributor: neverix <nev at ateverix dot io>
# Contributor: Stepan Shabalin <stomperhomp at gmail dot com>

_pkgname='yin-yang'
pkgname="$_pkgname-git"
pkgver=4.0.1.r0.gd6b9c4f
pkgrel=2
pkgdesc="Auto Nightmode for KDE, Gnome, Budgie, VSCode, Atom and more"
url="https://github.com/oskarsh/Yin-Yang"
license=('MIT')
arch=('any')

depends=(
  'python'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
  'python-poetry'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

prepare() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  sed -e "s&/opt/&$_site_packages/&" -i "$_pkgsrc"/resources/yin_yang.json

  # adjust resource path
  sed -E -e 's&\./resources/&/usr/share/yin_yang/&g' \
    -i "$_pkgsrc"/yin_yang/daemon_handler.py
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  depends+=(
    'pyside6'
    'python-dateutil'
    'python-psutil'
    'python-requests'
    'python-suntime' # AUR
    'python-systemd'
    'qt6-positioning'
  )

  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # manifest for firefox extension
  install -Dm644 resources/yin_yang.json -t "$pkgdir/usr/lib/mozilla/native-messaging-hosts/"

  # launcher
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/${_pkgname//-/_}.desktop" << END
[Desktop Entry]
Type=Application
Name=Yin & Yang
Comment=$pkgdesc
Exec=${_pkgname//-/_}
Icon=${_pkgname//-/_}
Terminal=false
Categories=Utility;System;Settings
Keywords=night;day;dark;light;color;theme;
END

  # icon
  install -Dm644 resources/icon.svg "$pkgdir/usr/share/pixmaps/${_pkgname//-/_}.svg"

  # resources
  install -Dm644 resources/yin_yang.service -t "$pkgdir/usr/share/${_pkgname//-/_}/"
  install -Dm644 resources/yin_yang.timer -t "$pkgdir/usr/share/${_pkgname//-/_}/"

  # license
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
