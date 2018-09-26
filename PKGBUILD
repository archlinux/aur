# Maintainer: Nicholas Wang <me@nicho1as.wang>
# PKGBUILD Credit: Jonathan Liu <net147@gmail.com>
# Revised based on softethervpn package
pkgname=softethervpn-beta
pkgver=v4.28_9669
pkgrel=1
pkgdesc="Multi-protocol VPN Program from University of Tsukuba"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
source=('https://github.com/SoftEtherVPN/SoftEtherVPN_Stable/releases/download/v4.28-9669-beta/softether-src-v4.28-9669-beta.tar.gz'
        'aarch64.patch'
	'openssl.patch'
        'softethervpn-bridge.service'
        'softethervpn-client.service'
        'softethervpn-server.service')
sha1sums=('7de3577791830d656956cd694b60f803ab4ba055'
          '75d351833c41ee4c54d4ad18dde678e6df47e220'
          '59565cedebeb65452aed776b582bc3b833872686'
          '12a3919aabcdd7531320056a4b43072892232925'
          'ba594c7defb52548369726c56e2cad633019abef'
          '06cd320553daf0dffdf6a81a22d630fbe211fc33')
license=('GPL')
depends=('bash' 'openssl' 'zlib')
url="http://www.softether.org/"

build(){
  cd "${srcdir}/${pkgver//_/-}"
  patch -Np1 -i "${srcdir}/aarch64.patch"
  patch -Np1 -i "${srcdir}/openssl.patch"

  if [ "${CARCH}" == "i686" ]; then
    cp src/makefiles/linux_32bit.mak Makefile
  elif [ "${CARCH}" == "x86_64" ]; then
    cp src/makefiles/linux_64bit.mak Makefile
  elif [ "${CARCH}" == "aarch64" ]; then
    cp src/makefiles/linux_64bit.mak Makefile
  elif [ "${CARCH}" == "armv7h" ]; then
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
