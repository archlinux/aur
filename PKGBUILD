# Maintainer: Bruno Silva <brunofernandes at ua dot pt>

pkgbase=wireshark-its
_pkgbase=wireshark
pkgname=('wireshark-cli-its' 'wireshark-qt-its')
pkgver=v2.9.0rc0.r2721.g4b4f4df18d
pkgrel=1
pkgdesc='Network traffic and protocol analyzer/sniffer with ITS (Intelligent Transportation System) plugins'
url='https://www.wireshark.org/'
arch=('x86_64')
license=('GPL2')
makedepends=('cmake' 'ninja' 'c-ares' 'libmaxminddb' 'qt5-tools' 'qt5-svg'
             'qt5-multimedia' 'krb5' 'libpcap' 'libssh' 'libxml2' 'libnghttp2'
             'snappy' 'lz4' 'spandsp' 'gnutls' 'lua52' 'python' 'libcap'
             'glib2' 'libgcrypt' 'sbc' 'bcg729' 'desktop-file-utils'
             'hicolor-icon-theme')
options=('!emptydirs')
source=(${_pkgbase}::git+https://github.com/YannGarcia/wireshark-for-ITS.git#branch=ITS_Protocol_Support
        wireshark.sysusers)
sha512sums=('SKIP'
            '3956c1226e64f0ce4df463f80b55b15eed06ecd9b8703b3e8309d4236a6e1ca84e43007336f3987bc862d8a5e7cfcaaf6653125d2a34999a0f1357c52e7c4990')

pkgver() {
  cd "${_pkgbase}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd ${_pkgbase}
  pwd 
  egrep -nr -lRZ '"Do not treat warnings as errors" OFF' | xargs -0 -l sed -i -e 's/"Do not treat warnings as errors" OFF/"Do not treat warnings as errors" ON/g'
  cmake . -GNinja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_RPATH= \
    -DCMAKE_SKIP_RPATH=ON
  egrep -nr -lRZ '"Do not treat warnings as errors" ON' | xargs -0 -l sed -i -e 's/"Do not treat warnings as errors" ON/"Do not treat warnings as errors" OFF/g'
  ninja
}

package_wireshark-cli-its() {
  pkgdesc+=' - CLI tools and data files'
  depends=('c-ares' 'libmaxminddb' 'krb5' 'libgcrypt' 'libcap' 'libpcap'
           'gnutls' 'glib2' 'lua52' 'libssh' 'libxml2' 'libnghttp2' 'snappy'
           'lz4' 'spandsp' 'sbc' 'bcg729')
  install=wireshark.install
  conflicts=(wireshark wireshark-cli)
  replaces=(wireshark-cli)

  cd ${_pkgbase}
  DESTDIR="${pkgdir}" ninja install

  # wireshark uid group is 150
  install -Dm 644 "${srcdir}/wireshark.sysusers" "${pkgdir}/usr/lib/sysusers.d/wireshark.conf"
  chgrp 150 "${pkgdir}/usr/bin/dumpcap"
  chmod 754 "${pkgdir}/usr/bin/dumpcap"

  cd "${pkgdir}"
  rm -r usr/share/mime \
    usr/share/icons \
    usr/share/man/man1/wireshark.1 \
    usr/bin/wireshark \
    usr/share/applications/wireshark.desktop \
    usr/share/appdata/wireshark.appdata.xml
}

package_wireshark-qt-its() {
  pkgdesc+=' - Qt GUI'
  depends=('desktop-file-utils' 'qt5-multimedia' 'qt5-svg' 'wireshark-cli-its'
           'shared-mime-info' 'hicolor-icon-theme' 'xdg-utils')
  replaces=(wireshark wireshark-gtk wireshark-common wireshark-qt)
  conflicts=(wireshark wireshark-gtk wireshark-common wireshark-qt)

  cd ${_pkgbase}
  install -d "${srcdir}/staging"
  DESTDIR="${srcdir}/staging" ninja install

  install -Dm 755 run/wireshark -t "${pkgdir}/usr/bin"
  install -Dm 644 wireshark.desktop -t "${pkgdir}/usr/share/applications"
  install -Dm 644 doc/wireshark.1 -t "${pkgdir}/usr/share/man/man1"
  install -Dm 644 wireshark.appdata.xml -t "${pkgdir}/usr/share/appdata"
  install -Dm 644 wireshark-mime-package.xml "${pkgdir}/usr/share/mime/packages/wireshark.xml"
  mv "${srcdir}/staging/usr/share/icons" "${pkgdir}/usr/share/icons"
}

# vim: ts=2 sw=2 et:
