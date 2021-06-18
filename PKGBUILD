# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Contributor: Chih-Hsuan Yen <yan12125@gmail.com>

pkgname=android-sdk-cmake-3.10
_major=3
_minor=10
_micro=2
_build=4988404
_urlver=$_major.$_minor.$_micro
pkgver=$_major.$_minor.$_micro.$_build
pkgrel=1
pkgdesc='CMake from Google Android SDK'
arch=('x86_64')
url="https://developer.android.com/studio/index.html"
license=('custom:android-sdk-license')
depends=('bash')
makedepends=('libxml2') # xmllint
source=("https://dl-ssl.google.com/android/repository/cmake-${_urlver}-linux-x86_64.zip"
        package.xml.in)
install=android-sdk-cmake.install
# sha1sum is from https://dl.google.com/android/repository/repository2-1.xml
sha1sums=('439e8799bf59f724f104bf62784b2985f1bfe561'
          '224baf4d7288d510556d149c165a2472c3c49072')
options=('!strip')
conflicts=('android-sdk-cmake<=3.10.2.4988404')

build() {
    cd "$srcdir"
    sed "s#%MAJOR%#$_major#g;s#%MINOR%#$_minor#g;s#%MICRO%#$_micro#g;s#%BUILD%#$_build#g" package.xml.in > package.xml
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
