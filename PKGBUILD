# Maintainer:
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Alexander F. Rødseth <xyproto at archlinux dot org>
# Contributor: neverix <nev at ateverix dot io>
# Contributor: Stepan Shabalin <stomperhomp at gmail dot com>

_pkgname='yin-yang'
pkgname="$_pkgname-git"
pkgver=3.3.r9.gde1f3eb
pkgrel=1
pkgdesc="Auto Nightmode for KDE, Gnome, Budgie, VSCode, Atom and more"
url="https://github.com/oskarsh/Yin-Yang"
license=('MIT')
arch=('any')

makedepends=(
  'git'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  depends+=(
    'hicolor-icon-theme'
    'pyside6'
    'python-psutil'
    'python-suntime'
    'python-systemd'
    'qt6-positioning'
  )

  cd "$_pkgsrc"

  # fix permissions
  find . -type f -exec chmod 644 {} \;

  # copy files
  mkdir -p "$pkgdir/opt/yin-yang"
  cp --reflink=auto -r ./{designer,resources,yin_yang} "$pkgdir/opt/yin-yang/"

  # manifest for firefox extension
  install -Dm644 resources/yin_yang.json -t "$pkgdir/usr/lib/mozilla/native-messaging-hosts/"

  # script
  install -Dm755 resources/yin-yang -t "$pkgdir/usr/bin/"

  # desktop file
  install -Dm644 resources/Yin-Yang.desktop "$pkgdir/usr/share/applications/yin-yang.desktop"

  # icon
  install -Dm644 resources/logo.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/yin_yang.svg"

  # systemd unit files
  install -Dm644 resources/yin_yang.service -t "$pkgdir//usr/lib/systemd/user/"
  install -Dm644 resources/yin_yang.timer   -t "$pkgdir//usr/lib/systemd/user/"

  # license
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
