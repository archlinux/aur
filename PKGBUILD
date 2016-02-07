# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Lubomir 'Kuci' Kucera <kuci24-at-gmail-dot-com>

pkgname=oclhashcat
_pkgname=oclHashcat
pkgver=2.01
pkgrel=1
pkgdesc="Worlds fastest password cracker with dictionary mutation engine (for AMD)"
url='https://hashcat.net/oclhashcat'
arch=('i686' 'x86_64')
license=('custom')
depends=('catalyst-utils>=14.9' 'opencl-catalyst>=14.9')
replaces=('oclhashcat-amd')
conflicts=('oclhashcat-amd')
options=('!strip')
source=(https://hashcat.net/files/${_pkgname}-${pkgver}.7z{,.asc})
sha512sums=('068f900aad1fbed9cbb767d1fdff5a41f98c60c3805c13121fe803e2aa461a8411f4904b5f1716a3dc82b9db4b08258a69a07d3f8aac087ad28b43cc2319e0e1'
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
