# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Leo von Klenze <leo.vonklenze@tngtech.com>

pkgname=atlassian-plugin-sdk
pkgver=5.1.1
pkgrel=1
pkgdesc="Atlassian plugin software developer kit"
arch=('i686' 'x86_64')
url="http://confluence.atlassian.com/x/rwWzDQ"
license=('Apache License 2.0')
source=("https://maven.atlassian.com/public/com/atlassian/amps/atlassian-plugin-sdk/$pkgver/atlassian-plugin-sdk-$pkgver.tar.gz")
sha256sums=('a92ec51c7d6afaea148907acbe7f0adf1207abc48e1f9fb50c6ced105e0c80d1')
depends=('jdk')

package() {
  cd "$pkgdir"
  mkdir -p opt/atlassian/plugin-sdk

  cp -r "$srcdir"/atlassian-plugin-sdk-$pkgver/* opt/atlassian/plugin-sdk

  # remove executable flag from .bat in bin
  chmod -x opt/atlassian/plugin-sdk/apache-maven-*/bin/*.bat

  # add executable flag for every user
  chmod -R +X opt/atlassian/plugin-sdk

  # add sun java path settings to atlas files
  #find opt/atlassian/plugin-sdk -type f -executable -exec sed -ie 's/# Execute Maven #/# Execute Maven #\nsource \/opt\/java7\/etc\/profile.d\/jdk.sh/g' {} \;

  # update PATH
  mkdir -p etc/profile.d
  echo 'export PATH=$PATH:/opt/atlassian/plugin-sdk/bin' > etc/profile.d/atlassian-plugin-sdk.sh
  echo 'setenv PATH ${PATH}:/opt/atlassian/plugin-sdk/bin' > etc/profile.d/atlassian-plugin-sdk.csh
  chmod +x etc/profile.d/*
}
