# Maintainer: David Parrish <daveparrish@gmail.com>

pkgname=nxt-git
pkgver=1.5.12.r5.g5bbafe1
pkgrel=1
pkgdesc="The Nxt Reference Software Client for use with the Nxt Cryptocurrency."
arch=('any')
url="http://nxt.org"
license=('MIT' 'GPL' 'MPL' 'APACHE')
depends=('bash' 'java-runtime-openjdk=8')
makedepends=('java-environment-openjdk=8')
optdepends=('flashplugin: for add to clipboard support')
source=("${pkgname}::git+https://bitbucket.org/JeanLucPicard/nxt.git"
  "nxt.service"
  "nxt.install"
  "nrs.sh"
  "nrs.desktop")
sha256sums=('SKIP'
            '293bf1e313677f769e4a12e6e0f78bbd58c796ebe7c34528ba50cd73bbea15a7'
            'b7575397d7dd19e9b1bab75e21a433f3bdc98279ad822fe57235b830c062abca'
            'fc58e5aac478f3459686f0a9ab5e059776c1a34392391fed257e5130bfd29bc2'
            '8381f120b645cca9079b5e958a8917326f71b55f031f15df3324703377638eee')
install='nxt.install'

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname}"
  ./compile.sh
}

package() {
  # Copy everything to /opt/nxt
  install -dm755 "$pkgdir/opt/nxt"
  cp -r "${pkgname}"/* "$pkgdir"/opt/nxt/

  # Service file
  install -Dm644 nxt.service "$pkgdir/usr/lib/systemd/system/nxt.service"

  # License files
  install -Dm644 "${pkgname}/COPYING.txt" "$pkgdir/usr/share/licenses/nxt/COPYING.txt"
  install -Dm644 "${pkgname}/3RD-PARTY-LICENSES.txt" "$pkgdir/usr/share/licenses/nxt/3RD-PARTY-LICENSES.txt"
  install -Dm644 "${pkgname}/LICENSE.txt" "$pkgdir/usr/share/licenses/nxt/LICENSES.txt"

  # NRS shortcut
  install -Dm644 "${pkgname}/html/nrs/icon.png" "${pkgdir}/usr/share/pixmaps/nrs.png"
  install -Dm644 nrs.desktop "${pkgdir}/usr/share/applications/nrs.desktop"
  install -Dm755 nrs.sh "$pkgdir/usr/bin/nrs"
}
