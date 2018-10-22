# Maintainer: bobi <alexandre.garnier.86 at gmail dot com>
# Contributor: Alexander F Rødseth <xyproto at archlinux dot org>
# Contributor: Timm Preetz <timm at preetz dot us>
# Contributor: Daniel J Griffiths <ghost1227 at archlinux dot us>
# Contributor: Ben Wolsieffer <benwolsieffer at gmail dot com>

_pkgname=netbeans
pkgname=${_pkgname}8
pkgver=8.2
# Get the subver from https://netbeans.org/downloads/zip.html
_subver=201609300101
pkgrel=1
pkgdesc='IDE for Java, HTML5, PHP, Groovy, C and C++'
provides=("$_pkgname")
conflicts=("$_pkgname")
arch=('any')
url='http://netbeans.org/'
license=('CDDL')
# classpath is not needed, see FS#38567 (Oracle JDK does not need atk either)
depends=('java-environment' 'ttf-font' 'libxtst' 'giflib' 'atk')
backup=('usr/share/netbeans/etc/netbeans.conf')
makedepends=('gendesk' 'setconf')
optdepends=('php: for developing programs in php'
            'groovy: for developing programs in groovy'
            'lib32-glibc')
options=('!strip')
# http://dlc-cdn.sun.com/netbeans/8.1/final/zip/
source=("http://download.netbeans.org/netbeans/$pkgver/final/zip/netbeans-$pkgver-$_subver.zip"
        'https://cdn.rawgit.com/ComFreek/chocolatey-packages/779f5c96f817ed1fa0d76fd90841873dc6c0ba74/icons/netbeans.png')
sha256sums=('ad9888334b9a6c1f1138dcb2eccc8ce4921463e871e46def4ecc617538160948'
            '048112cc3be78f41bf6eca8f664f3e92e97fc68df904ce87a7e0156a18d80c7e')

prepare() {
  gendesk -f -n --pkgname "$_pkgname" --pkgdesc "$pkgdesc" \
    --custom "StartupWMClass=NetBeans IDE $pkgver" --name "NetBeans" \
    --exec 'netbeans %f' --startupnotify true
  setconf "$_pkgname/bin/$_pkgname" basedir "/usr/share/$_pkgname"
}

package() {
  mkdir -p "$pkgdir/usr/"{bin,share/applications}

  # Binary file
  install -Dm755 "$_pkgname/bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

  # Resources
  cp -r "$_pkgname" "$pkgdir/usr/share/"

  # Desktop shortcut and icon
  install -Dm644 "$_pkgname.desktop" \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 "$_pkgname.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"

  # Cleanup of directory that contains the binary file and .exe-files
  rm -r "$pkgdir/usr/share/$_pkgname/bin"
}

# getver: netbeans.org
# vim:set ts=2 sw=2 et:
