# Maintainer: Joey Dumont <joey.dumont@gmail.com>
# Maintainer: Bjorn Neergaard <bjorn@neersighted.com>
# Contributor: Danny Su       <contact@dannysu.com>
# aarch64 tester: Irissman    <irissman@probus.ca>
# armv7h tester: kauron
pkgname=duplicati-canary-bin
pkgver=2.0.9.103
pkgrel=1
_date=2024-08-15
_branch=canary
pkgdesc="A free backup client that securely stores encrypted, incremental, compressed backups on cloud storage services and remote file servers"
url="http://duplicati.com"
license=('MIT')
install=duplicati.install
source=(
#    "https://updates.duplicati.com/${_branch}/${pkgver}_${_branch}_${_date}.zip" # duplicati.com seems to be blocked in Russia, see https://aur.archlinux.org/packages/duplicati-latest/#comment-746652
  #"https://github.com/duplicati/duplicati/releases/download/v${pkgver}-${pkgver}_${_branch}_${_date}/duplicati-${pkgver}_${_branch}_${_date}.zip"
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
            '61429ead4171924b8ed293ebd8634cc858adfea7648d714241196b7fa80a38c3'
            'b9389b399467f3e02aa8e76bb98f6efbca1166fbc4d0bdf939493f8403462959'
            'b6ca3d280feb753ded94bb44eef821a0dac0c0c7ed7f37dea76d445a64386c86'
            '99591e96c340b49b47341315cb42f8ac12ca66dc4d22550e4acd37cce84e8b36')
sha256sums_x86_64=('ccb7d9e1d15213853e0b47ffbd01691e40c939de39e67daa5c275cfbf9f40b94')
sha256sums_aarch64=('d43ab34441f1af36d37c1672841734b33a3188d205fb157de808c3538b8c2efc')



arch=('x86_64' 'aarch64')
depends=(openssl-1.1 gtk-sharp-2 libappindicator-gtk2)
makedepends=(unzip)
optdepends=('notify-sharp: for tray notifications')
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

  # Install the CLI wrapper.
  mkdir -p "${pkgdir}/usr/bin"

  
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
