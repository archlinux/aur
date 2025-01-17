# Maintainer: The one with the braid <info@braid.business>

pkgname=bundletool-git
_name=bundletool
pkgver=1.18.0.r0.ge5819d7
pkgrel=1
pkgdesc='A command-line tool to manipulate Android App Bundles'
arch=('any')
url="https://g.co/androidappbundle"
license=('Apache-2.0')
depends=(
  'java-runtime'
)
makedepends=(
  'gradle'
)
# prevent conflicts with binary or release packages
provides=("$_name")
conflicts=("$_name")
# declare the source from git
source=(
  "git+https://github.com/google/${_name}.git"
  "bundletool.sh"
)
# this is a git build, we do not want to pin to a version
sha256sums=('SKIP'
            '3e00767959cb7cb78b76856ae76b61f37b481ca77f28b50a27acdc4c1820891e')

pkgver() {
    cd "${srcdir}/${_name}"
    git describe --tags --always --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  # override pub cache
  export PUB_CACHE="${srcdir}/pub_cache"

  # enter the source directory
  cd "${srcdir}/${_name}"

  gradle executableJar
}

package () {
  install -Dm555 "${srcdir}/${_name}/build/libs/${_name}-all.jar" "$pkgdir/usr/share/java/${_name}/${_name}.jar"
  install -Dm755 "${srcdir}/bundletool.sh" "${pkgdir}/usr/bin/bundletool"
}

# vim: set sw=2 ts=2 et:
