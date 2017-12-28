# Maintainer & Contributor: Guillermo Blanco <guillermoechegoyenblanco@gmail.com>
# Upstream URL: https://github.com/m0n0l0c0/mutant
#
# For improvements/fixes to this package, please send a pull request:
# https://github.com/m0n0l0c0/mutant

pkgname=mutant
pkgrel=1
pkgver=0.1.4
_packager_pkgver=0.1.4
pkgdesc="Linux Spotlight Productivity launcher, but more customizable."
url="https://github.com/m0n0l0c0/mutant"
provides=('mutant')
arch=('x86_64')
license=('MIT')
depends=(
  'pkg-config'
  'sqlite'
  'git'
  'npm'
  'gtk3'
  'librsvg'
)
makedepends=()
backup=()
install=''
source=(
  "mutant::https://github.com/m0n0l0c0/$pkgname/archive/v$pkgver.tar.gz"
  "mutant-packager::https://github.com/m0n0l0c0/mutant-packager/archive/v$_packager_pkgver.tar.gz"
)
sha256sums=(
  'aeadd26d5f712dfb491ba58e9e952a5a8f2bdf6dd33df7889d94aec4512da89c'
  '7a17cc75bbd813ad3c161f6c9fe015ed45180a047de99529e8e49d321e771382'
)

package() {
  # Prepare executable files
  #chmod 755 -R "$srcdir/mutant-packager-$_packager_pkgver/"
  # Launch npm installer
  echo "==> Launch installer"
  "$srcdir/mutant-packager-$_packager_pkgver/install.sh" "$srcdir/Mutant-$pkgver"
  # Generate theme and list apps
    echo "==> Search theme..."
    # Default theme in most distros
    theme="Adwaita"
    # Guess settings agent
    if test `which gtk-query-settings`; then
      theme="$(gtk-query-settings gtk-icon-theme-name | awk '{print $2}')"
    else
      theme="$(gsettings get org.gnome.desktop.interface icon-theme | sed -e 's/'\''/"/g')"
    fi
    echo "==> Found: $theme"
    # Save theme
    echo "{\"theme\": $theme }" > "$srcdir/Mutant-$pkgver/misc/theme.json"
    echo "==> Compile..."
    # Make compiler executable
    chmod 755 "$srcdir/mutant-packager-$_packager_pkgver/gtkcc.sh"
    "$srcdir/mutant-packager-$_packager_pkgver/gtkcc.sh" "$srcdir/mutant-packager-$_packager_pkgver/listApps"
    echo "==> Move"
    # Copy listApps to dst folder
    mv "$srcdir/mutant-packager-$_packager_pkgver/listApps" "$srcdir/Mutant-$pkgver/apps/native/listApps"
    # Make listApps executable
    chmod 755 "$srcdir/Mutant-$pkgver/apps/native/listApps"
    echo "==> Done"
  
  # Make the program itself
  "$srcdir/mutant-packager-$_packager_pkgver/mkDist.sh" "$srcdir/Mutant-$pkgver"
  # Create necessary dirs
  install -dm755 "$pkgdir"/{opt,usr/{bin,share}}
  # Copy executable to fakeroot
  cp -R "$srcdir/Mutant-$pkgver/$pkgname-linux-x64" "$pkgdir/opt/$pkgname"
  # Set permissions on pkgdir
  chmod 755 "$pkgdir/opt/$pkgname/$pkgname"
  install -Dm644 "$srcdir/mutant-packager-$_packager_pkgver/mutant.desktop" "${pkgdir}/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/mutant-packager-$_packager_pkgver/icns/$pkgname.png" "${pkgdir}/usr/share/pixmaps/$pkgname.png"

  ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

}
