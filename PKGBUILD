# Maintainer:
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Alexander F. Rødseth <xyproto at archlinux dot org>
# Contributor: neverix <nev at ateverix dot io>
# Contributor: Stepan Shabalin <stomperhomp at gmail dot com>

_pkgname='yin-yang'
pkgname="$_pkgname-git"
pkgver=3.2.4.r11.g0cd2fb2
pkgrel=1
pkgdesc="Auto Nightmode for KDE, Gnome, Budgie, VSCode, Atom and more"
arch=('any')
url="https://github.com/oskarsh/Yin-Yang"
license=('MIT')
depends=(
  'hicolor-icon-theme'
  'pyside6'
  'python-psutil'
  'python-systemd'

  # not needed according to namcap
  #'pyside6-tools'
  #'python-dateutil'
  #'python-numpy'
  #'python-six'
  #'shiboken6'
)
makedepends=(
  'git'
)
optdepends=(
  'kvantum-qt5: Kvantum theme support'
)
provides=("$_pkgname")
conflicts=(${provides[@]})
source=(
  "$_pkgname"::"git+$url"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/-beta-/-/;s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  # nothing to do
}

package() {
  depends+=(
    # not needed according to namcap
    # 'python-suntime'
  )

  cd "$srcdir/$_pkgname"
  find . -type f -exec chmod 644 {} \;

  mkdir -p "$pkgdir/opt/yin-yang"
  cp -r ./* "$pkgdir/opt/yin-yang/"

  # copy manifest for firefox extension
  install -Dm0644 resources/yin_yang.json -t "$pkgdir/usr/lib/mozilla/native-messaging-hosts/"

  # copy terminal executive
  install -Dm0755 resources/yin-yang -t "$pkgdir/usr/bin/"

  # copy .desktop file
  install -Dm0644 resources/Yin-Yang.desktop "$pkgdir/usr/share/applications/yin-yang.desktop"

  # copy icon
  install -Dm0644 resources/logo.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/yin_yang.svg"

  # systemd unit files
  install -Dm0644 resources/yin_yang.service -t "$pkgdir//usr/lib/systemd/user/"
  install -Dm0644 resources/yin_yang.timer   -t "$pkgdir//usr/lib/systemd/user/"

  # license
  install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
