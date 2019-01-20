# Maintainer: Saeid Ahmed <itsaeid7@gmail.com>
# Contributor: Det <nimetonmaili g-mail>
# Based on google-earth: https://aur.archlinux.org/packages/google-earth/

pkgname=google-earth6
pkgver=6.2.2.6613
pkgrel=2
pkgdesc="Legacy 3D interface to explore the globe, terrain, streets, buildings and other planets"
arch=('x86_64')
url="https://www.google.com/earth/index.html"
license=('custom')
depends=('desktop-file-utils' 'hicolor-icon-theme' 'ld-lsb' 'shared-mime-info' 'xdg-utils' 'lib32-curl'
         'lib32-fontconfig' 'lib32-gcc-libs' 'lib32-glu' 'lib32-libgl' 'lib32-libsm' 'lib32-libxrender'
         'lib32-mesa')
optdepends=('lib32-catalyst-utils: For AMD Catalyst'
            'lib32-nvidia-utils: For the NVIDIA driver'
            'qt4: For changing the font size with qtconfig'
            'ttf-ms-fonts: Fonts')
options=('!emptydirs')
install=$pkgname.install
source=("ftp://ftp.is.freebsd.org/pub/mint/packages/pool/import/g/googleearth/googleearth_$pkgver-r0_amd64.deb"
        'googleearth.sh'
        "$pkgname.desktop"
        "$pkgname.menu"
        'Google-Terms-of-Service.html::https://www.google.com/intl/ALL/policies/terms/index.html'
        'Google-Earth-Additional-Terms-of-Service.html::https://www.google.com/help/terms_maps.html'
        'Legal-Notices-for-Google-Earth-and-Google-Earth-APIs.html::https://www.google.com/help/legalnotices_maps.html'
        'Google-Privacy-Policy.html::https://www.google.com/intl/ALL/policies/privacy/index.html')
md5sums=('bd1960eb3e2d061b319c3f38835840d7'
         'e5f591e3bd44743539722e019611b773'
         'bfacc99dae6bc5ded73cd9b3bd2c9087'
         '3e87399f2051321102a59227e6d6ded7'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

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
  install -m755 googleearth.sh "$pkgdir"/$_instdir/googleearth

  # Desktop
  install -m644 $pkgname.desktop "$pkgdir"/usr/share/applications/

  # Icons
  for i in 16 22 24 32 48 64 128 256; do
    install -Dm644 "$pkgdir"/$_instdir/product_logo_$i.png "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png
  done

  # Menu
  install -Dm644 $pkgname.menu "$pkgdir"/usr/share/menu/$pkgname.menu

  # Licenses
  install -Dm644 'Google-Terms-of-Service.html' \
      "$pkgdir/usr/share/licenses/$pkgname/Google-Terms-of-Service.html"
  install -Dm644 'Google-Earth-Additional-Terms-of-Service.html' \
      "$pkgdir/usr/share/licenses/$pkgname/Google-Earth-Additional-Terms-of-Service.html"
  install -Dm644 'Legal-Notices-for-Google-Earth-and-Google-Earth-APIs.html' \
      "$pkgdir/usr/share/licenses/$pkgname/Legal-Notices-for-Google-Earth-and-Google-Earth-APIs.html"
  install -Dm644 'Google-Privacy-Policy.html' \
      "$pkgdir/usr/share/licenses/$pkgname/Google-Privacy-Policy.html"

  msg2 "Removing the duplicated images and .desktop..."
  rm "$pkgdir"/$_instdir/product_logo_*.png "$pkgdir"/$_instdir/${pkgname/6}.desktop

  msg2 "Fixing searches..."
  rm "$pkgdir"/$_instdir/libcurl.so.4

  msg2 "Fixing permissions..."
  chown 0:0 -R "$pkgdir"/
}
