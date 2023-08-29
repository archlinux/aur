# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: neeshy <neeshy@tfwno.gf>
# Contributor: Julien Machiels <julien.machiels@protonmail.com>
# Contributor: Erik Sonnleitner <es@delta-xi.net>

_pkgname=ripme
pkgname="${_pkgname}-git"
pkgver=2.1.5.r1.g585097f3
pkgrel=1
pkgdesc="Downloads albums in bulk"
arch=('any')
url="https://github.com/ripmeapp2/ripme"
license=('MIT')
depends=('java-runtime>=17')
makedepends=('git' 'gradle' 'java-environment>=17')
provides=('ripme')
conflicts=('ripme')
source=("git+https://github.com/ripmeapp2/ripme.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --always --tags --exclude="latest-main" | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"
  gradle clean build -x test
  cat <<EOF >ripme.sh
#!/bin/sh
exec java -jar /usr/share/java/ripme.jar "\$@"
EOF
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm644 build/libs/ripme-*.jar "${pkgdir}/usr/share/java/ripme.jar"
  install -Dm755 ripme.sh "${pkgdir}/usr/bin/ripme"
}
