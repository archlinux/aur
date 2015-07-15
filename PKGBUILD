# Maintainer:  tilal6991 <lalitmaganti@gmail.com>
# Contributor: danyf90 <daniele.formichelli@gmail.com>
# Contributor: Philipp 'TamCore' B. <philipp [at] tamcore [dot] eu>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>
# Contributor: Christoph Brill <egore911-at-gmail-dot-com>
# Contributor: Lubomir 'Kuci' Kucera <kuci24-at-gmail-dot-com>

pkgname=android-studio-canary
_pkgname=android-studio
pkgver=1.3.0rc1
_pkgver=1.3.0.6
pkgrel=1
_build=141.2071668
pkgdesc="The Official Android IDE. Canary branch"
arch=('i686' 'x86_64')
url="http://developer.android.com/sdk/installing/studio.html"
license=('APACHE')
depends=('java-environment' 'python')
makedepends=('unzip')
optdepends=('android-sdk' 'android-sdk-platform-tools' 'android-sdk-build-tools')
provides=("android-studio=$pkgver")
conflicts=('android-studio' 'android-studio-beta' 'android-studio-dev')
options=('!strip')
install=$pkgname.install
source=("http://dl.google.com/dl/android/studio/ide-zips/$_pkgver/android-studio-ide-$_build-linux.zip"
        "$_pkgname.desktop")
sha1sums=('e88d18055f24c0f36ea2c954f72d488bd1d9812d'
            'baed66cebe2b372700f436b93022a52cbff313be')

if [ "$CARCH" = "x86_64" ]; then
  depends+=('lib32-fontconfig' 'lib32-libxrender' 'lib32-mesa')
else
  depends+=('fontconfig' 'libxrender' 'mesa')
fi

prepare() {
  cd $srcdir/$_pkgname

  # extract the application icon
  unzip -qo lib/resources.jar artwork/icon_AS_128.png

  # enable anti aliasing
  echo "-Dswing.aatext=true" >> studio.vmoptions
  echo "-Dswing.aatext=true" >> studio64.vmoptions
}

package() {
  cd $srcdir/$_pkgname

  # application stuff
  install -d $pkgdir/{opt/$_pkgname,usr/bin}
  cp -a bin lib plugins $pkgdir/opt/$_pkgname
  ln -s /opt/android-studio/bin/studio.sh $pkgdir/usr/bin/android-studio

  # starter stuff
  install -Dm655 artwork/icon_AS_128.png $pkgdir/usr/share/pixmaps/$_pkgname.png
  install -Dm655 $srcdir/$_pkgname.desktop $pkgdir/usr/share/applications/$_pkgname.desktop

  chmod -R ugo+rX $pkgdir/opt
}
