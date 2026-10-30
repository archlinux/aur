# Maintainer: Joey Dumont <joey.dumont@gmail.com>
# Maintainer: Bjorn Neergaard <bjorn@neersighted.com>
# Contributor: Danny Su       <contact@dannysu.com>
# Contributor: Lance G.       <gero3977 @gmail.com>
# aarch64 tester: Irissman    <irissman@probus.ca>
# armv7h tester: kauron
pkgname=duplicati-bin
pkgver=2.4.1.0
pkgrel=1
_date=2026-10-29
_branch=stable
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
            '173462a64fc5eaca287bf4b0b082206ea0e99edf846dc84487d73a0b14d8ef76'
            'bdd48fd1bdce9fd0181ed018acc494c875a8a42ab6fe3a17eb6a29fecf0d2451')
sha256sums_x86_64=('8cd4b5945f355e66325e09af58576291e706cbe834422bb5119cbe2f453752a3')
sha256sums_aarch64=('a122de9bcc3158fce35dabf2c678a848ae7d0947c18896a3479d78fd41c9610f')
arch=('x86_64' 'aarch64')
makedepends=(unzip)
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
