# Maintainer: hnicke <dev@nicke.de>
# based on package `xdg-utils`
# the intention of this package is to support `mimeapps.list` being a symlink
# this package serves as an interim solution until https://gitlab.freedesktop.org/xdg/xdg-utils/-/merge_requests/49 is merged
# NOTE: This package will get deprecated once v1.2.0 has been released and shipped by the 'xdg-utils' aur package
pkgname=xdg-utils-symlink-fix
_commit=f8bc7454112899413a60996b7b5d9aebfa4e6864
_orig_pkgver=1.2.0-beta1
pkgver="${_orig_pkgver/-/+}"
pkgrel=1
pkgdesc="xdg-utils replacement which respects mimeapps.list being a symlink"
arch=('any')
url="https://gitlab.freedesktop.org/xdg/xdg-utils/-/tags/v1.2.0-beta1"
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
source=("https://gitlab.freedesktop.org/xdg/xdg-utils/-/archive/v$_orig_pkgver/xdg-utils-v$_orig_pkgver.tar")
sha256sums=('34dc0d5fb3f79557fa3821384fb18e3e382ca35f5fbca7f4be8f0d5f4cea45cc')

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

