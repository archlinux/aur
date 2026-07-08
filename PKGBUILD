# Maintainer: Pietagorh <pietagorhh at proton dot me>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=xdg-utils-git
pkgver=1.2.1.r922.4493c72
pkgrel=1
pkgdesc="Command line tools that assist applications with a variety of desktop integration tasks (git version)"
arch=('any')
url="https://gitlab.freedesktop.org/xdg/xdg-utils"
license=('MIT')
depends=('sh' 'file')
makedepends=('docbook-xsl' 'lynx' 'xmlto' 'git')
optdepends=('kde-cli-tools: for KDE Plasma5 support in xdg-open'
            'exo: for Xfce support in xdg-open'
            'pcmanfm: for LXDE support in xdg-open'
            'perl-file-mimeinfo: for generic support in xdg-open'
            'perl-net-dbus: Perl extension to dbus used in xdg-screensaver'
            'perl-x11-protocol: Perl X11 protocol used in xdg-screensaver'
            'xorg-xset: for X11 support in xdg-screensaver'
            'xorg-xprop: for X11 support in xdg-screensaver')
provides=("${pkgname%-git}=${pkgver}")
conflicts=("${pkgname%-git}")
source=('git+https://gitlab.freedesktop.org/xdg/xdg-utils.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  # FIX: hardcoded 1.2.1 because the corresponding tag is on branch origin/v1.2.X
  # which only contains a release-note commit. git describe would give 1.2.0 (which is wrong)
  # see https://gitlab.freedesktop.org/xdg/xdg-utils/-/work_items/306
  printf "1.2.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR="${pkgdir}" install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
