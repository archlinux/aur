# Maintainer: Jason Nader <jason *add-dot-here* nader *you-know-what-goes-here* protonmail.com>
# Maintainer: Marcell Meszaros < marcell.meszaros AT runbox.eu >

pkgname=android-backup-extractor-git
pkgver=r111.47bb1dd
pkgrel=3
pkgdesc="Utility to extract and repack Android backups created with adb backup"
arch=('any')
makedepends=('git' 'apache-ant' 'java-environment>=11')
depends=('bcprov' 'java-runtime>=11')
url="https://github.com/nelenkov/android-backup-extractor"
license=('apache')
provides=('abe')
source=("$pkgname"::git+${url}.git)
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  # use the revision count.hash
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${srcdir}/${pkgname}
  # 1. set correct path to system bcprov
  # 2. do not include bcprov classes in the final abe.jar file
  sed -e 's@lib/bcprov-jdk15on-1.70.jar@/usr/share/java/bcprov/bcprov.jar@g' \
    -e 's@<zipfileset.*@@g' \
    -i build.xml || return 1

  # do not use the bundled abe script, a simple wrapper is good enough
  echo '#!/bin/sh' > arch-abe
  echo "CP=/usr/share/java/bcprov/bcprov.jar:/usr/share/java/${pkgname}/abe.jar" >> arch-abe
  echo 'exec /usr/bin/java -cp $CP org.nick.abe.Main "$@"' >> arch-abe
  chmod +x arch-abe
}

build() {
  cd "${srcdir}/${pkgname}"
  latest_version="$(archlinux-java status | grep 'java-[0-9][0-9]' | sort --reverse | head --lines 1 | sed 's/(.*)//g' | tr -d '[:space:]')"
  JAVA_HOME="/usr/lib/jvm/${latest_version}" ant
}

package() { 
  cd "${srcdir}/${pkgname}"
  install -m755 -d "${pkgdir}/usr/bin"
  install arch-abe "${pkgdir}/usr/bin/abe"
  install -m755 -d "${pkgdir}/usr/share/java/${pkgname}"
  install abe.jar "${pkgdir}/usr/share/java/${pkgname}/abe.jar"
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
