# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Filipe Laíns <lains@archlinux.org>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Guillaume ALAUX <guillaume@archlinux.org>
# Contributor: Florian Pritz <bluewind at jabber dot ccc dot de>
# Contributor: Peter Wu <peter@lekensteyn.nl>
_pkgbase=wireshark
pkgbase=wireshark-oqs
pkgname=(wireshark-oqs-cli wireshark-oqs-qt)
pkgver=4.6.2
pkgrel=2
_pkgver_oqs=0.11.0-rc1
_commit_oqs_demos=29d4dccbd547a62e8ba77d3fef1af5d6f8625d60
pkgdesc='Network traffic and protocol analyzer/sniffer'
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
  libnghttp3
  libnl
  libpcap
  libssh
  libxml2
  libxslt
  lua
  lz4
  minizip
  ninja
  opus
  pcre2
  python
  python-jinja
  python-yaml
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
  git+https://gitlab.com/wireshark/wireshark.git#tag=v${pkgver}
  git+https://github.com/open-quantum-safe/oqs-provider.git#tag=$_pkgver_oqs
  https://raw.githubusercontent.com/open-quantum-safe/oqs-demos/$_commit_oqs_demos/wireshark/qsc_template.jinja2
  https://raw.githubusercontent.com/open-quantum-safe/oqs-demos/$_commit_oqs_demos/wireshark/generate_qsc_header.py
  wireshark.sysusers
)
b2sums=('c4ae77c8298b381e2b97a92bf096a1e8e2f6b9a013f3d75b58e5680494eff869bb7acd83aeda81a6a7ed350f2347abbf5abead6e3bc40ab39c079a492c522f6a'
        '5d072ade012bbcf1e52fcf229e9df69439eaf44cf16820ae7ec88323e363514c7d687e9d58aad0dc101146926fbb644907ef765c5e26aa454970a0f493d552d6'
        '8061cdb5ddce084be6566b57bf21f9281ff9cb7ffd986c1968d60e46624afb1a6e9aff02bf0cf065a89b868bc6ab5ceb5c222c1a7913d06db79ee778593a2997'
        '15e4cfa9626dc6f4b0dff7096f7610791ba9b186fa21855a5203bbeb03c27afbe86e876f3dd0a7f7b6f79cb221c896beec344de0701b6ecd86ad40f318bf9019'
        '3cebcc993f51eaf0e09673c77e0436598593ef5eff306d880415ccc8eecb32fee93c9a6986f1a7bb0835ab7f9732369d7c5a07e6c053d6293e73a1ea84c58a5c')

prepare() {
  # Generate header file
  # See https://github.com/open-quantum-safe/oqs-demos/blob/643ef99297fe8c6ebd3587b5dd238d5e7a457037/wireshark/Dockerfile
  cp oqs-provider/oqs-template/generate.yml .
  python generate_qsc_header.py


  # Patch wireshark
  cd $_pkgbase
  cp ../qsc.h epan/dissectors
  sed -i "s/#include \"config.h\"/#include \"config.h\"\n#include \"qsc.h\"/g" epan/dissectors/packet-pkixalgs.c && \
  sed -i "s/#include \"config.h\"/#include \"config.h\"\n#include \"qsc.h\"/g" epan/dissectors/packet-tls-utils.c && \
  sed -i "s/oid_add_from_string(\"sha224\", \"2.16.840.1.101.3.4.2.4\");/oid_add_from_string(\"sha224\", \"2.16.840.1.101.3.4.2.4\");\nQSC_SIGS/g" epan/dissectors/packet-pkixalgs.c && \
  sed -i "s/    { 260\, \"ffdhe8192\" }\, \/\* RFC 7919 \*\//    { 260\, \"ffdhe8192\" }\, \/\* RFC 7919 \*\/\nQSC_KEMS/g" epan/dissectors/packet-tls-utils.c
  sed -i "s/    { 0x080b\, \"rsa_pss_pss_sha512\" }\,/    { 0x080b\, \"rsa_pss_pss_sha512\" }\,\nQSC_KEMS/g" epan/dissectors/packet-tls-utils.c
}

build() {
  cd ${_pkgbase}
  cmake \
    -B build \
    -G Ninja \
    -DVCSVERSION_OVERRIDE="Git v${pkgver} packaged as ${pkgver}-${pkgrel}" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
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

package_wireshark-oqs-cli() {
  pkgdesc+=' - CLI tools and data files'
  depends=(
    bcg729
    brotli
    c-ares
    gcc-libs
    glib2
    glibc
    gnutls
    krb5
    libbrotlidec.so
    libcap
    libcap.so
    libcares.so
    libgcrypt
    libk5crypto.so
    libkrb5.so
    libmaxminddb
    libnghttp2
    libnghttp3
    libnl
    libpcap
    libpcap.so
    libssh
    libxml2
    lua
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
  conflicts=(wireshark-cli)
  provides=(libwireshark.so libwiretap.so libwsutil.so)

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

package_wireshark-oqs-qt() {
  pkgdesc+=' - Qt GUI'
  depends=(
    desktop-file-utils
    gcc-libs
    glib2
    glibc
    hicolor-icon-theme
    libgcrypt
    libnl
    libpcap
    libpcap.so
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
    wireshark-oqs-cli
    xdg-utils
  )
  conflicts=(wireshark-qt)

  cd ${_pkgbase}
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
