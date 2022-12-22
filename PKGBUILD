# Co-Maintainer:  tilal6991 <lalitmaganti@gmail.com>
# Co-Maintainer:  vanpra <pranavmaganti@gmail.com>
# Contributor: danyf90 <daniele.formichelli@gmail.com>
# Contributor: Philipp 'TamCore' B. <philipp [at] tamcore [dot] eu>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>
# Contributor: Christoph Brill <egore911-at-gmail-dot-com>
# Contributor: Lubomir 'Kuci' Kucera <kuci24-at-gmail-dot-com>
# Contributor: Tad Fisher <tadfisher at gmail dot com>

pkgname=android-studio-canary
pkgver=2022.2.1.10
pkgrel=1
pkgdesc="The Official Android IDE (Canary branch)"
arch=('i686' 'x86_64')
url="http://tools.android.com/"
license=('APACHE')
makedepends=('unzip' 'zip')
depends=('freetype2' 'libxrender' 'libxtst')
optdepends=('gtk2: GTK+ look and feel'
            'libgl: emulator support')
options=('!strip')
source=("https://redirector.gvt1.com/edgedl/android/studio/ide-zips/$pkgver/android-studio-$pkgver-linux.tar.gz"
        "$pkgname.desktop")
sha256sums=('348eb1994f9156c3920cf7867bacad1c55212f9cd11b06ee81f8cf81706a6826'
            '12ff377490cff386ba7b3ab9c94adfc2ca99515fdfad4773813268217dcd56b7')

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
  cp -a bin lib jbr license plugins product-info.json build.txt LICENSE.txt NOTICE.txt $pkgdir/opt/$pkgname
  ln -s /opt/$pkgname/bin/studio.sh $pkgdir/usr/bin/$pkgname

  # Add the icon and desktop file.
  install -Dm644 bin/studio.png $pkgdir/usr/share/pixmaps/$pkgname.png
  install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

  chmod -R ugo+rX $pkgdir/opt
}
