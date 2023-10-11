# Maintainer: Guoyi ("malcology") <guoyizhang@malacology.net>
# Contributor: Guoyi ("malcology") <guoyizhang@malacology.net>

pkgbase=nudelta
pkgname=nudelta
pkgver=0.7.4
pkgrel=1
pkgdesc="Open source NuPhy Console alternative"
url='https://github.com/donn/nudelta'
arch=('x86_64')
license=('GPL3')
depends=('gcc-libs' 'electron' 'hicolor-icon-theme')
makedepends=('make' 'cmake' 'yarn' 'nodejs' 'git' 'gendesk')
source=("git+${url}.git#tag=${pkgver}")
sha256sums=('SKIP')
prepare(){
  cd ${srcdir}/${pkgbase}
  git submodule update --init --recursive
}
build(){
  cd ${srcdir}/${pkgbase}
  # build cli and gui
  yarn
  yarn build
}
package() {
  cd ${srcdir}/${pkgbase}
  mkdir -p $pkgdir/usr/{bin,lib/$pkgname,share/{icons,applications}}

  # main body 
  cd dist/linux-unpacked
  cp -r locales $pkgdir/usr/lib/$pkgname/
  find resources -type f -name "*.yml" -exec install -D {} $pkgdir/usr/share/$pkgname/{} \;

  # icon
  cd ../.icon-set
  for size in 32 64 128 256 512
do
  install -Dm644 ${pkgname}_${size}.png $pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$pkgname.png
done

  # desktop
  gendesk --pkgname "$pkgname" --pkgdesc "$pkgdesc" --exec="$pkgname" --icon="$pkgname"
  install -Dm755 $pkgname.desktop $pkgdir/usr/share/applications

  # GUI binary
  echo -e "electron /usr/lib/$pkgname/resources/app.asar" >> $pkgname
  chmod +x $pkgname
  install -Dm 755 $pkgname $pkgdir/usr/bin/$pkgnbame

  # Cli binary 
  cd ${srcdir}/${pkgbase}
  cd build
  install $pkgname $pkgdir/usr/bin/$pkgname-cli
}
