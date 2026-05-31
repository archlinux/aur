# makepkg --printsrcinfo > .SRCINFO
pkgname=worklog-bin
pkgver=1.3.8
pkgrel=1
pkgdesc="Local-first desktop project manager for small dev teams"
arch=('x86_64')
url="https://github.com/regisx001/worklog"
license=('MIT')
depends=(
  'gtk3'
  'webkit2gtk-4.1'
  'libsoup3'
  'glib2'
  'gcc-libs'
)
source=("https://github.com/regisx001/worklog/releases/download/app-v${pkgver}/worklog_${pkgver}_amd64.AppImage")
sha256sums=('920fed8bab832269a1ec338afb577b005a7a12489e9a0d73344e069c62ed72bb')

prepare() {
  cd "$srcdir"
  chmod +x "worklog_${pkgver}_amd64.AppImage"
  ./worklog_${pkgver}_amd64.AppImage --appimage-extract
}

package() {
  cd "$srcdir"
  
  # Install the main binary
  install -Dm755 squashfs-root/usr/bin/worklog -t "$pkgdir/usr/bin/"
  
  # Install only the desktop file and icons to avoid system schema conflicts
  install -dm755 "$pkgdir/usr/share"
  cp -dr --no-preserve=ownership squashfs-root/usr/share/applications "$pkgdir/usr/share/"
  cp -dr --no-preserve=ownership squashfs-root/usr/share/icons "$pkgdir/usr/share/"
  
  # Ensure correct permissions for shared resources
  chmod -R u=rwX,go=rX "$pkgdir/usr/share"
}
