# Maintainer: a172 <spartan074+aur@gmail.com>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Filipe Laíns <lains@archlinux.org>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Guillaume ALAUX <guillaume@archlinux.org>
# Contributor: Florian Pritz <bluewind at jabber dot ccc dot de>
# Contributor: Peter Wu <peter@lekensteyn.nl>

pkgbase=wireshark
pkgname=('wireshark-libsmi-cli' 'wireshark-libsmi-qt')
pkgver=4.4.8
pkgrel=1
pkgdesc='Network traffic and protocol analyzer/sniffer with SNMP OID resolution'
url='https://www.wireshark.org/'
arch=('x86_64')
license=('GPL-2.0-only')
makedepends=(
  asciidoctor
  bcg729
  brotli
  c-ares
  cmake
  desktop-file-utils
  doxygen
  gcc-libs
  git
  glib2
  glibc
  gnutls
  hicolor-icon-theme
  krb5
  libcap
  libgcrypt
  libmaxminddb
  libnghttp2
  libnl
  libpcap
  libsmi
  libssh
  libxml2
  libxslt
  lua53
  lz4
  minizip
  ninja
  opus
  python
  qt6-5compat
  qt6-multimedia
  qt6-svg
  qt6-tools
  sbc
  snappy
  spandsp
  speexdsp
  zlib-ng
  zstd
)
options=('!emptydirs')
source=(
  "git+https://gitlab.com/wireshark/wireshark.git#tag=v${pkgver}"
  wireshark.sysusers
)
sha512sums=('dd840eb050645ef3dff3f36be0b701fdef5cca40352043dc608ad90541bba7e07e7f95b7f93eff2a48a9019218780142d384c37e4512981ad5f965a9f2128c5c'
            '3956c1226e64f0ce4df463f80b55b15eed06ecd9b8703b3e8309d4236a6e1ca84e43007336f3987bc862d8a5e7cfcaaf6653125d2a34999a0f1357c52e7c4990')
b2sums=('4744cb986b30d449c1c1e2dd45a556514975e4f1cb80059bd279f7a83c4911d9e970a506f6dfbd10a214d6aa15db64c0952c779e7f406fd4d2cc4a61ceea375a'
        '3cebcc993f51eaf0e09673c77e0436598593ef5eff306d880415ccc8eecb32fee93c9a6986f1a7bb0835ab7f9732369d7c5a07e6c053d6293e73a1ea84c58a5c')

build() {
  cd ${pkgbase}
  cmake \
    -B build \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DVCSVERSION_OVERRIDE="Git v${pkgver} packaged as ${pkgver}-${pkgrel}" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_RPATH= \
    -DCMAKE_SKIP_RPATH=ON \
    -DENABLE_LUA=ON \
    -Wno-dev
  ninja -C build -v
}

package_wireshark-libsmi-cli() {
  pkgdesc+=' - CLI tools and data files'
  depends=(
    'bcg729'
    'brotli'
    'c-ares'
    'glib2'
    'glibc'
    'gnutls'
    'krb5'
    libbrotlidec.so
    'libcap'
    libcap.so
    libcares.so
    'libgcrypt'
    libk5crypto.so
    libkrb5.so
    'libmaxminddb'
    'libnghttp2'
    'libpcap'
    libpcap.so
    'libsmi'
    'libssh'
    'libxml2'
    'lua53'
    'lz4'
    'opencore-amr'
    'opus'
    'sbc'
    'snappy'
    'spandsp'
    'speexdsp'
    'zlib-ng'
    'zstd'
  )
  install=wireshark.install
  conflicts=(wireshark wireshark-cli)
  provides=(libwireshark.so libwiretap.so libwsutil.so wireshark-cli)

  cd ${pkgbase}
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
    'desktop-file-utils'
    'gcc-libs'
    'glibc'
    'hicolor-icon-theme'
    'libgcrypt'
    'libnl'
    'libpcap'
    libpcap.so
    'libsmi'
    'libwireshark.so'
    'libwiretap.so'
    'libwsutil.so'
    'minizip'
    'qt6-5compat'
    'qt6-multimedia'
    'qt6-svg'
    'shared-mime-info'
    'speexdsp'
    'wireshark-cli'
    'xdg-utils'
    'zlib-ng'
  )
  provides=(wireshark-qt)
  replaces=(wireshark wireshark-gtk wireshark-common)
  conflicts=(wireshark wireshark-gtk wireshark-common wireshark-qt)

  cd ${pkgbase}
  install -d "${srcdir}/staging"
  DESTDIR="${srcdir}/staging" ninja -C build install

  install -Dm 755 build/run/wireshark -t "${pkgdir}"/usr/bin
  install -Dm 644 build/doc/man_pages/wireshark.1 -t "${pkgdir}"/usr/share/man/man1
  install -Dm 644 build/doc/man_pages/wireshark.html -t "${pkgdir}"/usr/share/doc/wireshark

  cd "${srcdir}"/staging/usr/share
  install -Dm 644 applications/org.wireshark.Wireshark.desktop -t "${pkgdir}"/usr/share/applications
  install -Dm 644 mime/packages/org.wireshark.Wireshark.xml -t "${pkgdir}"/usr/share/mime/packages
  install -Dm 644 metainfo/org.wireshark.Wireshark.metainfo.xml -t "${pkgdir}"/usr/share/metainfo
  mv icons "${pkgdir}"/usr/share/icons
}

# vim: ts=2 sw=2 et:
