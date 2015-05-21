# Contributor: Vojtech Horky <vojta . horky at-symbol seznam . cz>
# based on vmware-server-console and bin32-vmware-server PKGBUILDs

pkgname=bin32-vmware-server-console
pkgver=1.0.10
pkgrel=6
pkgdesc="Remote console for VMware Server"
arch=('x86_64')
url="http://www.vmware.com/products/server/"
license=('custom')
depends=('lib32-glibmm' 'lib32-libgnomecanvas' 'lib32-libxdamage' 'lib32-libxt' 'lib32-libxtst' 'lib32-libstdc++5' 'perl')
options=('!strip' '!libtool')
install=bin32-vmware-server-console.install
noextract=(bin32-vmware-server-console-add-libs.tar.gz)
source=(http://download3.vmware.com/software/vmserver/VMware-mui-${pkgver}-203137.tar.gz
        https://mortzu.de/files/aur/bin32-vmware-server-console/vmware-server-console_1.0.8-intrepid-patch.tgz
        https://mortzu.de/files/aur/bin32-vmware-server-console/bin32-vmware-server-console-add-libs.tar.gz
        vmware-server-console.desktop
        wrapper-gtk24.patch
        wrapper-gtk24-2.patch)
md5sums=('0f01e9bdeee3fa2aa84f87f66b69dc83'
         '64b74873ab7d677db3a811642e0ae029'
         '337555e917e817afda21b1615c52ab33'
         'd5f9319812fffe7bd832a64e1f333231'
         '444b6865f665813aaaf751c8ef0c7cd3'
         '1e69aaf7c72cf2347d8d552e2954f686')

package() {
  # unpack the server console package
  cd "$srcdir/vmware-mui-distrib/console-distrib"
  tar -xzf VMware-server-console-${pkgver}-203137.tar.gz

  msg "Patching because of 32bit libraries..."
  cd "$srcdir/vmware-mui-distrib/console-distrib/vmware-server-console-distrib/lib/lib"
  patch -Np1 -i "$srcdir/wrapper-gtk24.patch"

  cd "$srcdir/vmware-mui-distrib/console-distrib/vmware-server-console-distrib"

  # Install binary files
  mkdir -p "$pkgdir/usr/bin"
  install -m755 bin/* "$pkgdir/usr/bin"

  # Install libs
  mkdir -p "$pkgdir/usr/lib/vmware-server-console"
  cp -a lib/* "$pkgdir/usr/lib/vmware-server-console"
  chmod -R u+w "$pkgdir/usr/lib/vmware-server-console"

  # Install configuration files
  install -D -m755 etc/installer.sh "$pkgdir/etc/vmware-server-console/installer.sh"

  # Install man page
  install -D -m644 man/man1/vmware-server-console.1.gz \
    "$pkgdir/usr/share/man/man1/vmware-server-console.1.gz"

  # Install license
  mkdir -p "$pkgdir/usr/share/licenses/vmware-server-console"
  install -m644 doc/{EULA,open_source_licenses.txt} \
    "$pkgdir/usr/share/licenses/vmware-server-console"

  # Install desktop file
  install -D -m644 doc/icon48x48.png \
    "$pkgdir/usr/share/pixmaps/vmware-server-console.png"
  install -D -m644 "$srcdir/vmware-server-console.desktop" \
    "$pkgdir/usr/share/applications/vmware-server-console.desktop"

  sed -i "s|/usr|$pkgdir/usr|g" $srcdir/vmware-server-console_1.0.8-intrepid-patch/install
  sed -i "s|-C /|-C $pkgdir|g" $srcdir/vmware-server-console_1.0.8-intrepid-patch/install
  cd $srcdir/vmware-server-console_1.0.8-intrepid-patch
  ./install

  patch -Np1 -i "$srcdir/wrapper-gtk24-2.patch" -d "$pkgdir/usr/lib/vmware-server-console/lib"

  tar -C "$pkgdir/usr/lib/vmware-server-console/lib" -xzf "$srcdir/bin32-vmware-server-console-add-libs.tar.gz"

  rm -f $pkgdir/usr/bin/vmware-server-console.bkp
  rm -f $pkgdir/usr/lib/vmware-server-console/lib/wrapper-gtk24.sh.bkp
}
