# Maintainer: Jason Nader <jason *add-dot-here* nader *you-know-what-goes-here* protonmail.com>
# Maintainer: Marcell Meszaros < marcell.meszaros AT runbox.eu >

pkgname=android-backup-extractor
# git tag version format: 20220304   or 20220304133015-67ef57a      (don't use 'master-*' tags)
# pkgver expected format: 2022.03.04 or 2022.03.04t13.30.15_67ef57a
pkgver=2022.03.04
pkgrel=2
epoch=1
pkgdesc='Utility to extract and repack Android backups created with adb backup'
arch=('any')
url="https://github.com/nelenkov/${pkgname}"
license=('custom:Apache') # Apache 2.0 license with copyright notice
depends=('bcprov>=1.71' 'java-runtime-headless>=11' 'sh')
makedepends=('apache-ant' 'java-environment>=11')
provides=('abe.jar')
_tar_pkgver=$(sed -e 's/\([0-9]\)t/\1/;s/\.//g;s/_/-/g' <<< $pkgver)  # recreate git tag version format from pkgver
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${_tar_pkgver}.tar.gz")
b2sums=('a29750e12704285f6a2e24acd903929e83456c271741bb2f907b3ec2d41a3334a34dcaa6fe45aedc06adc6cd5c3ab0dc757c762fd059b5c44db04fdf7c6923d6')

prepare() {
  cd "${pkgname}-${_tar_pkgver}"
  # 1. set correct path to system bcprov
  # 2. do not include bcprov classes in the final abe.jar file
  sed -e 's@lib/bcprov-jdk15on-1.70.jar@/usr/share/java/bcprov/bcprov.jar@g' \
    -e 's@<zipfileset.*@@g' \
    -i build.xml || return 1

  # do not use the bundled abe script, a simple wrapper is good enough
  echo '#!/bin/sh' > arch-abe
  echo "CP=\"/usr/share/java/bcprov/bcprov.jar:/usr/share/java/${pkgname}/abe.jar\"" >> arch-abe
  echo 'exec /usr/bin/java -cp "$CP" org.nick.abe.Main "$@"' >> arch-abe
  chmod +x arch-abe
}

build() {
  cd "${pkgname}-${_tar_pkgver}"
  latest_version="$(archlinux-java status | grep 'java-[0-9][0-9]' | sort --reverse | head --lines 1 | sed 's/(.*)//g' | tr -d '[:space:]')"
  JAVA_HOME="/usr/lib/jvm/${latest_version}" ant
}

package() { 
  cd "${pkgname}-${_tar_pkgver}"
  install -Dm 755 arch-abe "${pkgdir}/usr/bin/abe"
  install -Dm 755 abe.jar -t "${pkgdir}/usr/share/java/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
