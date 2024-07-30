# Maintainer: ebiadsu  <ebiadsu@posteo.de>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Leo von Klenze <leo.vonklenze@tngtech.com>

pkgname=atlassian-plugin-sdk
pkgver=9.0.2
pkgrel=1
pkgdesc="Atlassian plugin software developer kit"
arch=('i686' 'x86_64')
url="https://marketplace.atlassian.com/plugins/atlassian-plugin-sdk-tgz"
license=('Apache License 2.0')
source=("https://maven.atlassian.com/public/com/atlassian/amps/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('7c8f8e17b8da2bdae5b58533f2632531d62dc2e54b6d9bafbde0b1c033c82004')
depends=('java-environment')

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
  echo 'export PATH=$PATH:/opt/atlassian/plugin-sdk/bin' > etc/profile.d/$pkgname.sh
  echo 'setenv PATH ${PATH}:/opt/atlassian/plugin-sdk/bin' > etc/profile.d/$pkgname.csh
  chmod +x etc/profile.d/*
}
