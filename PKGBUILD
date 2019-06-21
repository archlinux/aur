# Maintainer : fuero <fuerob@gmail.com> 

_lua_libdir=/usr/lib/lua/5.3
_bindir=/usr/bin
_instdir=/opt/wh
_wgver=0.0.20190406
_pkgname=WireHub
pkgname=wirehub
pkgdesc='Decentralized, peer-to-peer and secure overlay networks '
pkgver=0.0.20190129
pkgrel=1
url='https://github.com/Gawen/WireHub'
license=('GPL')
arch=('x86_64')
makedepends=('lua' 'libsodium' 'libpcap' 'miniupnpc')
depends=('glibc' 'wireguard-tools' 'lua' 'libsodium' 'libpcap' 'miniupnpc')
install=wirehub.install
backup=('etc/wirehub/config' 'etc/default/wirehub')
source=(
  "https://github.com/Gawen/WireHub/archive/${pkgver}.tar.gz"
  "https://git.zx2c4.com/WireGuard/snapshot/WireGuard-${_wgver}.tar.xz"
  'wirehub@.service'
  'wirehub.default'
  'wirehub.install'
)
sha256sums=(
  '3132f75dff7a35a32dcdbf78e69b48f15ac9734b4562bbd31ee9e686c498b392'
  '2f06f3adf70b95e74a7736a22dcf6e9ef623b311a15b7d55b5474e57c3d0415b'
  '6d65143844f061ab17210a0930d5e2951edf6120df322aab2a35a79af494bd01'
  'f9486f91ab46e6b6fe3c9c6280d4a0e21e1a915ba2aabdb80dc6935e247142ad'
  'fcf0bc04f5768a79303fdee3425a658dd2993fb8f496e6d68c4038847602d6b2'
)

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  rm -rf deps/WireGuard
  cp -R ../WireGuard-${_wgver} deps/WireGuard
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  CFLAGS="${CFLAGS} -DWH_ENABLE_MINIUPNPC -D_BSD_SOURCE -std=gnu99 -Wall -fPIC -I$(pwd)/include $(pkg-config --cflags lua)"
  LDFLAGS="${LDFLAGS} $(pkg-config --libs lua) -lsodium -lpthread -lpcap -lminiupnpc"
  
  make MINIMAL_CFLAGS="${DEFS} ${CFLAGS}" LDFLAGS="${LDFLAGS}"
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  mkdir -p \
    ${pkgdir}${_instdir} \
    ${pkgdir}${_instdir}/tools \
    ${pkgdir}${_lua_libdir} \
    ${pkgdir}${_bindir}
    
  printf "#!/usr/bin/env bash\nexport LUA_PATH=/opt/wh/?.lua\nexec lua ${_instdir}/tools/cli.lua \$@\n" >> ${pkgdir}${_bindir}/wh
  chmod 0755 ${pkgdir}${_bindir}/wh

  cp src/*.lua       ${pkgdir}${_instdir}
  cp src/tools/*.lua ${pkgdir}${_instdir}/tools
  cp .obj/*.so       ${pkgdir}${_lua_libdir}

  install -Dpm 0640 config/public ${pkgdir}/etc/${pkgname}/config
  install -Dpm 0644 ${srcdir}/wirehub@.service ${pkgdir}/usr/lib/systemd/system/wirehub@.service
  install -Dpm 0644 ${srcdir}/wirehub.default ${pkgdir}/etc/default/wirehub
}
