# Maintainer: Peter Wu <peter@lekensteyn.nl>
# Contributor: Daniel Nagy <danielnagy at gmx de>

pkgname=wireshark-git
pkgver=2.3.0rc0+1430+g7531318
pkgrel=1
pkgdesc="A free network protocol analyzer for Unix/Linux. GIT version"
arch=('i686' 'x86_64')
license=('GPL2')
depends=(
        'c-ares'
        'geoip'
        'glib2'
        'libpcap'
        'lua52'

        # wireshark-qt dependencies
        'qt5-multimedia'
        'qt5-svg'
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
# perl-parse-yapp is only needed as build-time dependency if you are actually
# going to regenerate pidl dissectors (unlikely for the majority of users).
makedepends=('cmake' 'git' 'ninja' 'python')
url="https://www.wireshark.org/"
source=("git+https://code.wireshark.org/git/wireshark")
sha256sums=('SKIP')
replaces=('ethereal')
provides=('wireshark')
conflicts=('wireshark-common' 'wireshark-gtk' 'wireshark-qt' 'wireshark-cli')
install=$pkgname.install


pkgver() {
  cd "$srcdir/wireshark"
  git describe --long --match=v\* | sed 's/^v//;s/-/+/g'
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
}

# vim:set ts=2 sw=2:
