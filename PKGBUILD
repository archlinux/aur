# Maintainer: Angel Sulev <angel@ansulev.com>
# Contributor: Ward Segers <w@rdsegers.be>
# Contributor: saying <saying121@outlook.com>

# Maintained fork of the AUR kali-themes package: current upstream, plus upstream's
# make install (emblems, logos, XFCE panel profiles), wallpapers, xfce4/Tilix schemes.

pkgname=kali-themes-ansulev
_srcname=kali-themes
pkgver=2026.3.0
pkgrel=1
pkgdesc="Kali Linux GTK/Qt themes, Flat-Remix icons and XFCE panel profiles (maintained fork)"
arch=('any')
url="https://gitlab.com/kalilinux/packages/kali-themes"
license=('GPL3')
provides=("$_srcname=$pkgver")
conflicts=("$_srcname")
options=('!strip' '!buildflags' '!makeflags')
makedepends=('optipng' 'librsvg')
source=("https://gitlab.com/kalilinux/packages/$_srcname/-/archive/kali/$pkgver/$_srcname-kali-$pkgver.tar.gz")
sha512sums=('01749fc14d29b878c0dd3636c0e3c3a9edd51c6acf38fda145e937ae978cb750a285d3c30a8e578af3d6b3142eff8570ffd43080e1fbe33a617ec9f194db904d')

build() {
  cd "$_srcname-kali-$pkgver"
  make
}

package() {
  cd "$_srcname-kali-$pkgver"

  # emblems -> icons/desktop-base + hicolor, kali-logos -> images/,
  # xfce-panel-profiles -> xfce4-panel-profiles/layouts (Kali, Kali compact)
  make DESTDIR="$pkgdir" install

  install -d -m755 "${pkgdir}/usr/share/"

  # themes + icons (the kali-* app icons the Security menu resolves against)
  cp -r "share/themes" "$pkgdir/usr/share/themes"
  # make install already created usr/share/icons: merge, don't nest
  cp -r "share/icons/." "$pkgdir/usr/share/icons/"

  # Qt / KDE
  cp -r "share/qt5ct" "$pkgdir/usr/share/qt5ct"
  cp -r "share/qt6ct" "$pkgdir/usr/share/qt6ct"
  cp -r "share/color-schemes" "$pkgdir/usr/share/color-schemes"
  cp -r "share/plasma" "$pkgdir/usr/share/plasma"
  cp -r "share/plymouth" "$pkgdir/usr/share/plymouth"

  # editor syntax themes
  cp -r "share/gtksourceview-3.0" "$pkgdir/usr/share/gtksourceview-3.0"
  cp -r "share/gtksourceview-4" "$pkgdir/usr/share/gtksourceview-4"
  cp -r "share/gtksourceview-5" "$pkgdir/usr/share/gtksourceview-5"

  # terminals
  cp -r "share/qtermwidget6" "$pkgdir/usr/share/qtermwidget6"
  cp -r "share/konsole" "$pkgdir/usr/share/konsole"
  cp -r "share/tilix" "$pkgdir/usr/share/tilix"
  cp -r "share/xfce4" "$pkgdir/usr/share/xfce4"

  # wallpapers + the default-browser/text-editor helpers they reference
  cp -r "share/backgrounds" "$pkgdir/usr/share/backgrounds"
  cp -r "share/kali-themes" "$pkgdir/usr/share/kali-themes"
  cp -r "share/applications" "$pkgdir/usr/share/applications"

  install -Dm644 face-root.svg "$pkgdir/usr/share/kali-themes/face-root.svg"

  # Debian display-manager/boot integration (gdm sddm grub desktop-base) and
  # etc/ are deliberately skipped: they stomp Arch defaults.
}
