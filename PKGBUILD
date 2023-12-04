# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Filipe Laíns <lains@archlinux.org>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Guillaume ALAUX <guillaume@archlinux.org>
# Contributor: Florian Pritz <bluewind at jabber dot ccc dot de>
# Contributor: Peter Wu <peter@lekensteyn.nl>

pkgbase=wireshark-oqs
_pkgbase=wireshark
pkgname=('wireshark-oqs-cli' 'wireshark-oqs-qt')
pkgver=4.2.0
pkgrel=2
pkgdesc='Network traffic and protocol analyzer/sniffer with support for PQK algorithms'
url='https://www.wireshark.org/'
arch=('x86_64')
license=('GPL2')
makedepends=('glibc' 'cmake' 'ninja' 'c-ares' 'libmaxminddb' 'qt6-tools' 'qt6-svg'
             'qt6-multimedia' 'qt6-5compat' 'krb5' 'libpcap' 'libssh' 'libxml2' 'libnghttp2'
             'snappy' 'lz4' 'spandsp' 'gnutls' 'lua52' 'python' 'libcap' 'libnl'
             'glib2' 'libgcrypt' 'sbc' 'bcg729' 'desktop-file-utils' 'libxslt'
             'hicolor-icon-theme' 'zstd' 'zlib' 'gcc-libs' 'brotli' 'asciidoctor'
             'doxygen' 'minizip' 'speexdsp' 'opus')
options=('!emptydirs')
source=(https://www.wireshark.org/download/src/${_pkgbase}-${pkgver}.tar.xz
        wireshark.sysusers
        https://raw.githubusercontent.com/open-quantum-safe/openssl/OQS-OpenSSL_1_1_1-stable/qsc.h)
b2sums=('0b1f2cb76ee6d5744076d8660056eb1c1ffcf028476c13e5324c0e133d02c916c5cfd66f82511a09ca67a42b46b06a9699b6ca6fce2342636d490699858e0d51'
        '3cebcc993f51eaf0e09673c77e0436598593ef5eff306d880415ccc8eecb32fee93c9a6986f1a7bb0835ab7f9732369d7c5a07e6c053d6293e73a1ea84c58a5c'
        '1cf2132ada0b20a589e0d533afe8cb7d5ae2e23e3453dd1c6938564db1fbb8900dd6fb15f5bbeec9a45404eb05faf0e2c1aaaf2a042e73fdd2cbcc5a6e48ebb5')

prepare() {
  cd ${_pkgbase}-${pkgver}
  # See https://github.com/open-quantum-safe/oqs-demos/blob/main/wireshark/build.sh
  cp ../qsc.h epan/dissectors
  sed -i "s/#include \"config.h\"/#include \"config.h\"\n#include \"qsc.h\"/g" epan/dissectors/packet-pkcs1.c && \
  sed -i "s/#include \"config.h\"/#include \"config.h\"\n#include \"qsc.h\"/g" epan/dissectors/packet-tls-utils.c && \
  sed -i "s/oid_add_from_string(\"sha224\", \"2.16.840.1.101.3.4.2.4\");/oid_add_from_string(\"sha224\", \"2.16.840.1.101.3.4.2.4\");\nQSC_SIGS/g" epan/dissectors/packet-pkcs1.c && \
  sed -i "s/    { 260\, \"ffdhe8192\" }\, \/\* RFC 7919 \*\//    { 260\, \"ffdhe8192\" }\, \/\* RFC 7919 \*\/\nQSC_KEMS/g" epan/dissectors/packet-tls-utils.c
  sed -i "s/    { 0x080b\, \"rsa_pss_pss_sha512\" }\,/    { 0x080b\, \"rsa_pss_pss_sha512\" }\,\nQSC_KEMS/g" epan/dissectors/packet-tls-utils.c
}

build() {
  cd ${_pkgbase}-${pkgver}
  cmake \
    -B build \
    -G Ninja \
    -DVCSVERSION_OVERRIDE="Git v${pkgver} packaged as ${pkgver}-${pkgrel}" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_RPATH= \
    -DCMAKE_SKIP_RPATH=ON \
    -Wno-dev
  ninja -C build -v
}

package_wireshark-oqs-cli() {
  pkgdesc+=' - CLI tools and data files'
  depends=('glibc' 'c-ares' 'libmaxminddb' 'krb5' 'libgcrypt' 'libcap' 'libpcap'
           'gnutls' 'glib2' 'lua52' 'libssh' 'libxml2' 'libnghttp2' 'snappy'
           'lz4' 'spandsp' 'sbc' 'bcg729' 'zstd' 'zlib' 'brotli' 'speexdsp'
           'opus' 'opencore-amr' libpcap.so libcap.so libbrotlidec.so libcares.so
           libkrb5.so libk5crypto.so)
  install=wireshark.install
  conflicts=(wireshark-cli)
  provides=(libwireshark.so libwiretap.so libwsutil.so)

  cd ${_pkgbase}-${pkgver}
  DESTDIR="${pkgdir}" ninja -C build install
  DESTDIR="${pkgdir}" cmake --install build --component Development

  # wireshark uid group is 150
  install -Dm 644 "${srcdir}"/wireshark.sysusers "${pkgdir}"/usr/lib/sysusers.d/wireshark.conf
  chgrp 150 "${pkgdir}"/usr/bin/dumpcap
  chmod 754 "${pkgdir}"/usr/bin/dumpcap

  cd "${pkgdir}"
  rm -r usr/share/mime \
    usr/share/icons \
    usr/share/man/man1/wireshark.1 \
    usr/bin/wireshark \
    usr/share/applications/org.wireshark.Wireshark.desktop \
    usr/share/metainfo/org.wireshark.Wireshark.metainfo.xml \
    usr/share/doc/wireshark/wireshark.html
}

package_wireshark-oqs-qt() {
  pkgdesc+=' - Qt GUI'
  depends=('glibc' 'desktop-file-utils' 'qt6-multimedia' 'qt6-svg' 'qt6-5compat'
           'wireshark-oqs-cli' 'libwireshark.so' 'libwiretap.so' 'libwsutil.so'
           'shared-mime-info' 'hicolor-icon-theme' 'xdg-utils' 'gcc-libs'
           'zlib' 'libpcap' 'libgcrypt' 'libnl' 'minizip' 'speexdsp'
           libpcap.so)
  conflicts=(wireshark-qt)

  cd ${_pkgbase}-${pkgver}
  install -d "${srcdir}/staging"
  DESTDIR="${srcdir}/staging" ninja -C build install

  install -Dm 755 build/run/wireshark -t "${pkgdir}"/usr/bin
  install -Dm 644 build/doc/wireshark.1 -t "${pkgdir}"/usr/share/man/man1
  install -Dm 644 build/doc/wireshark.html -t "${pkgdir}"/usr/share/doc/wireshark

  cd "${srcdir}"/staging/usr/share
  install -Dm 644 applications/org.wireshark.Wireshark.desktop -t "${pkgdir}"/usr/share/applications
  install -Dm 644 mime/packages/org.wireshark.Wireshark.xml -t "${pkgdir}"/usr/share/mime/packages
  install -Dm 644 metainfo/org.wireshark.Wireshark.metainfo.xml -t "${pkgdir}"/usr/share/metainfo
  mv icons "${pkgdir}"/usr/share/icons
}

# vim: ts=2 sw=2 et:
