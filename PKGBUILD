# Maintainer: Jason Nader <jason *add-dot-here* nader *you-know-what-goes-here* protonmail.com>
# Maintainer: Marcell Meszaros < marcell.meszaros AT runbox.eu >

pkgname=android-backup-extractor-git
pkgver=r147.g70730dd
pkgrel=2
pkgdesc='Utility to extract and repack Android backups created with adb backup'
arch=('any')
url="https://github.com/nelenkov/${pkgname%-git}"
license=('custom:Apache') # Apache 2.0 license with copyright notice
depends=('bcprov>=1.71' 'java-runtime-headless>=11' 'sh')
makedepends=('git' 'apache-ant' 'java-environment>=11')
provides=('abe.jar' 'android-backup-extractor')
conflicts=('abe' 'android-backup-extractor')
source=("${pkgname}::git+${url}.git")
b2sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  # use the revision count.hash
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname}"
  # 1. set correct path to system bcprov
  # 2. do not include bcprov classes in the final abe.jar file
  sed -e 's@lib/bcprov-jdk18on-1.77.jar@/usr/share/java/bcprov/bcprov.jar@g' \
    -e 's@<zipfileset.*@@g' \
    -i build.xml || return 1

  # do not use the bundled abe script, a simple wrapper is good enough
  echo '#!/bin/sh' > arch-abe
  echo "CP=\"/usr/share/java/bcprov/bcprov.jar:/usr/share/java/${pkgname}/abe.jar\"" >> arch-abe
  echo 'exec /usr/bin/java -cp "$CP" org.nick.abe.Main "$@"' >> arch-abe
  chmod +x arch-abe
}

build() {
  cd "${pkgname}"
  latest_version="$(archlinux-java status | grep 'java-[0-9][0-9]' | sort --reverse | head --lines 1 | sed 's/(.*)//g' | tr -d '[:space:]')"
  JAVA_HOME="/usr/lib/jvm/${latest_version}" ant
}

package() { 
  cd "${pkgname}"
  install -Dm 755 arch-abe "${pkgdir}/usr/bin/abe"
  install -Dm 755 abe.jar -t "${pkgdir}/usr/share/java/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
