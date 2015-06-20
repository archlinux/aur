# Contributor: Gadget3000 <gadget3000 at msn dot com>
# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=hammerfight
pkgver=1.004
pkgrel=1
epoch=1
pkgdesc='A 2D physics-based video game in which you swing large melee weapons to destroy enemies (game sold separately)'
arch=('i686' 'x86_64')
url='http://www.koshutin.com/'
license=('custom')
groups=('humblebundle3' 'humblebundle4' 'humblebundles')
source=('hammerfight.desktop' "hib://${pkgname}_${pkgver}_all.tar.gz")
md5sums=('8233b9a99ef7bfe02e358b8c9bb827b4' 'cc3fd17aa5849b0de3f0aa967ea8afe2')
depends=('openal' 'gcc-libs' 'sdl')
# You can download the Humble Indie Bundle file manually, or you can configure
# DLAGENTS in makepkg.conf to auto-download.
#
# For example, to use hib-dlagent to download files set something like this in
# your makepkg.conf (change/add -k and add -u/-p to your needs):
# DLAGENTS=('hib::/usr/bin/hib-dlagent -k 1a2b3c -o %o $(echo %u | cut -c 7-)')
#
# To auto-search through a directory containing Humble Bundle downloads, you
# could set:
# DLAGENTS=('hib::/usr/bin/find /path/to/downloads -name $(echo %u | cut -c 7-) -exec ln -s \{\} %o \; -quit')
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Download manually to \"$(pwd)\" or setup hib:// DLAGENT in /etc/makepkg.conf."; echo "Read this PKGBUILD for more info."; exit 1')
PKGEXT='.pkg.tar'

package() {
  cd "${srcdir}/${pkgname}"

  install -d "${pkgdir}/opt/hammerfight/"
  cp -Rl . "${pkgdir}/opt/hammerfight/"
  if [ "$CARCH" = "x86_64" ]; then
    rm "${pkgdir}/opt/hammerfight/Hammerfight-x86"
  else
    rm "${pkgdir}/opt/hammerfight/Hammerfight-amd64"
  fi

  # Use system-provided libraries
  rm -rf "${pkgdir}"/opt/hammerfight/{amd64,x86}
  rm "${pkgdir}/opt/hammerfight/xdg-open"

  install -d "${pkgdir}/usr/bin"
  ln -s /opt/hammerfight/Hammerfight "${pkgdir}/usr/bin/hammerfight"

  install -Dm644 hammerfight.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "${srcdir}/hammerfight.desktop" \
      "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
