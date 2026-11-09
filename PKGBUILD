# Maintainer: Swarnim B
#
# Installs the desktop app from the .deb that the release workflow builds and attaches to each GitHub release. It is a
# -bin package on purpose: Google sign-in on the desktop needs an OAuth client secret that is compiled into the
# official build and is not in the public source, so a package that built from source could not sign in.
#
# The release workflow (.github/workflows/release.yml) sets pkgver, refreshes the checksums and pushes this file to the AUR.

pkgname=metamorph-bin
_name=metamorph
pkgver=0.1.6
pkgrel=1
pkgdesc="Gym workout tracker (desktop app)"
arch=('x86_64')
url="https://github.com/swarnimcodes/metamorph"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3')
provides=("$_name=$pkgver")
conflicts=("$_name")
options=('!debug')
source=("$_name-$pkgver.deb::$url/releases/download/v$pkgver/Metamorph-$pkgver-linux-amd64.deb"
        "$_name-$pkgver-LICENSE::https://raw.githubusercontent.com/swarnimcodes/metamorph/v$pkgver/LICENSE")
# Replaced with real checksums by `updpkgsums` in the release workflow.
sha256sums=('6d4ffabd37a04216be5acc2e9e2caa7f95fd43f598c895f24e5fcc499806be44'
            'fca9b3ecac64f6a5f5c9f38de72e5d0974f1ef1a50782120d09f96e1ad0db2be')

package() {
  # makepkg unpacks the .deb into data.tar.* (the files to install), control.tar.* and debian-binary.
  bsdtar -xf "$srcdir"/data.tar.* -C "$pkgdir"
  install -Dm644 "$srcdir/$_name-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
