# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Sebastian Sareyko <public@nooms.de>
# Contributor: Gergely Imreh <imrehgATgmailDOTcom>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=tvbrowser
pkgver=4.2.7
pkgrel=1
pkgdesc="Java-based TV guide which is easily extensible using plugins"
arch=('any')
url="http://www.tvbrowser.org"
license=('GPL3')
depends=('archlinux-java-run' 'bash' 'giflib' 'hicolor-icon-theme' 'java-runtime>=11')
source=(http://downloads.sourceforge.net/project/tvbrowser/TV-Browser%20Releases%20%28Java%2011%20and%20higher%29/${pkgver}/tvbrowser_${pkgver}_bin.tar.gz
        http://www.tvbrowser.org/images/$pkgname/${pkgname}_logo.svg
        $pkgname.sh
        $pkgname.desktop)
sha256sums=('03564b187035b1249a7f05b2e8c94f8a440c93ee8279c85fb731532c36817ebb'
            'd5bcdf07965ef86fcaa0cb3e0dbde07ff370dd8af4e89d0d75f328e3c1631c4e'
            'e53417cdc62b40b9b0886eab8318cb196911c7a786ebed16e961576fb622456d'
            '61fe7278dcfb3a8b4557af36890cd68bc2e804b1e9bd1b6187e581c6d05e5693')

package () {
  # Removing delivered desktop entry and shell script.
  rm $srcdir/$pkgname-$pkgver/$pkgname.{sh,desktop}

  install -d -m755 $pkgdir/usr/share/java
  cp -R $srcdir/$pkgname-$pkgver $pkgdir/usr/share/java/$pkgname

  # Installing the official scalable logo, which can/will be used by modern window managers / desktop environments that support SVG.
  install -D -m644 $srcdir/${pkgname}_logo.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg

  install -D -m755 $srcdir/$pkgname.sh $pkgdir/usr/bin/$pkgname
  install -D -m644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

  # Installing the complete bundle of copyright notices. At least because of the BSD license part this step is necessary (http://wiki.archlinux.org/index.php/Arch_Packaging_Standards#Licenses)
  install -D -m644 $srcdir/$pkgname-$pkgver/COPYRIGHT.txt $pkgdir/usr/share/licenses/$pkgname/COPYRIGHT.txt

  # For window managers that don't support SVG (yet) (like e.g. fluxbox), we can also install the set of icons as delivered by the tvbrowser package.
  for _i in 16 32 48 128; do
    install -D -m644 $srcdir/$pkgname-$pkgver/imgs/${pkgname}${_i}.png $pkgdir/usr/share/icons/hicolor/${_i}x${_i}/apps/$pkgname.png
  done
}
