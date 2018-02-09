# Maintainer: Det <nimetonmaili g-mail>
# Contributors: 458italia, Madek, Berseker, Syr
# Check the latest version with:
# $ curl -sL https://dl.google.com/linux/earth/deb/dists/stable/main/binary-amd64/Packages | grep -Pom1 "Version: \K[^-]*"

pkgname=google-earth
pkgver=7.1.8.3036
pkgrel=1
pkgdesc="Semi-legacy 3D interface to explore the globe, terrain, streets, buildings and other planets"
arch=('x86_64')
url="https://www.google.com/earth/index.html"
license=('custom:earth')
depends=('glu' 'hicolor-icon-theme' 'ld-lsb>=3-5' 'libsm' 'libxrender' 'nss'
         'libproxy' 'gst-plugins-base-libs' 'libxi' 'fontconfig' 'alsa-lib' 'libcups')
optdepends=('catalyst-utils: For AMD Catalyst'
            'nvidia-utils: For the NVIDIA driver')
options=('!emptydirs')
install=$pkgname.install
source=("google-earth-stable_${pkgver}_amd64.deb::https://dl.google.com/linux/earth/deb/pool/main/g/google-earth-stable/google-earth-stable_7.1.8.3036-r0_amd64.deb"
        'Google-Terms-of-Service.html::https://www.google.com/intl/ALL/policies/terms/index.html'
        'Google-Earth-Additional-Terms-of-Service.html::https://www.google.com/help/terms_maps.html'
        'Legal-Notices-for-Google-Earth-and-Google-Earth-APIs.html::https://www.google.com/help/legalnotices_maps.html'
        'Google-Privacy-Policy.html::https://www.google.com/intl/ALL/policies/privacy/index.html')
md5sums=('77cb0eacde195c224767a77ccf54c8ef'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

_instdir=/opt/google/earth/free/

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"

  msg2 "Moving stuff in place..."
  # The .desktop
  mv "$pkgdir"/$_instdir/google-earth.desktop "$pkgdir"/usr/share/applications/

  # Icons
  for i in 16 22 24 32 48 64 128 256; do
    install -Dm644 "$pkgdir"/$_instdir/product_logo_$i.png \
                   "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/google-earth.png
  done

  # Licenses
  for i in 'Google-Terms-of-Service.html' \
           'Google-Earth-Additional-Terms-of-Service.html' \
           'Legal-Notices-for-Google-Earth-and-Google-Earth-APIs.html' \
           'Google-Privacy-Policy.html'; do
     install -Dm644 $i "$pkgdir"/usr/share/licenses/$pkgname/$i
  done

  msg2 "Removing the Debian-intended cron job and duplicated images..."
  rm -r "$pkgdir"/etc/cron.daily/ "$pkgdir"/$_instdir/product_logo_*.png
}
