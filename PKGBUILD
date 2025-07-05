# Maintainer: Alessandro Abbenante <alessandros.hube@gmail.com>

pkgname=psiphonlinuxgui
pkgver=1.1.0
pkgrel=1
pkgdesc="PsiphonLinuxGUI is an unofficial Linux app for managing the Psiphon VPN and browser settings."
arch=('x86_64')
url="https://github.com/Alessandros-Hube/PsiphonLinuxGUI"
license=('MIT')
depends=('nodejs')

source=("https://github.com/Alessandros-Hube/PsiphonLinuxGUI/releases/download/v$pkgver/psiphonlinuxgui_"$pkgver"_amd64.deb")
sha256sums=('b7d9b6d56245da2d0482e9d868e97400879a1b7bf9a9364cb728ba62eba1e39e')

package() {
  # Extract the .deb package
  cd "$srcdir"
  ar x "psiphonlinuxgui_"$pkgver"_amd64.deb"  # Unpack the .deb package (ar command)
  tar xf data.tar.* -C "$pkgdir"  # Extract the data tarball to the package directory

  # If necessary, adjust extraction paths, for example:
  # Copy the necessary files into the correct directories:
  install -dm755 "$pkgdir/opt/psiphonlinuxgui"  # Create the target directory for Psiphon Linux GUI
  install -dm755 "$pkgdir/usr/share/applications"  # Create the applications directory for desktop files
  install -dm755 "$pkgdir/usr/share/icons/hicolor/514x514/apps"  # Create icons directory (if applicable)

  # Make sure the file exists
  if [ -e "$pkgdir/usr/share/applications/psiphonlinuxgui.desktop" ]; then
    # Modify the Exec line in the .desktop file to add the --no-sandbox parameter
    sed -i 's|Exec=.*|& --no-sandbox|' "$pkgdir/usr/share/applications/psiphonlinuxgui.desktop"
  fi

  # Adjust file permissions
  # Make sure the file exists before changing permissions
  if [ -e "$pkgdir/opt/psiphonlinuxgui/resources/app/configs/psiphon.config" ]; then
    # Change ownership of the psiphon.config file to root:root
    chown root:root "$pkgdir/opt/psiphonlinuxgui/resources/app/configs/psiphon.config"

    # Set permissions to 777 (read, write, and execute for everyone) for the config file
    # Be careful with 777 as it gives full access to anyone, which might be a security risk
    chmod 777 "$pkgdir/opt/psiphonlinuxgui/resources/app/configs/psiphon.config"
  fi

  mkdir -p "$pkgdir/usr/local/bin/"
  ln -sf "/opt/psiphonlinuxgui/psiphonlinuxgui" "$pkgdir/usr/local/bin/psiphonlinuxgui"
}
