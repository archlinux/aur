# Maintainer: RielJ <https://github.com/RielJ>
pkgname=kakemono-bin
pkgver=0.3.2
pkgrel=1
pkgdesc='Wallpaper manager with a tray app, a picker and many image sources'
arch=('x86_64')
url='https://kakemono.rielj.xyz'
license=('MIT')
# The tray loads libayatana-appindicator at run time (dlopen), so namcap can't see it.
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator')
provides=('kakemono')
conflicts=('kakemono')
# Prebuilt release binaries: nothing to strip or split into a debug package.
options=('!debug' '!strip')
source=("kakemono-$pkgver.deb::$url/releases/download/v$pkgver/kakemono-linux-x64.deb"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/RielJ/kakemono/v$pkgver/LICENSE")
sha256sums=('dea95573004906f98f49798313a64dffc7c4aafc012103fc4c4c6678c2274497'
            'd5b406f9747a94536e794ad30ed830fad4831051d2d6294cac6462d32c3d3864')

package() {
  # makepkg unpacks the .deb's ar archive; the files are in data.tar.
  bsdtar -xf data.tar.* -C "$pkgdir"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # The app's updater shows this instead of updating behind pacman's back.
  install -dm755 "$pkgdir/usr/share/kakemono"
  echo 'yay -Syu kakemono-bin' > "$pkgdir/usr/share/kakemono/update-command"
}
