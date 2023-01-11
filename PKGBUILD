# Maintainer: Peter Wu <peter@lekensteyn.nl>
# Contributor: Daniel Nagy <danielnagy at gmx de>

pkgname=wireshark-git
pkgver=4.1.0rc0+1387+g20a8a8eb0f
pkgrel=1
pkgdesc="A free network protocol analyzer for Unix/Linux. GIT version"
arch=('i686' 'x86_64')
url="https://www.wireshark.org/"
license=('GPL2')
depends=(
        'c-ares'
        'glib2'
        'libcap'
        'libpcap'
        'lua52'
        'libmaxminddb'
        'pcre2'

        # wireshark-qt dependencies
        'qt6-multimedia'
        'qt6-tools'
        'qt6-svg'               # for SVG icons in the Qt GUI
        'qt6-5compat'
        # for post-installation hook
        'desktop-file-utils'

        # optional dependencies for improved dissection or features
        'gnutls'                # for SSL decryption using RSA keys
        'krb5'
        #'libsmi'
        'libnghttp2'            # for HTTP/2 dissector
        'minizip'               # for profile zip files in Qt
        'sbc'                   # Bluetooth audio codec in RTP player
        'snappy' 'lz4'          # for cql dissector
        'brotli'                # brotli decompression in HTTP/HTTP2 dissectors
        'zstd'                  # for Zstd support in Kafka dissector
        'spandsp'               # for G.722/G.726 codec support in RTP player
        #'bcg729'               # for G.729 codec support in RTP player
        'opus'                  # for Opus codec support in RTP player
        #'libilbc'              # for iLBC codec support in RTP player

        # extcap (sshdump, etc.)
        'libssh'
)
# perl-parse-yapp is only needed as build-time dependency if you are actually
# going to regenerate pidl dissectors (unlikely for the majority of users).
makedepends=('cmake' 'git' 'ninja' 'python')
provides=('wireshark' 'wireshark-cli')
conflicts=('wireshark-common' 'wireshark-gtk' 'wireshark-qt' 'wireshark-cli')
replaces=('ethereal')
install=$pkgname.install
# Mirror: "git+https://github.com/wireshark/wireshark"
source=("git+https://gitlab.com/wireshark/wireshark.git"
        wireshark.sysusers)
sha512sums=('SKIP'
            '3956c1226e64f0ce4df463f80b55b15eed06ecd9b8703b3e8309d4236a6e1ca84e43007336f3987bc862d8a5e7cfcaaf6653125d2a34999a0f1357c52e7c4990')


pkgver() {
  cd "$srcdir/wireshark"
  git describe --long --match=v\* | sed 's/^v//;s/-/+/g'
}

build() {
  cd "$srcdir/wireshark"
  mkdir -p build
  cd build

  # Qt6 became the default since v4.1.0rc0-63-gb33210750c, to switch to Qt5:
  # use -DUSE_qt6=OFF below, remove qt6-5compat from depends, rename qt6 to qt5.
  cmake -GNinja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DENABLE_SMI=OFF \
    -DENABLE_BCG729=OFF \
    -DENABLE_ILBC=OFF \
    ..
  ninja
}

package() {
  cd "$srcdir/wireshark/build"
  DESTDIR="${pkgdir}" ninja install

  # GID for wireshark is 150
  install -Dm644 "${srcdir}/wireshark.sysusers" "${pkgdir}/usr/lib/sysusers.d/wireshark.conf"
  chgrp 150 "${pkgdir}/usr/bin/dumpcap"
  chmod 754 "${pkgdir}/usr/bin/dumpcap"
}

# vim: ts=2 sw=2 et:
