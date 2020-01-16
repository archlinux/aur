# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Contributor: Chih-Hsuan Yen <yan12125@gmail.com>

pkgname=android-sdk-cmake-3.6
_major=3
_minor=6
_micro=4111459
pkgver=$_major.$_minor.$_micro
pkgrel=1
pkgdesc='CMake from Google Android SDK'
arch=('x86_64')
url="https://developer.android.com/studio/index.html"
license=('custom:android-sdk-license')
depends=('bash')
makedepends=('libxml2') # xmllint
source=("https://dl-ssl.google.com/android/repository/cmake-${pkgver}-linux-x86_64.zip"
        package.xml.in)
install=android-sdk-cmake.install
# sha1sum is from https://dl.google.com/android/repository/repository2-1.xml
sha1sums=('71c539b9c33f0943e9ad6251fea0b161c0b70782'
          '5ca8c4e61ee3a3294865afbd5d16e83662871e06')
options=('!strip')
conflicts=('android-sdk-cmake<=3.6.4111459')

build() {
    cd "$srcdir"
    sed "s#%MAJOR%#$_major#g;s#%MINOR%#$_minor#g;s#%MICRO%#$_micro#g" package.xml.in > package.xml
}

package() {
  install -Ddm755 "$pkgdir"/opt/android-sdk/cmake/$pkgver
  cp -dr --no-preserve=ownership "$srcdir"/{bin,share,doc,android.toolchain.cmake,source.properties} \
    "$pkgdir"/opt/android-sdk/cmake/$pkgver
  # This is required for sdkmanager to recognize this package
  install -Dm644 "$srcdir"/package.xml "$pkgdir"/opt/android-sdk/cmake/$pkgver/package.xml

  install -Ddm755 "$pkgdir"/usr/share/licenses/$pkgname
  xmllint --xpath '//*[local-name()="repository"]/license/text()' "$srcdir"/package.xml \
      > "$pkgdir"/usr/share/licenses/$pkgname/android-sdk-license
}
