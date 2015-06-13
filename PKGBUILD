pkgname=android-backup-extractor-git
pkgver=r44.139fee8
pkgrel=1
pkgdesc="Ansi HTML Adapter: convert ANSI escape sequences to HTML."
arch=('any')
makedepends=('git' 'apache-ant')
depends=('bcprov')
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
  sed -e 's@lib/bcprov-jdk15on-150.jar@/usr/share/java/bcprov.jar@g' \
    -e 's@<zipfileset.*@@g' \
    -i build.xml || return 1

  # do not use the bundled abe script, a simple wrapper is good enough
  echo '#!/bin/sh' > arch-abe
  echo "CP=/usr/share/java/bcprov.jar:/usr/share/java/${pkgname}/abe.jar" >> arch-abe
  echo 'exec /usr/bin/java -cp $CP org.nick.abe.Main "$@"' >> arch-abe
  chmod +x arch-abe
}

build() {
  cd "${srcdir}/${pkgname}"
  ant
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

# vim:set ts=2 sw=2 et:
