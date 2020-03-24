# Co-Maintainer:  tilal6991 <lalitmaganti@gmail.com>
# Co-Maintainer:  vanpra <pranavmaganti@gmail.com>
# Contributor: danyf90 <daniele.formichelli@gmail.com>
# Contributor: Philipp 'TamCore' B. <philipp [at] tamcore [dot] eu>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>
# Contributor: Christoph Brill <egore911-at-gmail-dot-com>
# Contributor: Lubomir 'Kuci' Kucera <kuci24-at-gmail-dot-com>
# Contributor: Tad Fisher <tadfisher at gmail dot com>

pkgname=android-studio-canary
pkgver=4.1.0.4
pkgrel=1
_build=193.6325121
pkgdesc="The Official Android IDE (Canary branch)"
arch=('i686' 'x86_64')
url="http://tools.android.com/"
license=('APACHE')
makedepends=('unzip' 'zip')
depends=('freetype2' 'libxrender' 'libxtst')
optdepends=('gtk2: GTK+ look and feel'
            'libgl: emulator support')
options=('!strip')
source=("https://dl.google.com/dl/android/studio/ide-zips/$pkgver/android-studio-ide-$_build-linux.tar.gz"
        "$pkgname.desktop")
sha256sums=('3cabd426f5064aad3fd7afa60a00581116b4d4c7847076ac8e4d5287075064a5'
            '60edb7937f6c0fd1ad724574ff3c63fa69cedd2fdfcedf788f39a443c76743b6')

if [ "$CARCH" = "i686" ]; then
    depends+=('java-environment')
fi

package() {
  cd $srcdir/android-studio

  # Change the product name to produce a unique WM_CLASS attribute.
  mkdir -p idea
  unzip -p lib/resources.jar idea/AndroidStudioApplicationInfo.xml \
      | sed "s/\"Studio\"/\"Studio Canary\"/" >idea/AndroidStudioApplicationInfo.xml
  zip -r lib/resources.jar idea
  rm -r idea

  # Install the application.
  install -d $pkgdir/{opt/$pkgname,usr/bin}
  cp -a bin lib jre license plugins product-info.json build.txt LICENSE.txt NOTICE.txt $pkgdir/opt/$pkgname
  ln -s /opt/$pkgname/bin/studio.sh $pkgdir/usr/bin/$pkgname

  # Add the icon and desktop file.
  install -Dm644 bin/studio.png $pkgdir/usr/share/pixmaps/$pkgname.png
  install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

  chmod -R ugo+rX $pkgdir/opt
}
