# Maintainer: Giovanni Scafora <scafora.giovanni@gmail.com>

pkgname=('svxlink-git')
_pkgname=('svxlink')
pkgver=25.05.1.r69.g44f1dfc
pkgrel=1
arch=('x86_64')
url="https://github.com/sm0svx/svxlink"
license=('GPL-2.0-only' 'LGPL-2.1-only')
source=("${_pkgname}::git+https://github.com/sm0svx/svxlink.git")
sha256sums=('SKIP')
depends=('gsm' 'alsa-lib' 'openssl' 'speex' 'opus' 'python' 'popt' 'libgpiod'
         'libsigc++' 'gcc-libs' 'curl' 'libgcrypt' 'rtl-sdr' 'bash' 'python-yaml'
         'python-requests' 'tcl' 'libogg' 'jsoncpp' 'python-cryptography')
makedepends=('git' 'cmake' 'doxygen')
pkgdesc="Advanced repeater controller and EchoLink software for Linux"
optdepends=('svxlink-sounds-en_us-heather-16k: provides speech sound files in high quality')
backup=('etc/svxlink/svxlink.conf'
        'etc/svxlink/TclVoiceMail.conf'
        'etc/svxlink/remotetrx.conf'
        'etc/svxlink/svxlink.d/ModuleDtmfRepeater.conf'
        'etc/svxlink/svxlink.d/ModuleEchoLink.conf'
        'etc/svxlink/svxlink.d/ModuleHelp.conf'
        'etc/svxlink/svxlink.d/ModuleMetarInfo.conf'
        'etc/svxlink/svxlink.d/ModuleParrot.conf'
        'etc/svxlink/svxlink.d/ModulePropagationMonitor.conf'
        'etc/svxlink/svxlink.d/ModuleSelCallEnc.conf'
        'etc/svxlink/svxlink.d/ModuleTclVoiceMail.conf')
install=svxlink.install

pkgver() {
  cd "${srcdir}/${_pkgname}"
  (
    set -o pipefail
    git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build(){
  cd "${srcdir}/${_pkgname}/src"
  mkdir -p build 
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -DSYSTEMD_CONFIGURATIONS_FILES_DIR=/usr/lib/systemd/system \
        -DCMAKE_INSTALL_SBINDIR=/usr/bin \
        -DSYSCONF_INSTALL_DIR=/etc \
        -DLOCAL_STATE_DIR=/var \
        -DWITH_SYSTEMD=ON \
        -DUSE_QT=OFF ..
  make
  make doc
}

package(){
  make -C ${srcdir}/${_pkgname}/src/build DESTDIR="${pkgdir}" install
}
