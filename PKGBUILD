# Maintainer: Knut Ahlers <knut at ahlers dot me>
# Contributor: Det <nimetonmaili g-mail>
# Contributors: t3ddy, Lex Rivera aka x-demon, ruario

# Check for new Linux releases in: http://googlechromereleases.blogspot.com/search/label/Beta%20updates
# or use: $ curl -s https://dl.google.com/linux/chrome/rpm/stable/x86_64/repodata/other.xml.gz | gzip -df | awk -F\" '/pkgid/{ sub(".*-","",$4); print $4": "$10 }'

pkgname=google-chrome-beta
pkgver=71.0.3578.98
pkgrel=1
pkgdesc="The popular and trusted web browser by Google (Beta Channel)"
arch=('x86_64')
url="https://www.google.com/chrome"
license=('custom:chrome')
depends=('alsa-lib' 'gtk3' 'libcups' 'libxss' 'libxtst' 'nss')
optdepends=('kdialog: for file dialogs in KDE'
            'gnome-keyring: for storing passwords in GNOME keyring'
            'kwallet: for storing passwords in KWallet'
            'gtk3-print-backends: for printing'
            'libunity: for download progress on KDE'
            'ttf-liberation: fix fonts for some PDFs (CRBug #369991)'
            'xdg-utils')
provides=('google-chrome')
options=('!emptydirs' '!strip')
install=$pkgname.install
_channel=beta
source=("google-chrome-${_channel}_${pkgver}_amd64.deb::https://dl.google.com/linux/direct/google-chrome-${_channel}_current_amd64.deb"
        'eula_text.html'
        "google-chrome-$_channel.sh")
sha512sums=('8c815e91b1378de0677ecb193ce9d0da60a2bfea55dd690b66559fe322b7b0f3ebb7f7242c4a28b02d8e5dd6d054ede53fd06c3998abdf118f27d64ad149811a'
            'a225555c06b7c32f9f2657004558e3f996c981481dbb0d3cd79b1d59fa3f05d591af88399422d3ab29d9446c103e98d567aeafe061d9550817ab6e7eb0498396'
            'ce84dadfd8accc8bc590c8570bda7f59b415f125967f712fc9b64e10a7ab64d0f677fa8f14d2e7a2645f732c60701d9158fa421cc1f8f82715bdcf63999a005b')

## Previous versions (also see: /var/cache/pacman/pkg/google-chrome-beta-*):
#source[0]="https://dl.google.com/linux/deb/pool/main/g/google-chrome-${_channel}/google-chrome-${_channel}_${pkgver}-1_amd64.deb"
#md5sums[0]='SKIP'

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"

  msg2 "Moving stuff in place..."
  # Launcher
  install -m755 google-chrome-$_channel.sh "$pkgdir"/usr/bin/google-chrome-$_channel

  # Icons
  for i in 16x16 22x22 24x24 32x32 48x48 64x64 128x128 256x256; do
    install -Dm644 "$pkgdir"/opt/google/chrome-$_channel/product_logo_${i/x*}_${pkgname/*-}.png \
                   "$pkgdir"/usr/share/icons/hicolor/$i/apps/google-chrome-$_channel.png
  done

  # License
  install -Dm644 eula_text.html "$pkgdir"/usr/share/licenses/google-chrome-$_channel/eula_text.html

  msg2 "Fixing Chrome icon resolution..."
  sed -i "/Exec=/i\StartupWMClass=Google-chrome-$_channel" "$pkgdir"/usr/share/applications/google-chrome-$_channel.desktop

  msg2 "Removing Debian Cron job and duplicate product logos..."
  rm -r "$pkgdir"/etc/cron.daily/ "$pkgdir"/opt/google/chrome-$_channel/cron/
  rm "$pkgdir"/opt/google/chrome-$_channel/product_logo_*.png
}
