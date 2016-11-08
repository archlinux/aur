# Maintainer: Peter Wu <peter@lekensteyn.nl>
# Contributor: Daniel Nagy <danielnagy at gmx de>

pkgname=wireshark-git
pkgver=2.3.0rc0+1430+g7531318
pkgrel=1
pkgdesc="A free network protocol analyzer for Unix/Linux. GIT version"
arch=('i686' 'x86_64')
url="https://www.wireshark.org/"
license=('GPL2')
depends=(
        'c-ares'
        'geoip'
        'glib2'
        'libcap'
        'libpcap'
        'lua52'

        # wireshark-qt dependencies
        'qt5-multimedia'
        'qt5-tools'
        # wireshark-gtk (deprecated) depedencies
        #'portaudio'
        # shared between the GUI (for post-installation hook)
        'desktop-file-utils'
        'hicolor-icon-theme'

        # optional dependencies for improved dissection or features
        'gnutls'                # for SSL decryption using RSA keys
        'krb5'
        #'libsmi'
        'nghttp2'               # for HTTP/2 dissector
        'sbc'                   # Bluetooth audio codec
        'snappy' 'lz4'          # for cql dissector

        # extcap (sshdump, etc.)
        'libssh'
)
optdepends=(
        'qt5-svg: for SVG icons in the Qt GUI'
)
# perl-parse-yapp is only needed as build-time dependency if you are actually
# going to regenerate pidl dissectors (unlikely for the majority of users).
makedepends=('cmake' 'git' 'ninja' 'python')
provides=('wireshark')
conflicts=('wireshark-common' 'wireshark-gtk' 'wireshark-qt' 'wireshark-cli')
replaces=('ethereal')
install=$pkgname.install
source=("git+https://code.wireshark.org/git/wireshark")
sha256sums=('SKIP')


pkgver() {
  cd "$srcdir/wireshark"
  git describe --long --match=v\* | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd "$srcdir/wireshark"

  # For .desktop and icon files. https://code.wireshark.org/review/18708
  git fetch https://code.wireshark.org/review/wireshark refs/changes/08/18708/1 &&
  git cherry-pick --no-commit FETCH_HEAD
}

build() {
  cd "$srcdir/wireshark"
  mkdir -p build
  cd build

  cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  ninja
}

package() {
  cd "$srcdir/wireshark/build"
  DESTDIR="${pkgdir}" ninja install

  # GID for wireshark is 150
  chgrp 150 "${pkgdir}/usr/bin/dumpcap"
  chmod 754 "${pkgdir}/usr/bin/dumpcap"
}

# vim:set ts=2 sw=2:
