# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: Federico Cinelli <cinelli.federico@gmail.com>
# Contributor: Joel Burget <joelburget@gmail.com>
# Contributor: Guff <kasull88@gmail.com>
# Contributor: Renato Aguiar

pkgbase=slim-git
pkgname=slim-git
true && pkgname=('slim-git' 'slimlock-git')
_gitname=slim
pkgver=v1.3.6.3.g741e439.2013.10.03
pkgrel=1
arch=('i686' 'x86_64')
url="http://developer.berlios.de/projects/slim/"
license=('GPL2')
makedepends=('git' 'cmake' 'pam' 'libxmu' 'libpng' 'libjpeg' 'libxft' 'libxrandr')
source=('git://git.berlios.de/slim'
        'slimlock-git.install'
        'slim.conf'
        'http://downloads.sourceforge.net/project/slim.berlios/slim-archlinux-simple.tar.gz'
        'slim-1.3.6-fix-libslim-libraries.patch'
        'slim.pam'
        'slim.logrotate')
md5sums=('SKIP'
         '40af4379e8b17203414356edbf57469f'
         '3f75d2a7a85c08a41b2f75eeb548cd87'
         '7c7aaa255561444a4ae3e9f1dfb4be5d'
         '3b0579dccedff97bbeafa03d58666294'
         '294bc95c215ed04151d02fa90e2bd387'
         '43da096480bf72c3ccec8ad8400f34f0')

pkgver() {
  cd "$_gitname"
  echo $(git describe --tags).$(git log -1 --format="%cd" --date=short) | sed 's:-:.:g'
}

prepare() {
  cd "$srcdir/$_gitname"

  # Fix installation path of slim.service
  sed -i 's|set(LIBDIR "/lib")|set(LIBDIR "/usr/lib")|' CMakeLists.txt

  patch -Np1 -i "$srcdir/slim-1.3.6-fix-libslim-libraries.patch"
}

build() {
  cd "$_gitname"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_RPATH=ON \
    -DUSE_PAM=yes \
    -DUSE_CONSOLEKIT=no \
    -DBUILD_SHARED_LIBS=no
  make
}

package_slim-git() {
  pkgdesc="Desktop-independent graphical login manager for X11 (git)"
  depends=('pam' 'libxmu' 'libpng' 'libjpeg' 'libxft' 'libxrandr')
  conflicts=('slim')
  provides=('slim')
  backup=('etc/slim.conf' 'etc/logrotate.d/slim' 'etc/pam.d/slim')
  cd "$_gitname"
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/slim.pam" "$pkgdir/etc/pam.d/slim"
  install -Dm644 "$srcdir/slim.logrotate" "$pkgdir/etc/logrotate.d/slim"


  # Provide sane defaults
  sed -i -e 's|#xserver_arguments.*|xserver_arguments -nolisten tcp vt07|' \
         -e 's|/var/run/slim.lock|/var/lock/slim.lock|' \
    "$pkgdir/etc/slim.conf"

  # remove slimlock files
  rm "$pkgdir/usr/bin/slimlock" "$pkgdir/usr/share/man/man1/slimlock.1"
}

package_slimlock-git() {
  pkgdesc="Stand-alone lightweight themable screen locker based on SLiM (git)"
  depends=('libxft' 'pam' 'libxrandr' 'libpng' 'libjpeg')
  conflicts=('slimlock' 'slim>=1.3.6')
  backup=('etc/slimlock.conf')
  cd "$_gitname"

  install -Dm755 slimlock "$pkgdir/usr/bin/slimlock"
  install -Dm644 slimlock.conf "$pkgdir/etc/slimlock.conf"
  install -Dm644 slimlock.1 "$pkgdir/usr/share/man/man1/slimlock.1"

  install -D -m644 "$srcdir/slim.conf" "$pkgdir/usr/share/slimlock/example-slim.conf"

  cd "$srcdir/slim-archlinux-simple"

  install -D -m644 slim.theme \
    "$pkgdir/usr/share/slim/themes/slim-archlinux-default/slim.theme"
  install -D -m644 background.png \
    "$pkgdir/usr/share/slim/themes/slim-archlinux-default/background.png"
  install -D -m644 panel.png \
    "$pkgdir/usr/share/slim/themes/slim-archlinux-default/panel.png"
  install -D -m644 preview.png \
    "$pkgdir/usr/share/slim/themes/slim-archlinux-default/preview.png"
}

# vim:set ts=2 sw=2 et:
