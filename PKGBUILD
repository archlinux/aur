# Maintainer: Krystian Chachuła <krystiancha@gmail.com>

pkgname=xdg-utils-terminal-true-git
pkgbase=xdg-utils-terminal-true
# https://github.com/krystiancha/xdg-utils/commits/master
_commit=4aa0178de7f0e65430fb12fa1b711a064f48ef5c # master # 2019-09-24
pkgver=r772.4aa0178
pkgrel=1
pkgdesc="A fork of xdg-utils with Terminal=true support"
arch=('any')
url="https://github.com/krystiancha/xdg-utils/"
license=('MIT')
depends=('sh' 'xorg-xset') # xset needed inside xdg-screensaver
makedepends=('docbook-xsl' 'lynx' 'xmlto' 'git')
optdepends=('kde-cli-tools: for KDE Plasma5 support in xdg-open'
            'exo: for Xfce support in xdg-open'
            'xorg-xprop: for Xfce support in xdg-open'
            'pcmanfm: for LXDE support in xdg-open'
            'perl-file-mimeinfo: for generic support in xdg-open'
            'perl-net-dbus: Perl extension to dbus used in xdg-screensaver'
            'perl-x11-protocol: Perl X11 protocol used in xdg-screensaver')
provides=('xdg-utils')
conflicts=('xdg-utils')
source=(#https://portland.freedesktop.org/download/$pkgname-$pkgver.tar.gz
        #0001_better_pcmanfm_check.patch
        #drop_obsolete_GNOME_support.patch) #{,.asc}
        "xdg-utils-terminal-true::git+https://github.com/krystiancha/xdg-utils.git#commit=$_commit"
)
#sha1sums=('98294cf332c341b85e481d98e9ea59357fe1efc7'
#          'f5c09cc10d7b88c2033392efd4179da65a1f47b1'
#          '32d4282c2e6c7345ddf04016c91f0defbf88b356')
sha256sums=('SKIP')
#validpgpkeys=('8B75CA7811367175D05F3B03C43570F80CC295E6') # "Per Olofsson <pelle@pqz.se>"

pkgver() {
  cd ${pkgname%-git}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

#prepare() {
#  cd $pkgname #-$pkgver
#	# FS#58707
#	patch -Np1 -i ../0001_better_pcmanfm_check.patch
#	# drop Gnome2 support - FS58096/https://bugs.freedesktop.org/show_bug.cgi?id=90775
#	patch -Np1 -i ../drop_obsolete_GNOME_support.patch

#  NOCONFIGURE=1 ./autogen.sh
#}

build() {
  cd ${pkgname%-git} #-$pkgver
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd ${pkgname%-git} #-$pkgver
  make DESTDIR="${pkgdir}" install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"

  # install empty directory to prevent xdg-desktop-menu install *.desktop to fail, see FS#33316
  install -dm755 $pkgdir/usr/share/desktop-directories
}
