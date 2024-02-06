# Maintainer: a172 <spartan074+aur@gmail.com>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Filipe Laíns <lains@archlinux.org>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Guillaume ALAUX <guillaume@archlinux.org>
# Contributor: Florian Pritz <bluewind at jabber dot ccc dot de>
# Contributor: Peter Wu <peter@lekensteyn.nl>

_pkgbase=wireshark
pkgbase="${_pkgbase}-libsmi"
pkgname=("${pkgbase}-cli" "${pkgbase}-qt")
pkgver=4.2.2
pkgrel=1
pkgdesc='Network traffic and protocol analyzer/sniffer with SNMP OID resolution'
url='https://www.wireshark.org/'
arch=('x86_64')
license=('GPL2')
makedepends=('glibc' 'cmake' 'ninja' 'c-ares' 'libmaxminddb' 'qt6-tools' 'qt6-svg'
             'qt6-multimedia' 'qt6-5compat' 'krb5' 'libpcap' 'libssh' 'libxml2' 'libnghttp2'
             'snappy' 'lz4' 'spandsp' 'gnutls' 'lua52' 'python' 'libcap' 'libnl'
             'glib2' 'libgcrypt' 'sbc' 'bcg729' 'desktop-file-utils' 'libxslt'
             'hicolor-icon-theme' 'zstd' 'zlib' 'gcc-libs' 'brotli' 'asciidoctor'
             'doxygen' 'minizip' 'speexdsp' 'opus' 'libsmi')
options=('!emptydirs')
source=(https://www.wireshark.org/download/src/${_pkgbase}-${pkgver}.tar.xz
        wireshark.sysusers)
sha512sums=('a72c4957c7458da85ec9d121330c0c185fa047823b00be88e1218efda5ce43a7e4a3581afefadc003f376da8b89668d835bbead049009a1fdb5d8fbce08ddbb2'
            '3956c1226e64f0ce4df463f80b55b15eed06ecd9b8703b3e8309d4236a6e1ca84e43007336f3987bc862d8a5e7cfcaaf6653125d2a34999a0f1357c52e7c4990')
b2sums=('1a2708764f25beef12f38620814421e5273d81484887b74f0717b67acfc08b061e2b2d479a516d33704823292e216e0a3f1de29df2897884036392a782ca0296'
        '3cebcc993f51eaf0e09673c77e0436598593ef5eff306d880415ccc8eecb32fee93c9a6986f1a7bb0835ab7f9732369d7c5a07e6c053d6293e73a1ea84c58a5c')

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

package_wireshark-libsmi-cli() {
  pkgdesc+=' - CLI tools and data files'
  depends=('glibc' 'c-ares' 'libmaxminddb' 'krb5' 'libgcrypt' 'libcap' 'libpcap'
           'gnutls' 'glib2' 'lua52' 'libssh' 'libxml2' 'libnghttp2' 'snappy'
           'lz4' 'spandsp' 'sbc' 'bcg729' 'zstd' 'zlib' 'brotli' 'speexdsp'
           'opus' 'opencore-amr' libpcap.so libcap.so libbrotlidec.so libcares.so
           libkrb5.so libk5crypto.so 'libsmi')
  install=wireshark.install
  conflicts=(wireshark wireshark-cli)
  provides=(libwireshark.so libwiretap.so libwsutil.so wireshark-cli)

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

package_wireshark-libsmi-qt() {
  pkgdesc+=' - Qt GUI'
  depends=('glibc' 'desktop-file-utils' 'qt6-multimedia' 'qt6-svg' 'qt6-5compat'
           'wireshark-cli' 'libwireshark.so' 'libwiretap.so' 'libwsutil.so'
           'shared-mime-info' 'hicolor-icon-theme' 'xdg-utils' 'gcc-libs'
           'zlib' 'libpcap' 'libgcrypt' 'libnl' 'minizip' 'speexdsp'
           libpcap.so 'libsmi')
  provides=(wireshark-qt)
  replaces=(wireshark wireshark-gtk wireshark-common)
  conflicts=(wireshark wireshark-gtk wireshark-common wireshark-qt)

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
