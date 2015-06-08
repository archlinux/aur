# Maintainer: Andrey Mivrenik <gim at fastmail dot fm>

# Specify your user id number(not a nickname!) to give a credit to your account
_userid=anon

pkgname=nereus
pkgver=1.4
pkgrel=1
pkgdesc="Data processing client for theSkyNet"
arch=('any')
url="https://www.theskynet.org/"
license=('GPL2')
depends=('java-runtime')
install=$pkgname.install
source=("nereus_nix_installer.sh::http://ict.icrar.org/store/skynet/nereus_nix_installer_v${pkgver//[.]/_}.sh"
        "$pkgname.service")
sha256sums=('9927d8d6bf223df8625d7ecc673f3b4ad2a71ac8f1d23816d31b0862461cd598'
            '88698d96e8c827ad9c9e4a8788b2eb79b29ce53f10ac4387589356b72e7c82f6')

package() {
  cd "$srcdir"

  install -d "$pkgdir/opt"
  sh nereus_nix_installer.sh -u "$_userid" -d "$pkgdir/opt" || true
  install -Dm644 "$srcdir/nereus.service" "$pkgdir/usr/lib/systemd/system/nereus.service"

  _escaped_pkgdir=$(echo $pkgdir | sed 's/\//\\\//g')
  sed -i "s/$_escaped_pkgdir//g" "$pkgdir/opt/nereus/config/nereus_sec.policy"
}
