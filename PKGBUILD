
pkgname=teamspeak-server
pkgver=6.0.0_beta13.1
pkgrel=1
pkgdesc='TeamSpeak 6 dedicated voice server'
arch=('x86_64')
url='https://github.com/teamspeak/teamspeak6-server'
license=('custom:TeamSpeak')
install=teamspeak-server.install
depends=('glibc' 'gcc-libs' 'coreutils' 'systemd')
backup=(
  'etc/teamspeak-server/server.env'
  'etc/teamspeak-server/tsserver.yaml'
  'etc/teamspeak-server/query_ip_allowlist.txt'
  'etc/teamspeak-server/query_ip_denylist.txt'
)
source=(
  "${pkgname}-${pkgver}.tar.xz::https://github.com/teamspeak/teamspeak6-server/releases/download/v${pkgver//_/-}/teamspeak6-server-linux-amd64.tar.xz"
  'teamspeak-server.service'
  'teamspeak-server.sysusers'
  'teamspeak-server.install'
  'server.env'
  'tsserver.yaml'
)
sha256sums=('d5cbaae45e31e664991458a0f10069158964edee143328d4353f2cabcdce921a'
            '94f3e493e86dff93617eb3a7f5c1022511a0bcfa4709056dd23459846a63e0da'
            'a2e17ab22d4012e4fe6fd511c3dad01fd8d6453976dee11740f996e5abc28019'
            'fa71718a9a1d66da15870f7b9766d759aace4d72aa3b014403ab9a38b52e0a5e'
            'fd80b37fe0ae683a43d226a9f55859a34d9d95ec6a9d284f1953475098b1536d'
            '94c365a8eecaad84e9c418c9b301ad31d7e9ed3db11d1045a557ed25ec427327')

package() {
  local serverdir="${pkgdir}/usr/lib/teamspeak-server"
  local sharedir="${pkgdir}/usr/share/teamspeak-server"

  install -d "${serverdir}" "${sharedir}" "${pkgdir}/usr/share/doc/teamspeak-server"
  install -Dm755 tsserver "${serverdir}/tsserver"
  install -Dm644 libssh.so.4 libtsdb_mariadb.so libtsdb_sqlite3.so -t "${serverdir}"

  cp -a sql serverquerydocs "${sharedir}/"
  cp -a doc "${pkgdir}/usr/share/doc/teamspeak-server"
  install -Dm644 CHANGELOG -t "${pkgdir}/usr/share/doc/teamspeak-server"
  install -Dm644 LICENSE THIRD_PARTY_LICENSES -t "${pkgdir}/usr/share/licenses/teamspeak-server"

  install -Dm644 teamspeak-server.service \
    "${pkgdir}/usr/lib/systemd/system/teamspeak-server.service"
  install -Dm644 teamspeak-server.sysusers \
    "${pkgdir}/usr/lib/sysusers.d/teamspeak-server.conf"
  install -Dm640 server.env "${pkgdir}/etc/teamspeak-server/server.env"
  install -Dm644 tsserver.yaml "${pkgdir}/etc/teamspeak-server/tsserver.yaml"
  install -Dm644 /dev/null \
    "${pkgdir}/etc/teamspeak-server/query_ip_allowlist.txt"
  install -Dm644 /dev/null \
    "${pkgdir}/etc/teamspeak-server/query_ip_denylist.txt"
}
