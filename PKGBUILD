# Maintainer: John Ramsden <streblo [at] ramsdenj [dot] ca>

# Note: The 2016 version may give you double cursor issues, if you
# would rather use the 2015 version the necessary commented code is below

pkgname=armikrog-hib
pkgver=20160202
pkgrel=1
pkgdesc="A unique stop motion clay animated point and click adventure game from the creators of Earthworm Jim and the Neverhood. "
arch=('i686' 'x86_64')
url="http://www.armikrog.com/"
license=('custom: commercial')
depends=()
makedepends=('hib-dlagent' 'unrar')

source=("hib://Armikrog_LinuxUniversal_feb2016.rar")
md5sums=('4d5f5701dc79c9ed337c6ebf78bb1ad9')

# Replace above the lines with the following to use v20150710
#pkgver=20150710
#source=("hib://Armikrog_Linux.x86_64.zip")
#md5sums=('63c9a6e7c57bb8a2bfa14823af0da8a3')

noextract=('Armikrog_LinuxUniversal_feb2016.rar') # Remove if using  v20150710

# File takes a long time to compress, leave uncompressed
PKGEXT='.pkg.tar'

[ "$CARCH" == "x86_64" ] && _arch="x86_64" || _arch="x86"

DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in makepkg.conf. See https://wiki.archlinux.org/index.php/Humble_Bundle ."; exit 1')
# You need to download the Humble Bundle file manually or you can configure
# DLAGENTS in makepkg.conf to auto-download.
#
# For example, hib-dlagent (https://aur.archlinux.org/packages/hib-dlagent/)
# can be used to download files. Add something like this in your makepkg.conf
# (you need to tweak the options to your needs):
# DLAGENTS+=('hib::/usr/bin/hib-dlagent -k $KEY -u $USER -p $PASS -o %o %u')
#
# The following is just a fallback to the above to notify the user:
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in makepkg.conf. See this PKGBUILD or https://wiki.archlinux.org/index.php/Humble_Bundle for more information."; exit 1')

prepare(){ # Remove if using v20150710
  unrar x 'Armikrog_LinuxUniversal_feb2016.rar'
}

package() {
  install -d "${pkgdir}/opt/${pkgname}/"
  install -d "${pkgdir}/usr/bin/"
  install -d "${pkgdir}/usr/share/applications/"

  install -Dm644 "${srcdir}/LinuxUniversal/Armikrog_Data/Resources/UnityPlayer.png" "${pkgdir}/usr/share/pixmaps/armikrog.png"
  mv "${srcdir}/LinuxUniversal/Armikrog_Data/" "${pkgdir}/opt/${pkgname}"
  install -Dm755 "${srcdir}/LinuxUniversal/Armikrog.${_arch}" "${pkgdir}/opt/${pkgname}/"

  # Replace above three lines with following to use v20150710
  #install -Dm644 "${srcdir}/Armikrog_Data/Resources/UnityPlayer.png" "${pkgdir}/usr/share/pixmaps/armikrog.png"
  #mv "${srcdir}/Armikrog_Data/" "${pkgdir}/opt/${pkgname}"
  #install -Dm755 "${srcdir}/Armikrog.${_arch}" "${pkgdir}/opt/${pkgname}/"

  ln -s "/opt/${pkgname}/Armikrog.${_arch}" "${pkgdir}/usr/bin/armikrog"

  cat > "${pkgdir}/usr/share/applications/armikrog.desktop" <<EOF
[Desktop Entry]
Name=Armikrog
Comment=Armikrog
Exec=/usr/bin/armikrog
Type=Application
Terminal=false
Icon=armikrog
Categories=Game;
EOF
}
