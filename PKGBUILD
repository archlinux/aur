# Maintainer: flan_suse <windows2linux_AT_zoho_DOT_com>

# The "stylized" name of the application is "WireGUIrd" (aka: "wireguard GUI")

# PACKAGER'S NOTE:
# This program runs with elevated permissions ("Polkit").
# The config file is located under /root/wireguird.settings
# It's preferable to use your WireGuard VPN provider's official application.
# If they do not provide one, you can use NetworkManager to create WireGuard tunnels.
# As a last resort, this application is a simple GUI that leverages "wg-quick".
# Any *.conf files found under /etc/wireguard will automatically be loaded in the list.
# You can also manually add or remove WireGuard *.conf files using the GUI interface.

# IMPORTANT NOTE ABOUT USAGE:
# Upstream set a 15-character limit for the config filenames.
# If a config's filename is longer than 15 characters, you cannot activate the tunnel.

pkgname=wireguird
pkgver=1.0.0
pkgrel=3
pkgdesc="GUI frontend to connect to and manage WireGuard tunnels (GTK3)"
arch=('x86_64')
url="https://github.com/UnnoTed/wireguird"
license=('MIT')
depends=('wireguard-tools' 'gtk3' 'libayatana-appindicator' 'openresolv')
makedepends=('gcc-go')
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v1.0.0.tar.gz)
sha256sums=(306ac55506cd2d74909351f9be8000b9e83d99280214e1618693b665b8b73485)

prepare() {

  # Change into directory
  cd ${pkgname}-${pkgver}

  # Correct the Debian executable path to work with Arch Linux and related distros
  sed -i 's/^Exec.*$/Exec=wireguird/g' deb/usr/share/applications/${pkgname}.desktop
  mv deb/usr/local/bin deb/usr
  rmdir deb/usr/local

  # Create a category for the desktop shortcut
  echo "Categories=Network" >> deb/usr/share/applications/${pkgname}.desktop

  # Include a comment for the desktop shortcut
  echo "Comment=Manage, create, and connect to WireGuard tunnels" >> deb/usr/share/applications/${pkgname}.desktop


}

build() {

  # Change into directory
  cd ${pkgname}-${pkgver}

  # Prepare the environment, so as to not download modules outside the working source directory
  mkdir -p ${srcdir}/go ${srcdir}/go/.config ${srcdir}/go/.cache
  export GOPATH=${srcdir}/go
  export GOENV=${srcdir}/go/.config
  export GOCACHE=${srcdir}/go/.cache

  # Compile binary with gcc-go compiler
  go clean -cache -modcache
  go generate
  go build -modcacherw -ldflags "-s -w" -trimpath -o bin/${pkgname}
  go clean -cache -modcache

}

package() {

  # Change into directory
  cd ${pkgname}-${pkgver}

  # Prepare application directory
  mkdir -p ${pkgdir}/opt/${pkgname}

  # Copy compiled binary to application directory
  cp bin/${pkgname} ${pkgdir}/opt/${pkgname}

  # Copy icons to application directory and subdirectories
  cp -a Icon ${pkgdir}/opt/${pkgname}

  # Copy launcher, desktop shortcut, and polkit policy
  cp -a deb/usr ${pkgdir}

  # Copy changelog to application directory
  cp deb/DEBIAN/changelog ${pkgdir}/opt/${pkgname}

}
