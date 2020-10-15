# AUR Maintainer: Kasei Wang <kasei@kasei.im>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Filipe Laíns <lains@archlinux.org>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Guillaume ALAUX <guillaume@archlinux.org>
# Contributor: Florian Pritz <bluewind at jabber dot ccc dot de>
# Contributor: Peter Wu <peter@lekensteyn.nl>

_pkgbase=wireshark
pkgbase=$_pkgbase-dev
pkgname=('wireshark-dev-cli' 'wireshark-dev-qt')
pkgver=3.3.1
pkgrel=1
pkgdesc='Network traffic and protocol analyzer/sniffer, development version'
url='https://www.wireshark.org/'
arch=('x86_64')
license=('GPL2')
makedepends=('glibc' 'cmake' 'ninja' 'c-ares' 'libmaxminddb' 'qt5-tools' 'qt5-svg'
             'qt5-multimedia' 'krb5' 'libpcap' 'libssh' 'libxml2' 'libnghttp2'
             'snappy' 'lz4' 'spandsp' 'gnutls' 'lua52' 'python' 'libcap' 'libnl'
             'glib2' 'libgcrypt' 'sbc' 'bcg729' 'desktop-file-utils' 'libxslt'
             'hicolor-icon-theme' 'zstd' 'zlib' 'gcc-libs' 'brotli' 'asciidoctor'
             'doxygen' 'minizip' 'speexdsp')
options=('!emptydirs')
source=(https://www.wireshark.org/download/src/${_pkgbase}-${pkgver}.tar.xz
        wireshark.sysusers)
sha512sums=('d6f50c14e79dff0fb902f5b06a2fb5a6975e5b17461205ab3275b05a53df606a5b1e488e8472cc644541b653df7d5f4a3c7009e38a2f75242af4ea2f59af061f'
            '3956c1226e64f0ce4df463f80b55b15eed06ecd9b8703b3e8309d4236a6e1ca84e43007336f3987bc862d8a5e7cfcaaf6653125d2a34999a0f1357c52e7c4990')
b2sums=('d8973b9724bece1b9890ed468280bcef56f2ac4f1022882f520140db98dab1e81071f3621fda247a80a8e51ad18a77c606f077efbb3d0e13dea47f986a5300e5'
        '3cebcc993f51eaf0e09673c77e0436598593ef5eff306d880415ccc8eecb32fee93c9a6986f1a7bb0835ab7f9732369d7c5a07e6c053d6293e73a1ea84c58a5c')

prepare() {
  cd ${_pkgbase}-${pkgver}
  sed 's| Rev Unknown from unknown||' -i tools/make-version.pl
}

build() {
  cd ${_pkgbase}-${pkgver}
  cmake \
    -B build \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_RPATH= \
    -DCMAKE_SKIP_RPATH=ON \
    -Wno-dev
  ninja -C build -v
}

package_wireshark-dev-cli() {
  pkgdesc+=' - CLI tools and data files'
  depends=('glibc' 'c-ares' 'libmaxminddb' 'krb5' 'libgcrypt' 'libcap' 'libpcap'
           'gnutls' 'glib2' 'lua52' 'libssh' 'libxml2' 'libnghttp2' 'snappy'
           'lz4' 'spandsp' 'sbc' 'bcg729' 'zstd' 'zlib' 'brotli' 'speexdsp')
  install=wireshark.install
  conflicts=(wireshark wireshark-cli)
  provides=(libwireshark.so libwiretap.so libwsutil.so)

  cd ${_pkgbase}-${pkgver}
  DESTDIR="${pkgdir}" ninja -C build install

  # wireshark uid group is 150
  install -Dm 644 "${srcdir}/wireshark.sysusers" "${pkgdir}/usr/lib/sysusers.d/wireshark.conf"
  chgrp 150 "${pkgdir}/usr/bin/dumpcap"
  chmod 754 "${pkgdir}/usr/bin/dumpcap"

  cd "${pkgdir}"
  rm -r usr/share/mime \
    usr/share/icons \
    usr/share/man/man1/wireshark.1 \
    usr/share/doc/wireshark/wireshark.html \
    usr/bin/wireshark \
    usr/share/applications/wireshark.desktop \
    usr/share/appdata/wireshark.appdata.xml
}

package_wireshark-dev-qt() {
  pkgdesc+=' - Qt GUI'
  depends=('glibc' 'desktop-file-utils' 'qt5-multimedia' 'qt5-svg'
           'wireshark-dev-cli' 'libwireshark.so' 'libwiretap.so' 'libwsutil.so'
           'shared-mime-info' 'hicolor-icon-theme' 'xdg-utils' 'gcc-libs'
           'zlib' 'libpcap' 'libgcrypt' 'libnl' 'minizip')
  replaces=(wireshark wireshark-gtk wireshark-common)
  conflicts=(wireshark wireshark-gtk wireshark-common wireshark-qt)

  cd ${_pkgbase}-${pkgver}
  install -d "${srcdir}/staging"
  DESTDIR="${srcdir}/staging" ninja -C build install

  install -Dm 755 build/run/wireshark -t "${pkgdir}/usr/bin"
  install -Dm 644 build/doc/wireshark.1 -t "${pkgdir}/usr/share/man/man1"
  install -Dm 644 build/doc/wireshark.html -t "${pkgdir}/usr/share/doc/wireshark"
  install -Dm 644 wireshark.desktop -t "${pkgdir}/usr/share/applications"
  install -Dm 644 wireshark.appdata.xml -t "${pkgdir}/usr/share/appdata"
  install -Dm 644 wireshark-mime-package.xml "${pkgdir}/usr/share/mime/packages/wireshark.xml"
  mv "${srcdir}/staging/usr/share/icons" "${pkgdir}/usr/share/icons"
}

# vim: ts=2 sw=2 et:
