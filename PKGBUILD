# Maintainer: Joey Dumont <joey.dumont@gmail.com>
# Maintainer: Bjorn Neergaard <bjorn@neersighted.com>
# Contributor: Danny Su       <contact@dannysu.com>
# aarch64 tester: Irissman    <irissman@probus.ca>
# armv7h tester: kauron
pkgname=duplicati-canary-bin
pkgver=2.0.6.104
pkgrel=7
_date=2022-06-15
_branch=canary
pkgdesc="A free backup client that securely stores encrypted, incremental, compressed backups on cloud storage services and remote file servers"
url="http://duplicati.com"
license=('LGPL')
install=duplicati.install
source=(
  # https://updates.duplicati.com/${_branch}/duplicati-${pkgver}_${_branch}_${_date}.zip # duplicati.com seems to be blocked in Russia, see https://aur.archlinux.org/packages/duplicati-latest/#comment-746652
  "https://github.com/duplicati/duplicati/releases/download/v${pkgver}-${pkgver}_${_branch}_${_date}/duplicati-${pkgver}_${_branch}_${_date}.zip"
  duplicati-user.service
  duplicati.service
  duplicati.sysusers
  duplicati.tmpfiles.conf
  duplicati-cli
  duplicati.env
)
noextract=(
  "duplicati-${pkgver}_${_branch}_${_date}.zip"
  )
backup=(
  etc/default/duplicati
)
sha256sums=('955c6d466a0bb86d9b8f56006ff3b64ed2acae2d5816ebecaa8fe0351145cc3d'
            '5e47acfb251e0fbe4c01bd75ba88a78c497208bf767addb59010baea049dd19f'
            '9e88381d56b462643a152945b81f98d3a7744bdc760fe201aec02a50bccbb5c4'
            'b9389b399467f3e02aa8e76bb98f6efbca1166fbc4d0bdf939493f8403462959'
            'b6ca3d280feb753ded94bb44eef821a0dac0c0c7ed7f37dea76d445a64386c86'
            '4a4118c73249278d78bec9b46ca9562194c3fe97fa4aa653649c29988cb7e187'
            '99591e96c340b49b47341315cb42f8ac12ca66dc4d22550e4acd37cce84e8b36')
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
depends=(openssl-1.1 gtk-sharp-2 mono libappindicator-gtk2)
makedepends=(unzip)
optdepends=('notify-sharp: for tray notifications')
replaces=(duplicati-latest)
conflicts=(duplicati-latest)

package() {

  # Install the service.
  install -Dm644 duplicati.service "${pkgdir}/usr/lib/systemd/system/duplicati.service"
  install -Dm644 duplicati-user.service "${pkgdir}/usr/lib/systemd/user/duplicati.service"
  install -Dm644 "$srcdir/duplicati.sysusers" "$pkgdir/usr/lib/sysusers.d/duplicati.conf"
  install -Dm644 "$srcdir/duplicati.tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/duplicati.conf"
  install -Dm644 "$srcdir/duplicati.env" "$pkgdir/etc/default/duplicati"

  # Install the CLI wrapper.
  mkdir -p "${pkgdir}/usr/bin"
  install -D -m755 duplicati-cli "${pkgdir}/usr/bin"

  # Install the program.
  mkdir -p "${pkgdir}"/opt/duplicati
  unzip -a "duplicati-${pkgver}_${_branch}_${_date}.zip" -d "${pkgdir}"/opt/duplicati
}
