# Maintainer: Yen Chi Hsuan <yan12125 at gmail dot com>

pkgname=android-sdk-cmake
pkgver=3.6.4111459
pkgrel=1
pkgdesc='CMake from Google Android SDK'
arch=('x86_64')
url="http://developer.android.com/sdk/index.html"
license=('custom:android-sdk-license')
depends=('bash' 'openssl-1.0')
makedepends=('libxml2') # xmllint
source=("https://dl-ssl.google.com/android/repository/cmake-${pkgver}-linux-x86_64.zip"
        package.xml)
noextract=("cmake-${pkgver}-linux-x86_64.zip")
install=android-sdk-cmake.install
# sha1sum is from https://dl.google.com/android/repository/repository2-1.xml
sha1sums=('71c539b9c33f0943e9ad6251fea0b161c0b70782'
          '499d480538d4077f8e0c8c22b3bcdf809daf18ac')
options=('!strip')

prepare() {
    cd "$srcdir"
    mkdir -p cmake-pkg
    cd cmake-pkg
    bsdtar -x -f ../cmake-$pkgver-linux-x86_64.zip
}

package() {
  install -Ddm755 "$pkgdir"/opt/android-sdk/cmake
  cp -dr --no-preserve=ownership "$srcdir"/cmake-pkg "$pkgdir"/opt/android-sdk/cmake/$pkgver
  # This is required for sdkmanager to recognize this package
  install -Dm644 "$srcdir"/package.xml "$pkgdir"/opt/android-sdk/cmake/$pkgver/package.xml

  install -Ddm755 "$pkgdir"/usr/share/licenses/$pkgname
  xmllint --xpath '//*[local-name()="repository"]/license/text()' "$srcdir"/package.xml \
      > "$pkgdir"/usr/share/licenses/$pkgname/android-sdk-license
}
