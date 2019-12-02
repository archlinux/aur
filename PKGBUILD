# Maintainer: e.kovetskiy@gmail.com
# Original author: ebiadsu  <ebiadsu@posteo.de>

pkgname=atlassian-plugin-sdk-6-3-10
_pkgname=atlassian-plugin-sdk
provides=($_pkgname)
conflicts=($_pkgname $_pkgname-latest)
pkgver=6.3.10
pkgrel=1
pkgdesc="Atlassian plugin software developer kit version $pkgver"
arch=('i686' 'x86_64')
url="https://marketplace.atlassian.com/plugins/atlassian-plugin-sdk-tgz"
license=('Apache License 2.0')
_maven="https://maven.atlassian.com/public/com/atlassian/amps/$_pkgname"
depends=('java-environment')
source=("https://maven.atlassian.com/public/com/atlassian/amps/$_pkgname/$pkgver/$_pkgname-$pkgver.tar.gz")
md5sums=('b643450720a2e47fd7348f3ffc994c12')

package() {
  cd "$pkgdir"
  mkdir -p opt/atlassian/plugin-sdk

  cp -r "$srcdir"/atlassian-plugin-sdk-$pkgver/* opt/atlassian/plugin-sdk

  # remove executable flag from .bat in bin
  if [[ -n $(find opt/atlassian/plugin-sdk/apache-maven-*/bin/ -type f -name "*.bat") ]]; then
    chmod -x opt/atlassian/plugin-sdk/apache-maven-*/bin/*.bat
  fi

  # add executable flag for every user
  chmod -R +X opt/atlassian/plugin-sdk

  # update PATH
  mkdir -p etc/profile.d
  echo 'export PATH=$PATH:/opt/atlassian/plugin-sdk/bin' > etc/profile.d/$_pkgname.sh
  echo 'setenv PATH ${PATH}:/opt/atlassian/plugin-sdk/bin' > etc/profile.d/$_pkgname.csh
  chmod +x etc/profile.d/*
}
