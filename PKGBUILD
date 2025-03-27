# Maintainer: Attila Deak <plasticbomb1986@gmail.com>
# Contributor: Mateusz Galazyn <carbolymer@gmail.com>

pkgname='tdarr'
pkgver=2.36.01
pkgrel=1
pkgdesc='Transcoding application manager for processing media libraries. Server + Node'
arch=('x86_64')
url='https://tdarr.io/'

options=(!strip)

depends=()

makedepends=('unzip')

optdepends=()

source=(
  "https://f000.backblazeb2.com/file/tdarrs/versions/2.36.01/linux_x64/Tdarr_Server.zip"
  "https://f000.backblazeb2.com/file/tdarrs/versions/2.36.01/linux_x64/Tdarr_Node.zip"
  'tdarr-node.service'
  'tdarr-server.service'
  'tdarr.sysusers'
  'tdarr.tmpfiles'
)

noextract=(
  'Tdarr_Server.zip'
  'Tdarr_Node.zip'
)
sha256sums=(
	    'f38dfaf4243a7be8bd49d58bcb58e2e1d8b6590c349b83f02fd15696b9f9172d'
	    '51149a0101212fb93fb0682a2b6d9ea1e596514e52e83ecabde8a53d36c4f42e'
            '95e7c43861b6af12ff935063ede0287b6bb2d753299c5f26ca8e1841727dbdbb'
            'cb11e62960ae73e21a13db5df0ad30d2ffff930108dc2d8e4321079a31c30d4e'
            '3400d977769056ad626c065ada7fe74f3a2370b4faa090706110e7acedf70ffc'
            '12cbabe6a417d17b30176c6f6916616fa86e0384ec8489e79551278808ec6376')

prepare() {
  mkdir -p "${srcdir}/server" "${srcdir}/node"
  unzip Tdarr_Node.zip -d "${srcdir}/node"
  unzip Tdarr_Server.zip -d "${srcdir}/server"
}

package() {
  install -d -m 755 "${pkgdir}/var/lib/tdarr/server"
  install -d -m 755 "${pkgdir}/var/lib/tdarr/node"
  cp -dpr --no-preserve=ownership "${srcdir}/server/"* "${pkgdir}/var/lib/tdarr/server"
  cp -dpr --no-preserve=ownership "${srcdir}/node/"* "${pkgdir}/var/lib/tdarr/node"

  install -D -m 644 "${srcdir}/tdarr.sysusers" "${pkgdir}/usr/lib/sysusers.d/tdarr.conf"
  install -D -m 644 "${srcdir}/tdarr-node.service" "${pkgdir}/usr/lib/systemd/system/tdarr-node.service"
  install -D -m 644 "${srcdir}/tdarr-server.service" "${pkgdir}/usr/lib/systemd/system/tdarr-server.service"
  install -D -m 644 "${srcdir}/tdarr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/tdarr.conf"
}
