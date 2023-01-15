# Contributor: Michael DeGuzis <mdeguzis@gmail.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Sébastien Luttringer

_pkgname=xdg-utils
pkgname=$_pkgname-git
pkgver=1.1.3.r25.g8ae0263
pkgrel=1
pkgdesc='Command line tools that assist applications with a variety of desktop integration tasks (git version)'
url='http://www.freedesktop.org/wiki/Software/xdg-utils/'
arch=('any')
license=('MIT')
provides=($_pkgname)
conflicts=(${provides[@]})
depends=('sh' 'file' 'xorg-xset' 'xorg-xprop') # xset + xprop needed inside xdg-screensaver
makedepends=('docbook-xsl' 'lynx' 'xmlto' 'git')
optdepends=(
  'kde-cli-tools: for KDE Plasma5 support in xdg-open'
  'exo: for Xfce support in xdg-open'
  'pcmanfm: for LXDE support in xdg-open'
  'perl-file-mimeinfo: for generic support in xdg-open'
  'perl-net-dbus: Perl extension to dbus used in xdg-screensaver'
  'perl-x11-protocol: Perl X11 protocol used in xdg-screensaver'
)
source=(
  "git+https://gitlab.freedesktop.org/xdg/xdg-utils.git"
  egrep_is_obsolete.patch::https://gitlab.freedesktop.org/xdg/xdg-utils/-/merge_requests/21.patch
)
md5sums=(
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  # switch from non-standard "egrep" to POSIX "grep -E"
  patch -Np1 -i ../egrep_is_obsolete.patch
}

build() {
  cd "$srcdir/$_pkgname"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="${pkgdir}" install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # install empty directory to prevent xdg-desktop-menu install *.desktop to fail, see FS#33316
  install -dm755 "$pkgdir/usr/share/desktop-directories"
}
