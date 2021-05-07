# Maintainer: Manos S. Pappas <gmail.com: frontier314>
# Greetings to ktamp

pkgname=openeuphoria
pkgver=4.1.0
pkgrel=3
pkgdesc="Fast interpreted or compiled general purpose programming language."
url="https://openeuphoria.org"
license=('custom:"OpenEuphoria License"')
conflicts=('euphoria')
arch=('i686' 'x86_64')
options=('staticlibs')
source_x86_64=(https://sourceforge.net/projects/rapideuphoria/files/Euphoria/4.1.0-beta2/euphoria-${pkgver}-Linux-x64-57179171dbed.tar.gz/download)
source_i686=(https://sourceforge.net/projects/rapideuphoria/files/Euphoria/4.1.0-beta2/euphoria-${pkgver}-Linux-x86-57179171dbed.tar.gz/download)
md5sums_x86_64=('a19ac9fcbe92c4916e4af3499a0af6f8')
md5sums_i686=('6264506b48d135c19fa85ecc44fb305b')

build() {
  cd ${srcdir}/euphoria-$pkgver*/
}

package() {
  cd ${srcdir}/euphoria-${pkgver}*

  mkdir -p "${pkgdir}/usr/share/${pkgname}/"
  cp -r bin demo docs include source tests "${pkgdir}/usr/share/${pkgname}/"

  # Make an initial eu.cfg
if [ "$CARCH" = "x86_64" ]; then
  cat > eu.cfg <<EOF
[all]
-d E64
-eudir /usr/share/${pkgname}
-i /usr/share/${pkgname}/include
[translate]
-arch ix86_64
-gcc 
-con 
-com /usr/share/${pkgname}
-lib-pic /usr/share/${pkgname}/bin/euso.a
-lib /usr/share/${pkgname}/bin/eu.a
[bind]
-eub /usr/share/${pkgname}/bin/eub
EOF
fi

if [ "$CARCH" = "i686" ]; then
  cat > eu.cfg <<EOF
[all]
-d E32
-eudir /usr/share/${pkgname}
-i /usr/share/${pkgname}/include
[translate]
-arch ix86
-gcc 
-con 
-com /usr/share/${pkgname}
-lib-pic /usr/share/${pkgname}/bin/euso.a
-lib /usr/share/${pkgname}/bin/eu.a
[bind]
-eub /usr/share/${pkgname}/bin/eub
EOF
fi

  install -D -m644 eu.cfg "${pkgdir}/usr/share/${pkgname}/bin/eu.cfg"
  install -D -m644 License.txt "${pkgdir}/usr/share/licenses/${pkgname}/License.txt"
  
  echo "NOTE: Remember to add /usr/share/${pkgname}/bin/ to your PATH"
}

