# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: Henri Derycke <nheir.kim@gmail.com>

pkgname=bluez-alsa-git
pkgver=4.2.0.r17.g14670ed
pkgrel=1
pkgdesc="Bluetooth audio ALSA backend"
arch=('x86_64'
      'aarch64'
      'armv6h'
      'armv7h')
url="https://github.com/Arkq/${pkgname%-git}"
license=('MIT')
depends=('alsa-lib' 
         'bluez-libs'
         'glib2-devel'
         'libfdk-aac' 
         'sbc'
         'systemd')
makedepends=('git'
             'python-docutils')
optdepends=('lame: build with mp3 support'
            'libbsd: build with hcitop tool'
            'libopenaptx-git: build with libopenaptx for apt-X'
            'mpg123: build with mpg123 decoding support'
            'ncurses: build with hcitop tool'
            'readline: build with bluealsa-rfcomm tool'
            'spandsp: build mSBC codec support')
source=("${pkgname}::git+https://github.com/Arkq/${pkgname%-git}.git")
sha512sums=('SKIP')
install=bluealsa.install

pkgver() {
  cd "${pkgname}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local flags
  
  cd "${pkgname}"
  autoreconf --install --force
  # Options details:
  # https://github.com/Arkq/bluez-alsa/wiki/Installation-from-source#3-configure-the-build-directory
  # Table of additional dependencies:
  # https://github.com/Arkq/bluez-alsa/wiki/Installation-from-source#additional-dependencies
  flags=(#--with-libopenaptx
         #--enable-ldac
         #--enable-mp3lame
         #--enable-mpg123
         #--enable-msbc
         #--enable-ofono
         #--enable-a2dpconf
         #--enable-cli
         #--enable-rfcomm
         #--enable-faststream
         #--enable-hcitop
         #--enable-lc3plus
         #--enable-lc3-swb
         #--enable-midi
         #--enable-upower
         #--enable-debug
         --enable-aac
         --enable-manpages
         --enable-systemd)
  ./configure --prefix=/usr \
      --sysconfdir=/etc \
      "${flags[@]}"
  make
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" install
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
