# Maintainer: ahrs <Forward dot to at hotmail dot co dot uk>

pkgname='alkasir-client'
pkgver=0.4.7
pkgrel=1
arch=(
  'x86_64'
  'i686'
)

if [ "$CARCH" == "x86_64" ]
then
  _arch="amd64"
else
  _arch="386"
fi

url="https://alkasir.com/"
depends=('glibc')
makedepends=('links') # Links is needed to download the license agreement
optdepends=('google-chrome'
            'chromium'
)
licenseURL='https://alkasir.com/en/License.html'
license=("custom"
         "$licenseURL"
)
pkgdesc="Alkasir is a cross-platform, open-source and robust website censorship circumvention tool that also maps censorship patterns around the world."
source=("https://github.com/alkasir/alkasir/releases/download/$pkgver/alkasir-client_linux-$_arch.tar.gz"
        "alkasir-client.service")
md5sums=('8068200941009b41885ffa93659f7f6e')

if [ "$CARCH" == "x86_64" ]
then
  md5sums=('8490b46497d51de548341cf81d7989ee' $md5sums)
else
  md5sums=('0c51a3a0a43d1af3a76f6e8860fca301' $md5sums)
fi

install="alkasir-client.install"

_pkgarchive="alkasir-client-linux-$_arch"

prepare() {
   # The client currently isn't distributed with a license so we download it from the web...
   if [ ! -f "$srcdir/$_pkgarchive/LICENSE" ]
   then
     links -dump "$licenseURL" > "$srcdir/$_pkgarchive/LICENSE"
   fi
   if [ "$_arch" == "386" ]
   then
     sed -i 's/amd64/386/g' "$srcdir/alkasir-client.service" # Alter the paths in the service file for 32bit systems
   fi
}

package() {
   mkdir -p "$pkgdir/opt/$pkgname-linux-$_arch"

   cp -a "$srcdir/$_pkgarchive/." "$pkgdir/opt/$pkgname-linux-$_arch/"

   install -D -m644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/user/$pkgname.service"

   install -D -m644 "$srcdir/$_pkgarchive/LICENSE" "$pkgdir/usr/share/licenses/$_pkgarchive/LICENSE"
}
