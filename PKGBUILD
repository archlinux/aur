# Maintainer: Andras Biro <bbandi86@gmail.com>
# Contributor: Håvard Pettersson <mail@haavard.me> for studio4

pkgname=simplicitystudio5-bin
pkgver=5
pkgrel=2
pkgdesc='Design tools, documentation, software and support resources for EFM32™, EFM8™, 8051, Wireless MCUs and Wireless SoCs.'
arch=(x86_64)
url=https://www.silabs.com/products/development-tools/software/simplicity-studio
license=(unknown)
backup=("opt/$installdir/studio.ini")
depends=(qt5-base qt5-networkauth webkit2gtk git git-lfs make openssl ncurses5-compat-libs)
#ncurses5 is required by the gdb packaged in studio, /opt/simplicitystudio5/developer/toolchains/gnu_arm/10.3_2021.10/bin/arm-none-eabi-gdb
optdepends=('wine: for IAR support'
            'lib32-qt4: for old tools like battery estimator')
options=('!strip')
install=simplicitystudio5.install
source=(https://www.silabs.com/documents/login/software/SimplicityStudio-5.tgz
        simplicitystudio5.desktop)
sha256sums=('SKIP'
            '124f76950ab6b8dba75f3094ee22169d92822df633a1262ad7de5d1561d65f11')
            
installdir=simplicitystudio5

prepare() {
  cd "$srcdir/SimplicityStudio_v5"
}

package() {
  install -dm755 "$pkgdir/opt/"
  cp -a "$srcdir/SimplicityStudio_v5" "$pkgdir/opt/$installdir"

  install -dm755 "$pkgdir/etc/udev/rules.d/"
  find "$srcdir/SimplicityStudio_v5/StudioLinux" -name '*.rules' \
    -exec install -m644 {} "$pkgdir/etc/udev/rules.d/" \;

  mkdir -p $pkgdir/usr/bin
  ln -sf /opt/$installdir/studio $pkgdir/usr/bin/$installdir
  
  install -Dm644 "simplicitystudio5.desktop" \
    "$pkgdir/usr/share/applications/simplicitystudio5.desktop"

  # installation directory has to be writable
  find "$pkgdir/opt/$installdir" -type d -exec chmod a+w {} +
  find "$pkgdir/opt/$installdir" -type f -exec chmod a+w {} +
}

# vim:set ts=2 sw=2 et:
