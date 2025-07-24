# Maintainer: qwjyh <urataw421 at gmail dot com>
# Contributor: Tun Win Naing <twnaing(at)outlook(dot)com>
# Contributor: Jonathan Liu <net147@gmail.com>

pkgname=softethervpn
pkgver=v4.44_9807
releasedate=2025.04.16
pkgrel=1
pkgdesc="Multi-protocol VPN Program from University of Tsukuba"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url="https://www.softether.org/"
license=('Apache')
depends=('bash' 'openssl' 'zlib')
source=("https://www.softether-download.com/files/softether/${pkgver//_/-}-rtm-${releasedate}-tree/Source_Code/softether-src-${pkgver//_/-}-rtm.tar.gz"
        'aarch64.patch'
        'linux_32bit.patch'
        'linux_64bit.patch'
        'softethervpn-bridge.service'
        'softethervpn-client.service'
        'softethervpn-server.service')
md5sums=('4905b5bf4b66b4b97a01dcbc6770b098'
         '8b92f69f9d8d852a3739d0e48bad0454'
         '105f9c01688152265bc4a12787ea29be'
         'f292f5b2afae004e3c6442c32fe7f92a'
         '1d54c0065ae8947bd8455b9e2050c1af'
         'a1134fea991e6e00dc4910b1be16dc73'
         'b54b4f68d56555ddfffc50c2c399624f')

build(){
  cd "${srcdir}/${pkgver//_/-}"
  patch -Np1 -i "${srcdir}/aarch64.patch"

  if [ "${CARCH}" == "i686" ]; then
    patch src/makefiles/linux_32bit.mak "${srcdir}/linux_32bit.patch"
    cp src/makefiles/linux_32bit.mak Makefile
  elif [ "${CARCH}" == "x86_64" ]; then
    patch src/makefiles/linux_64bit.mak "${srcdir}/linux_64bit.patch"
    cp src/makefiles/linux_64bit.mak Makefile
  elif [ "${CARCH}" == "aarch64" ]; then
    patch src/makefiles/linux_64bit.mak "${srcdir}/linux_64bit.patch"
    cp src/makefiles/linux_64bit.mak Makefile
  elif [ "${CARCH}" == "armv7h" ]; then
    patch src/makefiles/linux_32bit.mak "${srcdir}/linux_32bit.patch"
    cp src/makefiles/linux_32bit.mak Makefile
  fi

  make
}

package(){
  cd "${srcdir}/${pkgver//_/-}"

  install -Dm444 bin/vpnserver/hamcore.se2 "${pkgdir}"/usr/lib/softethervpn/hamcore.se2
  install -d "${pkgdir}"/usr/bin

  for inst in vpnclient vpnserver vpnbridge vpncmd; do
    install -Dm755 bin/${inst}/${inst} "${pkgdir}"/usr/lib/softethervpn/${inst}/${inst}
    ln -s /usr/lib/softethervpn/hamcore.se2 "${pkgdir}"/usr/lib/softethervpn/${inst}/hamcore.se2
    echo "#!/bin/sh" > "${pkgdir}"/usr/bin/${inst}
    echo /usr/lib/softethervpn/${inst}/${inst} '"$@"' >> "${pkgdir}"/usr/bin/${inst}
    echo 'exit $?' >> "${pkgdir}"/usr/bin/${inst}
    chmod 755 "${pkgdir}"/usr/bin/${inst}
  done

  install -d "${pkgdir}"/usr/lib/systemd/system
  install -Dm644 "${srcdir}"/*.service "${pkgdir}"/usr/lib/systemd/system
}

# vim:set ts=2 sw=2 et:
