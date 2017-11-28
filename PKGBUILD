# Maintainer: ava1ar <mail(at)ava1ar(dot)me>

pkgname=softethervpn-git
pkgver=v4.22.9634.beta
pkgrel=1
pkgdesc="Multi-protocol VPN software from University of Tsukuba"
url="http://www.softether.org/"
arch=('i686' 'x86_64')
source=('softethervpn-bridge.service' 
        'softethervpn-client.service' 
        'softethervpn-server.service'
        'disable_client_sslv3.patch'
        'openssl.patch')
sha1sums=('12a3919aabcdd7531320056a4b43072892232925'
          'ba594c7defb52548369726c56e2cad633019abef'
          '06cd320553daf0dffdf6a81a22d630fbe211fc33'
          '1533e7ba63ad7a9f2948af44d8a41c0cbe205307'
          'dab67d28b79ebb2373656de9c985e088183a386a')
license=('GPL2')
depends=('bash' 'openssl' 'zlib')
makedepends=('git')

prepare() {
  # clean existing sources if any
  rm -rf "${srcdir}"/SoftEtherVPN

  # cloning only last commit of master branch, since complete repository is pretty heavy
  git clone https://github.com/SoftEtherVPN/SoftEtherVPN.git --single-branch --depth 10
}

pkgver() {
  cd "${srcdir}"/SoftEtherVPN
  git checkout 4df2eb4f9c2a8cf50e0123496bc20470edc21dc4
  git log | grep -o -m1 'v[0-9].*' | tr '-' '.'
}

build() {
  cd "${srcdir}"/SoftEtherVPN

  # Patches

  # Disable client SSLv3
  patch --binary -p1 < "${srcdir}"/disable_client_sslv3.patch
  patch --binary -p1 < "${srcdir}"/openssl.patch

  # copy makefile
  if [ "${CARCH}" == "i686" ]; then 
    cp src/makefiles/linux_32bit.mak Makefile
  elif [ "${CARCH}" == "x86_64" ]; then 
    cp src/makefiles/linux_64bit.mak Makefile
  fi


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
