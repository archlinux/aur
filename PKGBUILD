# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Lubomir 'Kuci' Kucera <kuci24-at-gmail-dot-com>

pkgname=cudahashcat
_pkgname=cudaHashcat
pkgver=2.01
pkgrel=1
pkgdesc="Worlds fastest password cracker with dictionary mutation engine (for NVidia)"
url='https://hashcat.net/oclhashcat/'
arch=('i686' 'x86_64')
license=('custom')
depends=('nvidia-utils>=346' 'opencl-nvidia>=346')
replaces=('oclhashcat-nvidia')
conflicts=('oclhashcat-nvidia')
options=('!strip')
source=(https://hashcat.net/files/${_pkgname}-${pkgver}.7z{,.asc})
sha512sums=('027dbe92a085bc4b115cc8c3705510084dab556292df9f12168cd3f6796a730a77573056a95607a58d8f6527bb91a277861b07b49a941dcc2883e2c94cfb7edf'
            'SKIP')
validpgpkeys=('A70833229D040B4199CC00523C17DA8B8A16544F') # Hashcat signing key <signing@hashcat.net>

package() {
  cd ${_pkgname}-${pkgver}
  find . \( -name "*.cmd" -o -name "*.exe" \) -print | xargs -i rm {}
  install -d "${pkgdir}/opt" "${pkgdir}/usr/bin"
  if [ "${CARCH}" = "x86_64" ]; then
    rm ${_pkgname}32.bin
    mv ${_pkgname}64.bin ${_pkgname}
  else
    rm ${_pkgname}64.bin
    mv ${_pkgname}32.bin ${_pkgname}
  fi
  echo -e "#!/bin/sh\n/opt/${_pkgname}/${_pkgname} \$@" > "${pkgdir}/usr/bin/${_pkgname}"
  chmod +x ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
  chmod -R +r .
  cp -r . "${pkgdir}/opt/${_pkgname}"
}

# vim: ts=2 sw=2 et:
