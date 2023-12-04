# Contributor: Ben "crispyrice" Mitchell (bjosephmitchell@gmail.com)
# Maintainer: aliu (aaronliu0130 at gmail dot com)
# Contributor: Chris Morgan (me @ chrismorgan . info )
pkgname=muse-hub-bin
pkgver=1.0.1.451
pkgrel=4
pkgdesc='Manage Muse Group apps, mostly MuseScore soundpacks'
arch=('x86_64')
url='https://www.musehub.com/'
provides=('muse-hub')
depends=()
license=(custom:muse-hub)
options=('!strip' 'emptydirs')
install=${pkgname}.install
source=("$pkgname-$pkgver.deb::https://muse-cdn.com/Muse_Hub.deb" 'muse-hub.service' 'LICENSE')
sha256sums=(
  '0896fd96d72cb18102c2436794caffadd67382d5377b84468a514601847cc3e9'
  'd9ebfcb44599bd9f5ca7d8473639f611df8a07fcf233813e6b0aa3f2bccbb961'
  'fc4263da4a65cd25fa6730a61e8c9291c8da2ae9f6f8f8b1a25cea11286af670'
)

package(){
  # Extract package data
  tar -xJ -f data.tar.xz -C "$pkgdir"

  # Service file has been patched courtesy of crispyrice for Arch
  install -Dm644 muse-hub.service "$pkgdir/usr/lib/systemd/system/muse-hub.service"

  # Official icon specified with a 'png' suffix
  sed -i 's/muse-hub.png/muse-hub/g' "$pkgdir/usr/share/applications/muse-hub.desktop"

  # Make sure directory used by Muse Hub and MuseScore has been created
  # so we can bind it into a temporary filesystem for the service
  mkdir -p "${pkgdir}/srv/muse-hub"
  mkdir -p "${pkgdir}/var/lib/MuseSampler"

  # The website's EULA contains clauses on download and use of products
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/muse-hub"
}
