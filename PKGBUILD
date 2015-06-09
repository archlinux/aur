# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Dmitrij D. Czarkoff <czarkoff@gmail.com>
# Contributor: Swift Geek

# Please note you'll need to download the Linux tar.bz2 in order for this
# PKGBUILD to work, since PA is propietary software.
# https://store.uberent.com/download/pa

pkgname=planetary-annihilation
pkgver=76766
pkgrel=1
pkgdesc="RTS gameplay in a way that's never been seen before."
group=("games")
arch=("x86_64")
url="http://www.uberent.com/pa/"
license=("custom")
depends=("alsa-lib" "gconf" "nss" "gtk2" "libtxc_dxtn" "rtmpdump")
conflicts=("planetary-annihilation-pte")
options=("!libtool" "!strip")
source=(PA_Linux_${pkgver}.tar.bz2::https://manual-download-required
        PA.desktop
        PA.png
        content.json
        uifix.js
        PA.sh)
noextract=(PA_Linux_${pkgver}.tar.bz2)
PKGEXT=".pkg.tar"

package() {
  # Game itself
  install -d "${pkgdir}/opt/"
  tar xf "${srcdir}/PA_Linux_${pkgver}.tar.bz2" -C "${pkgdir}/opt/"
  find "$pkgdir/opt/PA" -type f -exec chmod -R u+w,go-w {} \;
  chown -R root:root "$pkgdir/opt/PA"

  # License
  install -Dm 644 "${pkgdir}/opt/PA/licenses.txt" "${pkgdir}/usr/share/licenses/$pkgname/licenses.txt"

  # Launcher script
  install -Dm 755 "${srcdir}/PA.sh" "${pkgdir}/usr/bin/PA"

  # DE Launcher icon
  mkdir -p "$pkgdir/opt" "$pkgdir/usr/share/applications" \
    "$pkgdir/usr/share/icons"
  install -m644 "$srcdir/PA.desktop" "$pkgdir/usr/share/applications"
  install -m644 "$srcdir/PA.png" "$pkgdir/usr/share/icons"

  ### QUIRKS ###
  cd "$pkgdir/opt/PA"

  # Workaround for "black screen" issue
  rm media/shaders/content.json
  install -m644 "$srcdir/content.json" media/shaders
}

md5sums=('3e425249efda33574bc67b677cb1de9b'
         '16b2acc35fe4cd6fa06aff57b4a6fdc4'
         '463f4e99f44ff6ce9c09e383767a6b1d'
         'd77de6676e68c1c355fe858a0522cae0'
         'f37053bfa07d40911c0c0a4404a54614'
         '2f62773702cc5fcee03b160296738b29')
