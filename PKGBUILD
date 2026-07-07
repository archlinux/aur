# Maintainer: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname=server-manager-portal
pkgver=1.0.0
pkgrel=1
pkgdesc='A premium, fully-automated management and analytics portal for Plex Media Servers.'
arch=(x86_64 aarch64)
url='https://github.com/jl94x4/Server-Manager-Portal'
license=('MIT')
depends=(nodejs)
makedepends=(npm)
backup=(etc/conf.d/server-manager-portal)
options=(!strip !debug)
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
  server-manager-portal.sysusers
  server-manager-portal.tmpfiles
  server-manager-portal.service
  server-manager-portal.conf.d
)
sha256sums=('eafe06903476bf82a59442f96d53cf38faeb49033641eb66eec7d6e3761f99df'
            'ad78f6134d647c0dcdac6fa20aa338c0e6c358fea3e583fe4ad5abc0ddcb664d'
            'f193ab020242b857eff43b6897cf01403769f1ff9cc2b490a106209bbb83d41b'
            '7c5d668a53d9e1625c3e7158a32b3edbd196f0239f4d77270c27c5577b715f90'
            'e9708801ca2a5fff17a5f5eb2acd6bb0273d8d00c8a9348cd7be3aee532abbe0')

build() {
  cd "Server-Manager-Portal-${pkgver}"

  npm ci
  npm run build
  npm ci --omit=dev
  npm cache clean --force
}

package() {
  install -dm755 "${pkgdir}"/usr/lib/server-manager-portal

  cd "Server-Manager-Portal-${pkgver}"
  cp -dr --no-preserve='ownership' ./{lib,static,node_modules} "${pkgdir}"/usr/lib/server-manager-portal/
  cp -d --no-preserve='ownership' ./{package.json,package-lock.json,index.js,index.html,style.css,version.txt} "${pkgdir}"/usr/lib/server-manager-portal/

  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE

  cd "${srcdir}"
  install -Dm644 server-manager-portal.conf.d   "${pkgdir}"/etc/conf.d/server-manager-portal
  install -Dm644 server-manager-portal.sysusers "${pkgdir}"/usr/lib/sysusers.d/server-manager-portal.conf
  install -Dm644 server-manager-portal.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/server-manager-portal.conf
  install -Dm644 server-manager-portal.service  "${pkgdir}"/usr/lib/systemd/system/server-manager-portal.service
  ln -s /var/lib/server-manager-portal/backup   "${pkgdir}"/usr/lib/server-manager-portal/backup
}
