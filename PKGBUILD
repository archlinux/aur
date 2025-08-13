# Maintainer: Joey Dumont <joey.dumont@gmail.com>
# Maintainer: Bjorn Neergaard <bjorn@neersighted.com>
# Contributor: Danny Su       <contact@dannysu.com>
# Contributor: Lance G.       <gero3977 @gmail.com>
# aarch64 tester: Irissman    <irissman@probus.ca>
# armv7h tester: kauron
pkgname=duplicati-canary-bin
pkgver=2.1.0.125
pkgrel=2
_date=2025-07-15
_branch=canary
pkgdesc="A free backup client that securely stores encrypted, incremental, compressed backups on cloud storage services and remote file servers"
url="http://duplicati.com"
license=('MIT')
install=duplicati.install
source=(
  duplicati-user.service
  duplicati.service
  duplicati.sysusers
  duplicati.tmpfiles.conf
  duplicati.env
)

source_x86_64=(
    "${pkgname}-${pkgver}-x86_64.zip::https://github.com/duplicati/duplicati/releases/download/v${pkgver}_${_branch}_${_date}/duplicati-${pkgver}_${_branch}_${_date}-linux-x64-gui.zip"
)

source_aarch64=(
    "${pkgname}-${pkgver}-aarch64.zip::https://github.com/duplicati/duplicati/releases/download/v${pkgver}_${_branch}_${_date}/duplicati-${pkgver}_${_branch}_${_date}-linux-arm64-gui.zip"
)

noextract=(
    "${pkgname}-${pkgver}.zip"
)

backup=(
  etc/default/duplicati
)

sha256sums=('fbc76396405c645a3b9b7f00973540d4824f0cf634fa8369c6dfe2dd711cb38c'
            'feacc64d9d746aeeeeae4bef004640cbc49a35560aad6ba98c905a0c5ca3291b'
            'b9389b399467f3e02aa8e76bb98f6efbca1166fbc4d0bdf939493f8403462959'
            'b6ca3d280feb753ded94bb44eef821a0dac0c0c7ed7f37dea76d445a64386c86'
            '3200d8d4c73dd677368e9837d07aec93a4cead2fb7d679376f1f8fd67366503c')
sha256sums_x86_64=('b9754bc2ed527b9b0524bd38a0151944dfb542d18cc5f8c9a2e5ab7b4f548e52')
sha256sums_aarch64=('218fb09baa7bd0832dd93331c84d2fdbfa015d9a769386a0f5040c41f3f1f377')



arch=('x86_64' 'aarch64')
depends=()
makedepends=(unzip)
optdepends=()
replaces=(duplicati-latest)
conflicts=(duplicati-latest duplicati)
provides=(duplicati)

package() {

  # Install the service.
  install -Dm644 duplicati.service "${pkgdir}/usr/lib/systemd/system/duplicati.service"
  install -Dm644 duplicati-user.service "${pkgdir}/usr/lib/systemd/user/duplicati.service"
  install -Dm644 "$srcdir/duplicati.sysusers" "$pkgdir/usr/lib/sysusers.d/duplicati.conf"
  install -Dm644 "$srcdir/duplicati.tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/duplicati.conf"
  install -Dm644 "$srcdir/duplicati.env" "$pkgdir/etc/default/duplicati"

  # Install the program.
  mkdir -p "${pkgdir}"/opt/duplicati

  # Unzip doesn't have --strip-components=1, see
  # https://superuser.com/questions/518347/equivalent-to-tars-strip-components-1-in-unzip
  local DEST="${pkgdir}/opt/duplicati"
  unzip -d "${DEST}" "${pkgname}-${pkgver}-${CARCH}.zip" && f=("$DEST"/*) && mv "$DEST"/*/* "$DEST" && rmdir "${f[@]}"

  # Symlink the CLI
  mkdir -p "${pkgdir}/usr/bin"
  ln -s /opt/duplicati/duplicati-cli "${pkgdir}/usr/bin/duplicati-cli"
}
