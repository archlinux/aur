#based on slim PKGBUILD
# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Hugo Ideler <hugoideler@dse.nl>
#
# replabrobin:
#   added xserver_ready command to be executed synchronously
#   after X is started e.g execute VBoxClient-all etc etc

pkgname=slim-xserver-ready
pkgver=1.3.6
pkgrel=5
pkgdesc="graphical login manager for X11 with xserver_ready command"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/slim.berlios/"
license=('GPL2')
conflicts=('slim')
provides=('slim')
depends=('pam' 'libxmu' 'libpng' 'libjpeg' 'libxft' 'libxrandr' 'xorg-xauth'
         'ttf-font')
makedepends=('cmake' 'freeglut')
backup=('etc/slim.conf' 'etc/logrotate.d/slim' 'etc/pam.d/slim'
        'etc/slimlock.conf')
source=(https://downloads.sourceforge.net/project/slim.berlios/slim-$pkgver.tar.gz
        slim-1.3.6-fix-libslim-libraries.patch
        slim-1.3.6-add-sessiondir.patch
        slim-1.3.6-systemd-session.patch
        slim.pam
        slim.logrotate
        slim-1.3.6-xserver-ready.patch
        )
sha256sums=('21defeed175418c46d71af71fd493cd0cbffd693f9d43c2151529125859810df'
            '3dfa697f8c058390c7e02e7aba769475057ef8ddde945dc43b8cb7f9724dbda0'
            '0dffd53a69eb9033a67fad964df6fc150ee7a483e29d8eb8b559010fbd14e5fd'
            '900b7ffe723b741c05bcc0ca857f300a2131a0029c6532eb17be935451bf2c70'
            'b9a77a614c451287b574c33d41e28b5b149c6d2464bdb3a5274799842bca51a4'
            '5bf44748b5003f2332d8b268060c400120b9100d033fa9d35468670d827f6def'
            '209e769b7584c5ef26bc657103bc1b00a5892ab280d361f0117626df419b3f9f'
            )

prepare() {
  cd slim-$pkgver

  # Fix installation path of slim.service
  sed -i 's|set(LIBDIR "/lib")|set(LIBDIR "/usr/lib")|' CMakeLists.txt

  patch -Np1 -i ../slim-1.3.6-fix-libslim-libraries.patch
  patch -Np1 -i ../slim-1.3.6-add-sessiondir.patch
  patch -Np1 -i ../slim-1.3.6-systemd-session.patch
  patch -Np1 -i ../slim-1.3.6-xserver-ready.patch
}

build() {
  cd slim-$pkgver

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SKIP_RPATH=ON \
    -DUSE_PAM=yes \
    -DUSE_CONSOLEKIT=no
  make
}

package() {
  cd slim-$pkgver

  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/slim.pam" "$pkgdir/etc/pam.d/slim"
  install -Dm644 "$srcdir/slim.logrotate" "$pkgdir/etc/logrotate.d/slim"
  install -Dm644 slimlock.conf "$pkgdir/etc/slimlock.conf"

  # Provide sane defaults
  sed -i -e 's|#xserver_arguments.*|xserver_arguments -nolisten tcp vt07|' \
         -e 's|/var/run/slim.lock|/var/lock/slim.lock|' \
    "$pkgdir/etc/slim.conf"
}

# vim:set ts=2 sw=2 et:
