# Maintainer: Joey Dumont     <joey.dumont@gmail.com>
# Maintainer: Bjorn Neergaard <bjorn@neersighted.com>
# Contributor: Danny Su       <contact@dannysu.com>
# aarch64 tester: Irissman    <irissman@probus.ca>
# armv7h tester: kauron
pkgname=duplicati-latest
pkgver=2.0.6.100
pkgrel=6
_date=2021-08-11
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
sha256sums=('06e84a698e9723598bf821e1a3df2bb62423a362c7075dc521768389cdd6f1f8'
            '2eb973cef79731d407bfbc83f754cef588c62ec83dae2112ac93f9c9f0baa403'
            '499eb63532bcad50b897c0874b723eebc6693816fcb9626532f367b5ff51da70'
            'b9389b399467f3e02aa8e76bb98f6efbca1166fbc4d0bdf939493f8403462959'
            '326f06396c18ee5413be6f1ae91a0d85344975078d0029a973ca10a4051d4689'
            'f6f903ca443935314afeab4cd2e46cf4bef7c5fb1e81c2d95f670f0993774ce5')
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
