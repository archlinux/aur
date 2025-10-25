# Maintainer: Johnathon Schultz <jomoschultz+aur [at] gmail [dot] com>
pkgname=('nvidia-sync' 'nvidia-sync-terminal-fix')
pkgver=0.41.22
pkgrel=1
arch=('x86_64')
url="https://build.nvidia.com/spark/connect-to-your-spark/sync"
license=('custom:NVIDIA')


source=(
	"https://workbench.download.nvidia.com/stable/linux/debian/pool/proprietary/n/nvidia-sync/nvidia-sync_${pkgver}_amd64.deb"
	"nvidia-sync-terminal-launcher.sh"
)
sha256sums=('fc1ed403fc018a000cf03983ce70a7b6736cb8b0c5fbb08a376062f35a2aa36f'
            '1cd21fa2618882fae08d26211638c53d60e54573ca8dee42803692fe71a2af4e')

package_nvidia-sync() {
  pkgdesc="NVIDIA Sync is a desktop app that connects your computer to your DGX Spark over the local network. It gives you a single interface to manage SSH access and launch development tools on your DGX Spark."
  depends=('gtk3' 'libxss' 'nss' 'libsecret') # Common dependencies for Electron apps
  optdepends=(
	'gnome-terminal: For Terminal button support'
	'nvidia-sync-terminal-fix: For Terminal button support on non-GNOME desktops'
  )

  # A .deb file is just an 'ar' archive. We extract it.
  ar -x "${srcdir}/nvidia-sync_${pkgver}_amd64.deb"

  # The 'ar' command gives us a 'data.tar.xz'. We extract that into the package folder.
  tar -xf data.tar.xz -C "${pkgdir}/"

  # Copy the license file
  install -Dm644 "${pkgdir}/opt/NVIDIA Sync/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Create a symlink so 'nvidia-sync' is on the user's PATH
  # We must make the /usr/bin directory first
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/NVIDIA Sync/nvidia-sync" "${pkgdir}/usr/bin/nvidia-sync"
}

package_nvidia-sync-terminal-fix() {
  pkgdesc="Terminal fix for nvidia-sync on non-GNOME desktops"
  depends=('nvidia-sync') # Depends on the main app + a fallback terminal
  optdepends=(
    'ghostty: Preferred terminal'
    'alacritty: Preferred terminal'
    'konsole: Preferred terminal'
  )
  provides=('gnome-terminal')  # This package PROVIDES the command
  conflicts=('gnome-terminal') # And it CONFLICTS with the real one

  # Install our wrapper script to /usr/bin
  install -Dm755 "${srcdir}/nvidia-sync-terminal-launcher.sh" "${pkgdir}/usr/bin/nvidia-sync-terminal-launcher"

  # Create the fake 'gnome-terminal' symlink
  ln -s "/usr/bin/nvidia-sync-terminal-launcher" "${pkgdir}/usr/bin/gnome-terminal"
}
