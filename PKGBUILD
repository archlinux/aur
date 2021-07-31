# Maintainer: robertfoster

pkgname=peerflix-server
pkgver=0.6.0
pkgrel=1
pkgdesc="Streaming torrent client for node.js with web ui"
arch=('i686' 'x86_64')
url="https://github.com/asapach/peerflix-server"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("${pkgname}.service"
  peerflix.sysusers
  peerflix.tmpfiles
)
options=('!strip')

package() {
  cd $srcdir
  local _npmdir="${pkgdir}/usr/lib/node_modules"
  mkdir -p "${_npmdir}"
  cd "${_npmdir}"
  npm install -g --user root --prefix "${pkgdir}/usr" --production "${pkgname}@$pkgver"

  install -Dm644 "${srcdir}/${pkgname}.service" \
    "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -D -m644 "${srcdir}/peerflix.sysusers" \
    "${pkgdir}/usr/lib/sysusers.d/peerflix.conf"
  install -D -m644 "${srcdir}/peerflix.tmpfiles" \
    "${pkgdir}/usr/lib/tmpfiles.d/peerflix.conf"
  find "${pkgdir}" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
  rm -rf "${_npmdir}/root"
}

sha256sums=('0e7df5ed1521ff0f1f1e039cccdc20b1c92a3b0edc1d38e5e524db37559cd006'
            '669025775203d7e39255be921e51d93781ee74b10d3e8bf22d381035c2605fcc'
            '88da04100ee77e2ac03e87b22636147ff38bb091f9b03e2e7df1e57027a0b2bf')
