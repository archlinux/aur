# Maintainer: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname=server-manager-portal
pkgver=1.9.0
pkgrel=2
_pkgref=8effcd3350cd5714bcf18a7a93b4894ba4e1c47d
pkgdesc='Management and analytics portal for Plex and Jellyfin media servers'
arch=(x86_64 aarch64)
url='https://github.com/jl94x4/Server-Manager-Portal'
license=('MIT')
depends=(nodejs)
makedepends=(npm)
optdepends=(
  'python-flask:      collexions worker'
  'python-flask-cors: collexions worker'
  'python-requests:   collexions worker'
  'python-jsonschema: collexions worker'
  'python-pyjwt:      collexions worker'
  'python-plexapi:    collexions worker'
  'python-psutil:     collexions worker'
  'python-pillow:     collexions worker'
  'python-bcrypt:     collexions worker'
  'python-werkzeug:   collexions worker'
  'gunicorn:          collexions worker'
)
backup=(etc/conf.d/server-manager-portal)
options=(!strip !debug)
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
  server-manager-portal.sysusers
  server-manager-portal.tmpfiles
  server-manager-portal.service
  server-manager-portal.conf.d
)
sha256sums=('59e324bbc6ff4dfb4e53fe29b133fdf063032376e615692f8539760ad44361f4'
            'ad78f6134d647c0dcdac6fa20aa338c0e6c358fea3e583fe4ad5abc0ddcb664d'
            'f193ab020242b857eff43b6897cf01403769f1ff9cc2b490a106209bbb83d41b'
            '1ac767418f1835f1e2d203f9f786d21c7464f841b039fbc3fad629cadc413183'
            'e9708801ca2a5fff17a5f5eb2acd6bb0273d8d00c8a9348cd7be3aee532abbe0')

build() {
  cd "Server-Manager-Portal-${pkgver}"

  export GIT_SHA=${_pkgref}
  npm install --no-audit --no-fund
  npm run build
  node build-version.js
  npm prune --omit=dev
  npm cache clean --force
}

package() {
  install -dm755 "${pkgdir}"/usr/lib/server-manager-portal/collexions

  cd "Server-Manager-Portal-${pkgver}"
  cp -dr --no-preserve='ownership' ./{lib,static,node_modules} "${pkgdir}"/usr/lib/server-manager-portal/
  cp -d --no-preserve='ownership' ./{package.json,package-lock.json,index.js,index.html,style.css,version.txt} "${pkgdir}"/usr/lib/server-manager-portal/
  cp -d --no-preserve='ownership' collexions/{server.py,ColleXions.py,plex_identity.py}                        "${pkgdir}"/usr/lib/server-manager-portal/collexions/

  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE

  cd "${srcdir}"
  install -Dm644 server-manager-portal.conf.d   "${pkgdir}"/etc/conf.d/server-manager-portal
  install -Dm644 server-manager-portal.sysusers "${pkgdir}"/usr/lib/sysusers.d/server-manager-portal.conf
  install -Dm644 server-manager-portal.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/server-manager-portal.conf
  install -Dm644 server-manager-portal.service  "${pkgdir}"/usr/lib/systemd/system/server-manager-portal.service
  ln -s /var/lib/server-manager-portal/backup   "${pkgdir}"/usr/lib/server-manager-portal/backup
}
