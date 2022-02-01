# Maintainer: Jason Nader <jason *add-dot-here* nader *you-know-what-goes-here* protonmail.com>

pkgname=android-backup-extractor
pkgver=20220119054922_ef67572
pkgrel=2
pkgdesc="Utility to extract and repack Android backups created with adb backup"
arch=('any')
makedepends=('git' 'apache-ant' 'java-environment>=11')
depends=('bcprov' 'java-runtime>=11')
license=('apache')
provides=('abe')
url="https://github.com/nelenkov/android-backup-extractor"
source=("$url/archive/refs/tags/${pkgver//_/-}.tar.gz")
sha256sums=('3f3de26b22903425d5c55b1d00fa989ee20db0a725c009a620ea8544738e146e')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver//_/-}"
  # 1. set correct path to system bcprov
  # 2. do not include bcprov classes in the final abe.jar file
  sed -e 's@lib/bcprov-jdk15on-1.70.jar@/usr/share/java/bcprov.jar@g' \
    -e 's@<zipfileset.*@@g' \
    -i build.xml || return 1

  # do not use the bundled abe script, a simple wrapper is good enough
  echo '#!/bin/sh' > arch-abe
  echo "CP=/usr/share/java/bcprov.jar:/usr/share/java/${pkgname}/abe.jar" >> arch-abe
  echo 'exec /usr/bin/java -cp $CP org.nick.abe.Main "$@"' >> arch-abe
  chmod +x arch-abe
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver//_/-}"
  latest_version="$(archlinux-java status | grep 'java-[0-9][0-9]' | sort --reverse | head --lines 1 | sed 's/(.*)//g' | tr -d '[:space:]')"
  JAVA_HOME="/usr/lib/jvm/${latest_version}" ant
}

package() { 
  cd "${srcdir}/${pkgname}-${pkgver//_/-}"
  install -m755 -d "${pkgdir}/usr/bin"
  install arch-abe "${pkgdir}/usr/bin/abe"
  install -m755 -d "${pkgdir}/usr/share/java/${pkgname}"
  install abe.jar "${pkgdir}/usr/share/java/${pkgname}/abe.jar"
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}