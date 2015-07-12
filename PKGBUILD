# Maintainer: Det <nimetonmaili g-mail>
# Based on google-earth: https://aur.archlinux.org/packages/google-earth/

pkgname=google-earth6
pkgver=6.2.2.6613
pkgrel=2
pkgdesc="A legacy 3D interface to view satellite images of Earth and other objects"
arch=('i686' 'x86_64')
url="http://www.google.com/earth"
license=('custom')
depends=('desktop-file-utils' 'hicolor-icon-theme' 'ld-lsb' 'shared-mime-info' 'xdg-utils')
depends_i686=('fontconfig' 'glu' 'libgl' 'libsm' 'libxrender' 'mesa')
depends_x86_64=('lib32-curl' 'lib32-fontconfig' 'lib32-gcc-libs' 'lib32-glu'
                'lib32-libgl' 'lib32-libsm' 'lib32-libxrender' 'lib32-mesa')
optdepends=('qt4: For changing the font size with qtconfig'
            'ttf-ms-fonts: Fonts')
optdepends_i686=('catalyst-utils: For AMD Catalyst'
                 'nvidia-utils: For the NVIDIA driver')
optdepends_x86_64=('lib32-catalyst-utils: For AMD Catalyst'
                   'lib32-nvidia-utils: For the NVIDIA driver')
makedepends=('pacman>=4.2.0')
options=('!emptydirs')
install=$pkgname.install
source=('googleearth'
        "$pkgname.desktop"
        "$pkgname.menu")
source_i686=("http://packages.linuxmint.com/pool/import/g/googleearth/googleearth_$pkgver-r0_i386.deb")
source_x86_64=("http://packages.linuxmint.com/pool/import/g/googleearth/googleearth_$pkgver-r0_amd64.deb")
md5sums=('e5f591e3bd44743539722e019611b773'  # googleearth
         'bfacc99dae6bc5ded73cd9b3bd2c9087'  # google-earth6.desktop
         '3e87399f2051321102a59227e6d6ded7') # google-earth6.menu
md5sums_i686=('e38c0d806cf1d581213fb6f4f204ec9c')
md5sums_x86_64=('bd1960eb3e2d061b319c3f38835840d7')

_instdir=/opt/google/earth/legacy

package() {
  msg2 "Extracting the data.tar.gz..."
  bsdtar -xf data.tar.gz -C "$pkgdir/"

  msg2 "Making us coexist with 'google-earth'..."
  # Installation directory
  mv "$pkgdir"/opt/google/earth/free/ "$pkgdir"/$_instdir/

  # Symlinks
  rm "$pkgdir"/usr/bin/${pkgname/6}
  ln -sf $_instdir/googleearth "$pkgdir"/usr/bin/$pkgname
  ln -sf $_instdir/googleearth "$pkgdir"/$_instdir/${pkgname/6}
  
  # Menu
  rm "$pkgdir"/usr/share/menu/google-earth.menu

  msg2 "Moving stuff in place..."
  # Main script
  install -m755 googleearth "$pkgdir"/$_instdir/

  # Desktop
  install -m644 $pkgname.desktop "$pkgdir"/usr/share/applications/

  # Icons
  for i in 16 22 24 32 48 64 128 256; do
    install -Dm644 "$pkgdir"/$_instdir/product_logo_$i.png "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png
  done

  # Menu
  install -Dm644 $pkgname.menu "$pkgdir"/usr/share/menu/$pkgname.menu

  # License
  install -d "$pkgdir"/usr/share/licenses/$pkgname/
  curl -Ls $url/license.html -o "$pkgdir"/usr/share/licenses/$pkgname/license.html

  msg2 "Removing the duplicated images and .desktop..."
  rm "$pkgdir"/$_instdir/product_logo_*.png "$pkgdir"/$_instdir/${pkgname/6}.desktop

  msg2 "Fixing searches..."
  rm "$pkgdir"/$_instdir/libcurl.so.4

  msg2 "Fixing permissions..."
  chown 0:0 -R "$pkgdir"/
}
