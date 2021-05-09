# Maintainer: Joey Dumont     <joey.dumont@gmail.com>
# Maintainer: Bjorn Neergaard <bjorn@neersighted.com>
# Contributor: Danny Su       <contact@dannysu.com>
# aarch64 tester: Irissman    <irissman@probus.ca>
# armv7h tester: kauron
pkgname=duplicati-latest
pkgver=2.0.5.114
pkgrel=6
_date=2021-03-10
_branch=canary
pkgdesc='A free backup client that securely stores encrypted, incremental, compressed backups on cloud storage services and remote file servers'
url='http://duplicati.com'
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
)
sha256sums=('02e046acae6c13a4ffa9d9e0fa8283dd85c90172fd45e4244fb156c57fe205ed'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
depends=('gtk-sharp-2' 'mono')
optdepends=('notify-sharp: for tray notifications')

package() {

  # Install the service.
  install -Dm644 duplicati.service "${pkgdir}/usr/lib/systemd/system/duplicati.service"
  install -Dm644 duplicati-user.service "${pkgdir}/usr/lib/systemd/user/duplicati.service"
  install -Dm644 "$srcdir/duplicati.sysusers" "$pkgdir/usr/lib/sysusers.d/duplicati.conf"
  install -Dm644 "$srcdir/duplicati.tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/duplicati.conf"
  rm duplicati.service duplicati-user.service duplicati.sysusers duplicati.tmpfiles.conf

  # Install the CLI wrapper.
  mkdir -p "${pkgdir}/usr/bin"
  install -D -m755 duplicati-cli "${pkgdir}/usr/bin"
  rm duplicati-cli

  # Install the program.
  rm ./*.zip
  mkdir -p "${pkgdir}/opt/duplicati-latest"
  cp -r . "${pkgdir}/opt/duplicati-latest"
}
