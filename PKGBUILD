# Maintainer: Nicholas Wang <me@nicho1as.wang>
# Contributor: ava1ar <mail(at)ava1ar(dot)me>

pkgname=softethervpn-beta
pkgver=v4.24.9652.beta
pkgrel=3
pkgdesc="Multi-protocol VPN software from University of Tsukuba build with source code from 
official website's download center."
url="http://www.softether.org/"
arch=('i686' 'x86_64')
source=('softethervpn-bridge.service' 
        'softethervpn-client.service' 
        'softethervpn-server.service')
sha1sums=('12a3919aabcdd7531320056a4b43072892232925'
          'ba594c7defb52548369726c56e2cad633019abef'
          '06cd320553daf0dffdf6a81a22d630fbe211fc33')
license=('GPL2')
depends=('bash' 'openssl' 'zlib')
makedepends=('tar')
conflicts=('softethervpn' 'softethervpn-git')

prepare() {
  # clean existing sources if any
  rm -rf "${srcdir}"/SoftEtherVPN
  wget http://www.softether-download.com/files/softether/v4.24-9652-beta-2017.12.21-tree/Source_Code/softether-src-v4.24-9652-beta.tar.gz
  tar xzvf softether-src-v4.24-9651-beta.tar.gz
  mv v4.24-9651 SoftEtherVPN
}

build() {
  cd "${srcdir}"/SoftEtherVPN

  if [ "${CARCH}" == "i686" ]; then 
    cp src/makefiles/linux_32bit.mak Makefile
  elif [ "${CARCH}" == "x86_64" ]; then 
    cp src/makefiles/linux_64bit.mak Makefile
  fi

  # Patches

  # Disable client SSLv3
  patch --binary -p1 < "${srcdir}"/disable_client_sslv3.patch

  make
}

package(){
  cd "${srcdir}"/SoftEtherVPN

  install -Dm444 bin/vpnserver/hamcore.se2 "${pkgdir}"/usr/lib/softethervpn/hamcore.se2
  install -d "${pkgdir}"/usr/bin

  for inst in vpnclient vpnserver vpnbridge vpncmd
  do
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

