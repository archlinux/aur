# Maintainer: qwjyh <urataw421 at gmail dot com>
# Contributor: Tun Win Naing <twnaing(at)outlook(dot)com>
# Contributor: Jonathan Liu <net147@gmail.com>

pkgname=softethervpn
pkgver=v4.42_9798
pkgrel=2
pkgdesc="Multi-protocol VPN Program from University of Tsukuba"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url="https://www.softether.org/"
license=('Apache')
depends=('bash' 'openssl' 'zlib')
source=("https://www.softether-download.com/files/softether/${pkgver//_/-}-rtm-2023.06.30-tree/Source_Code/softether-src-${pkgver//_/-}-rtm.tar.gz"
        'aarch64.patch'
        'linux_32bit.patch'
        'linux_64bit.patch'
        'softethervpn-bridge.service'
        'softethervpn-client.service'
        'softethervpn-server.service')
md5sums=('bd70e9ae9a19c3f227c26d731503cc7f'
         '8b92f69f9d8d852a3739d0e48bad0454'
         '576277be87dd458c8d889d24a0072abe'
         '1b3d536da4b9fa9a79f113089c13252e'
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
