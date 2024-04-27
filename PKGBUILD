# Maintainer: Hauke Stieler <mail@hauke-stieler.de>

pkgname=xdg-utils-override-de
# https://gitlab.freedesktop.org/xdg/xdg-utils/commits/master
_reponame=xdg-utils
_commit=356c380ad6fecc9ce6bea1f6a77986ba67402c80 # tag # 1.2.1
pkgver=1.2.1
pkgrel=1
pkgdesc="Patched version of xdg-utils to override desktop environment for xdg-open."
arch=('any')
url="https://www.freedesktop.org/wiki/Software/xdg-utils/"
license=('MIT')
depends=('sh' 'file' 'xorg-xset' 'xorg-xprop') # xset + xprop needed inside xdg-screensaver
makedepends=('docbook-xsl' 'lynx' 'xmlto' 'git')
optdepends=('kde-cli-tools: for KDE Plasma5 support in xdg-open'
            'exo: for Xfce support in xdg-open'
            'pcmanfm: for LXDE support in xdg-open'
            'perl-file-mimeinfo: for generic support in xdg-open'
            'perl-net-dbus: Perl extension to dbus used in xdg-screensaver'
            'perl-x11-protocol: Perl X11 protocol used in xdg-screensaver')
source=(#https://portland.freedesktop.org/download/$pkgname-$pkgver.tar.gz
        "git+https://gitlab.freedesktop.org/xdg/xdg-utils.git#commit=$_commit"
)
sha256sums=('SKIP')
provides=('xdg-utils')
conflicts=('xdg-utils')

#pkgver() {
#  cd $pkgname
##  git describe --tags | sed 's/^v//;s/-/+/g'
#  # filter tag to avoid need for epoch when the release happens
#  git describe --tags | sed 's/^v//;s/-beta1-/r/;s/-/+/g'
#}

#prepare() {
##  cd $pkgname #-$pkgver
#
##  NOCONFIGURE=1 ./autogen.sh
#
#  cd $pkgname
#}

build() {
  cp ../xdg-open-override-de.patch ./$_reponame/

  cd $_reponame

  git apply xdg-open-override-de.patch

  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

#
# testsuite is not suitable for running in a text chroot
#

#check() {
#  cd $pkgname #-$pkgver
#  # requires a running X environment and browser to run tests
#  # and has interactive programs
#  make -k test
#}

package() {
  cd $_reponame
  make DESTDIR="${pkgdir}" install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # install empty directory to prevent xdg-desktop-menu install *.desktop to fail, see FS#33316
  install -dm755 "$pkgdir"/usr/share/desktop-directories
}

