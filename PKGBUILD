# Maintainer: Lex Black <autumn-wind at web dot de>
# Contributor: matthewbauer <mjbauer95+aur@gmail.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: cantabile <cantabile dot desu at gmail dot com>

_pkgname=xdg-utils
pkgname=$_pkgname-mimeo
# https://gitlab.freedesktop.org/xdg/xdg-utils/commits/master
_commit=1a58bc28f6844898532daf9ee1bf6da7764955a9 # master # 2021-08-05
pkgver=1.1.3+21+g1a58bc2
pkgrel=2
pkgdesc="Command line tools that assist applications with a variety of desktop integration tasks; patched to use mimeo"
arch=('any')
url="https://www.freedesktop.org/wiki/Software/xdg-utils/"
license=('MIT')
depends=('sh' 'which' 'file' 'xorg-xset' 'xorg-xprop') # xset + xprop needed inside xdg-screensaver
makedepends=('docbook-xsl' 'lynx' 'xmlto' 'git')
optdepends=('kde-cli-tools: for KDE Plasma5 support in xdg-open'
            'exo: for Xfce support in xdg-open'
            'pcmanfm: for LXDE support in xdg-open'
            'mimeo: for mimeo support in xdg-open'
            'perl-file-mimeinfo: for generic support in xdg-open'
            'perl-net-dbus: Perl extension to dbus used in xdg-screensaver'
            'perl-x11-protocol: Perl X11 protocol used in xdg-screensaver')
provides=($_pkgname)
conflicts=($_pkgname)
source=(#https://portland.freedesktop.org/download/$_pkgname-$pkgver.tar.gz #{,.asc}
        mimeo-detection.patch
        "git+https://gitlab.freedesktop.org/xdg/xdg-utils.git#commit=$_commit"
        egrep_is_obsolete.patch::https://gitlab.freedesktop.org/xdg/xdg-utils/-/merge_requests/21.patch)
sha256sums=('e5a69feba0e2ded0071118034d19309adc99321ab880a4ac5be64a1e9a506aa0'
            'SKIP'
            '550a8db792bb810168583be02e0c9e665a7a6ce245b48424188be235e35d4799')
#validpgpkeys=('8B75CA7811367175D05F3B03C43570F80CC295E6') # "Per Olofsson <pelle@pqz.se>"

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd $_pkgname #-$pkgver

  # switch from non-standard "egrep" to POSIX "grep -E"
  patch -Np1 -i ../egrep_is_obsolete.patch

  patch -p1 -i "${srcdir}"/mimeo-detection.patch
}

build() {
  cd $_pkgname #-$pkgver
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd $_pkgname #-$pkgver
  make DESTDIR="${pkgdir}" install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # install empty directory to prevent xdg-desktop-menu install *.desktop to fail, see FS#33316
  install -dm755 "$pkgdir"/usr/share/desktop-directories
}
