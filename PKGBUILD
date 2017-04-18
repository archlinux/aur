# $Id$
# Maintainer: Vincent Loupmon <vincentloupmon@gmail.com>
#
# To enable 24 bit color in the terminal one must define the environment
# variable ITERM_24BIT=1 or KONSOLE_DBUS_SESSION=1
#
# Derived from emacs-nox && emacs-24bit packages

pkgname=emacs-nox-24bit
pkgver=25.1
pkgrel=1
pkgdesc="The extensible, customizable, self-documenting real-time display editor, without X11 support patched for 24bit colouring"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/emacs/emacs.html"
license=('GPL3')
depends=('dbus' 'ncurses' 'perl' 'libxml2' 'glib2' 'gnutls')
provides=('emacs')
conflicts=('emacs emacs-nox emacs-24bit')
source=(ftp://ftp.gnu.org/gnu/emacs/emacs-$pkgver.tar.xz{,.sig}
        https://gist.githubusercontent.com/choppsv1/3364fd6658ef498b5e06151217187017/raw/b9ba9e9000685abecf7ad954050b182eaef823e1/emacs-25.1-24bit.diff)

validpgpkeys=('28D3BED851FDF3AB57FEF93C233587A47C207910')
sha256sums=('19f2798ee3bc26c95dca3303e7ab141e7ad65d6ea2b6945eeba4dbea7df48f33'
            'SKIP'
            'e07dfcbe420c8fd08cc3286d6779fda6ca29ee14b05ed0c47ea1f417b90ea9b1')

prepare() {
        cd "$srcdir/emacs-${pkgver/_/}"
        patch -Np1 -i ../emacs-25.1-24bit.diff
}

build() {
  cd "${srcdir}"/emacs-$pkgver

  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib \
    --localstatedir=/var --without-x --without-sound
  make
}

package() {
  cd "${srcdir}"/emacs-$pkgver
  make DESTDIR="${pkgdir}" install

# remove conflict with ctags package
  mv "${pkgdir}"/usr/bin/{ctags,ctags.emacs}
  mv "${pkgdir}"/usr/share/man/man1/{ctags.1.gz,ctags.emacs.1}

# fix user/root permissions on usr/share files
  find "${pkgdir}"/usr/share/emacs/$pkgver -exec chown root.root {} \;
# remove .desktop file and icons
  rm -rf "${pkgdir}"/usr/share/{applications,icons}
# fix perms on /var/games
  chmod 775 "${pkgdir}"/var/games
  chmod 775 "${pkgdir}"/var/games/emacs
  chmod 664 "${pkgdir}"/var/games/emacs/*
  chown -R root:games "${pkgdir}"/var/games
}