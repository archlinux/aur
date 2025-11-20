# Maintainer: Monirzadeh aur.phantom634 at passinbox dot com
pkgname=chapar-bin
pkgver=0.4.5
pkgrel=1  # Set the initial package release number
pkgdesc="Chapar is a simple and easy to use api testing tools aims to help developers to test their api endpoints. it support http and grpc protocols."
arch=('x86_64')
url="https://github.com/chapar-rest/chapar"
license=('BSD-3-Clause')
depends=()
makedepends=('curl' 'jq')  # List any build dependencies here
conflicts=(chapar)

# Fetch the latest release URL
source_url=$(curl -s https://api.github.com/repos/chapar-rest/chapar/releases/latest | jq -r '.assets[] | select(.name | test("amd64.tar.xz")) | .browser_download_url')

# Set the source
source=("$source_url")
sha256sums=('SKIP')  # Replace with actual checksum or 'SKIP' if not needed

pkgver() {
  curl -s https://api.github.com/repos/chapar-rest/chapar/releases/latest | jq -r .tag_name | sed 's/v//'
}

package() {
    # Create necessary directories
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/applications"
    mkdir -p "$pkgdir/usr/share/icons"

    # Extract the tar.xz file
    tar -xvf "$srcdir/chapar-linux-v${pkgver}-amd64.tar.xz" -C "$srcdir" --strip-components=1

    # Install the binary
    install -Dm755 "$srcdir/chapar" "$pkgdir/usr/bin/chapar"

    # Copy the desktop entry
    sed -e "s#{ICON_PATH}#${pkgdir}/usr/share/icons/chapar.png#" \
        "$srcdir/desktop-assets/chapar.desktop" > "$pkgdir/usr/share/applications/chapar.desktop"

    # Copy the icon
    cp -v "$srcdir/appicon.png" "$pkgdir/usr/share/icons/chapar.png"

    # copy the LICENSE file if you want to include it
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
