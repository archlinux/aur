# Maintainer: Håvard Pettersson <mail@haavard.me>

pkgname=simplicitystudio
pkgver=4
pkgrel=4
pkgdesc='Design tools, documentation, software and support resources for EFM32™, EFM8™, 8051, Wireless MCUs and Wireless SoCs.'
arch=(x86_64)
url=https://www.silabs.com/products/development-tools/software/simplicity-studio
license=(unknown)
backup=("opt/$pkgname/studio.ini")
depends=(lib32-gtk2 lib32-libxtst lib32-qt4 webkitgtk2)
options=('!strip')
source=(https://www.silabs.com/documents/login/software/SimplicityStudio-v4.tgz
        gtk-version-2.patch
        simplicitystudio.sh
        simplicitystudio.desktop)
sha256sums=('ff58b0a78e9fb63cb12ce784b58c83ea62096981f21187c9b200edc0898216f9'
            '55445982b1940d3d6eb51ee5034313845c56d1540045ddd435649d51532eee66'
            'bc844e45b04bd73f684206de38b67be186634b63a850cacd1e6ed374ae9c0579'
            'c29c27fa0182b3c38e5be0830d634aca6ed6d88109695226471a5ef40165a622')

prepare() {
  cd "$srcdir/SimplicityStudio_v4"
  patch -p1 -i "$srcdir/gtk-version-2.patch"
}

package() {
  install -dm755 "$pkgdir/opt/"
  cp -a "$srcdir/SimplicityStudio_v4" "$pkgdir/opt/simplicitystudio"

  install -dm755 "$pkgdir/etc/udev/rules.d/"
  find "$srcdir/SimplicityStudio_v4/StudioLinux" -name '*.rules' \
    -exec install -m644 {} "$pkgdir/etc/udev/rules.d/" \;

  install -Dm755 simplicitystudio.sh "$pkgdir/usr/bin/simplicitystudio"
  install -Dm644 "simplicitystudio.desktop" \
    "$pkgdir/usr/share/applications/simplicitystudio.desktop"

  # installation directory has to be writable
  find "$pkgdir/opt/simplicitystudio" -type d -exec chmod a+w {} +
  find "$pkgdir/opt/simplicitystudio" -type f -exec chmod a+w {} +
}

# vim:set ts=2 sw=2 et:
