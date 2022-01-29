# Maintainer: hnicke <dev@nicke.de>
# based on package `xdg-utils`
# the intention of this package is to support `mimeapps.list` being a symlink
# this package serves as an interim solution until https://gitlab.freedesktop.org/xdg/xdg-utils/-/merge_requests/49 is merged
pkgname=xdg-utils-symlink-fix
_commit=b937642a1013b7dcf122a5a0229f3e59b93e4aee
pkgver=1.1.3+21+gb937642
pkgrel=2
pkgdesc="xdg-utils replacement which respects mimeapps.list being a symlink"
arch=('any')
url="https://gitlab.freedesktop.org/xdg/xdg-utils/-/merge_requests/49"
license=('MIT')
conflicts=('xdg-utils')
provides=('xdg-utils')
depends=('sh' 'which' 'file' 'xorg-xset' 'xorg-xprop') # xset + xprop needed inside xdg-screensaver
makedepends=('docbook-xsl' 'lynx' 'xmlto' 'git')
optdepends=('kde-cli-tools: for KDE Plasma5 support in xdg-open'
            'exo: for Xfce support in xdg-open'
            'pcmanfm: for LXDE support in xdg-open'
            'perl-file-mimeinfo: for generic support in xdg-open'
            'perl-net-dbus: Perl extension to dbus used in xdg-screensaver'
            'perl-x11-protocol: Perl X11 protocol used in xdg-screensaver')
source=("git+https://gitlab.freedesktop.org/hnicke/xdg-utils-symlink-fix.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^v//;s/-/+/g'
}

build() {
  cd $pkgname #-$pkgver
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd $pkgname #-$pkgver
  make DESTDIR="${pkgdir}" install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # install empty directory to prevent xdg-desktop-menu install *.desktop to fail, see FS#33316
  install -dm755 "$pkgdir"/usr/share/desktop-directories
}

