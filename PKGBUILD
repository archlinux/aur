# Maintainer: a172 <spartan074+aur@gmail.com>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Filipe Laíns <lains@archlinux.org>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Guillaume ALAUX <guillaume@archlinux.org>
# Contributor: Florian Pritz <bluewind at jabber dot ccc dot de>
# Contributor: Peter Wu <peter@lekensteyn.nl>

_pkgbase=wireshark
pkgbase="${_pkgbase}-libsmi"
pkgname=('wireshark-libsmi-cli' 'wireshark-libsmi-qt')
pkgver=4.7.1
pkgrel=1
pkgdesc='Network traffic and protocol analyzer/sniffer with SNMP OID resolution'
url='https://www.wireshark.org/'
arch=(x86_64)
license=(GPL-2.0-only)
makedepends=(
  asciidoctor
  bcg729
  brotli
  c-ares
  cmake
  desktop-file-utils
  doxygen
  git
  glib2
  glibc
  gnutls
  hicolor-icon-theme
  krb5
  libcap
  libgcc
  libgcrypt
  libmaxminddb
  libnghttp2
  libnghttp3
  libnl
  libpcap
  libsmi
  libssh
  libstdc++
  libxml2
  libxslt
  lua54
  lz4
  minizip
  ninja
  opus
  pcre2
  python
  qt6-5compat
  qt6-base
  qt6-multimedia
  qt6-svg
  qt6-tools
  sbc
  snappy
  spandsp
  speexdsp
  systemd-libs
  xxhash
  zlib-ng
  zstd
)
checkdepends=(
  python-pytest
  python-pytest-xdist
)
options=('!emptydirs')
source=(
  "git+https://gitlab.com/wireshark/wireshark.git#tag=v${pkgver}"
  wireshark.sysusers
)
sha512sums=('5ee8b0294d8940f67f7f1e6d01a5e06747b11dd1a274da4a3590e51d2b0c6a42f3fb764ad66ff2ec9b390101e5071dd2bd3ec34b7994f4ec6e3a164c2b428820'
            '3956c1226e64f0ce4df463f80b55b15eed06ecd9b8703b3e8309d4236a6e1ca84e43007336f3987bc862d8a5e7cfcaaf6653125d2a34999a0f1357c52e7c4990')
b2sums=('8d79c7ea412660ab1c1d2eaa0ad5f614b158e6449593bddd4947a46dd9a52b49e771fa64926772220f1abf4475888ce23c176eb90ea309ee01a705bfdba2c623'
        '3cebcc993f51eaf0e09673c77e0436598593ef5eff306d880415ccc8eecb32fee93c9a6986f1a7bb0835ab7f9732369d7c5a07e6c053d6293e73a1ea84c58a5c')

build() {
  cd ${_pkgbase}
  cmake \
    -B build \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DVCSVERSION_OVERRIDE="Git v${pkgver} packaged as ${pkgver}-${pkgrel}" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DCMAKE_SKIP_INSTALL_RPATH=TRUE \
    -DENABLE_LUA=ON \
    -DENABLE_ZLIB=OFF \
    -Wno-dev
  ninja -C build -v
}

check() {
  cd ${_pkgbase}
  ninja -C build -v test
}

package_wireshark-libsmi-cli() {
  pkgdesc+=' - CLI tools and data files'
  depends=(
    bcg729
    brotli
    c-ares
    glib2
    glibc
    gnutls
    krb5
    libbrotlidec.so
    libcap
    libcap.so
    libcares.so
    libgcc
    libgcrypt
    libk5crypto.so
    libkrb5.so
    libmaxminddb
    libnghttp2
    libnghttp3
    libnl
    libpcap
    libpcap.so
    libsmi
    libssh
    libxml2
    lua54
    lz4
    opencore-amr
    opus
    pcre2
    sbc
    snappy
    spandsp
    speexdsp
    systemd-libs
    xxhash
    zlib-ng
    zstd
  )
  install=wireshark.install
  conflicts=(wireshark wireshark-cli)
  provides=(libwireshark.so libwiretap.so libwsutil.so wireshark-cli)

  cd ${_pkgbase}
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
  depends=(
    desktop-file-utils
    glib2
    glibc
    hicolor-icon-theme
    libgcc
    libgcrypt
    libnl
    libpcap
    libpcap.so
    libsmi
    libstdc++
    libwireshark.so
    libwiretap.so
    libwsutil.so
    minizip
    qt6-5compat
    qt6-base
    qt6-multimedia
    qt6-svg
    shared-mime-info
    speexdsp
    wireshark-cli
    xdg-utils
  )
  provides=(wireshark-qt)
  replaces=(wireshark wireshark-gtk wireshark-common)
  conflicts=(wireshark wireshark-gtk wireshark-common wireshark-qt)

  cd ${_pkgbase}
  install -d "${srcdir}/staging"
  DESTDIR="${srcdir}/staging" ninja -C build install

  cd "${srcdir}"/staging
  install -Dm 755 usr/bin/wireshark -t "${pkgdir}"/usr/bin
  install -Dm 644 usr/share/man/man1/wireshark.1 -t "${pkgdir}"/usr/share/man/man1
  install -Dm 644 usr/share/doc/wireshark/wireshark.html -t "${pkgdir}"/usr/share/doc/wireshark

  cd "${srcdir}"/staging/usr/share
  install -Dm 644 applications/org.wireshark.Wireshark.desktop -t "${pkgdir}"/usr/share/applications
  install -Dm 644 mime/packages/org.wireshark.Wireshark.xml -t "${pkgdir}"/usr/share/mime/packages
  install -Dm 644 metainfo/org.wireshark.Wireshark.metainfo.xml -t "${pkgdir}"/usr/share/metainfo
  mv icons "${pkgdir}"/usr/share/icons
}

# vim: ts=2 sw=2 et:
