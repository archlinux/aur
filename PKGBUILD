# Maintainer: Yen Chi Hsuan <yan12125 at gmail dot com>

_pkgname=jpexs-decompiler
pkgname=$_pkgname-git
pkgver=11.2.0.r29.g5df2728a9
epoch=1
pkgrel=2
pkgdesc="Opensource flash SWF decompiler and editor"
arch=("any")
url="https://github.com/jindrapetrik/jpexs-decompiler"
license=('GPL3')
makedepends=('git' 'apache-ant' 'java-environment=8' 'python')
depends=('java-runtime=8' 'bash') # bash for ffdec.sh
source=(
    "git+https://github.com/jindrapetrik/jpexs-decompiler#branch=dev"
    'put_version_into_build_xml.py'
)
b2sums=('SKIP'
        '3932fd50ec25304a351af8c60c462c097556e7529f7e063560700c340fbb4a98e9f0af76328b73cb754e8184198c15d79c7d4d8e7f417730b11dbb05a632041e')

java_8_home() {
    cd /usr/lib/jvm
    java_8_folder=$(ls --directory java-8-* | head -n 1)
    echo "/usr/lib/jvm/$java_8_folder"
}

pkgver() {
    cd "${srcdir}/${_pkgname}"
    ( set -o pipefail
      git describe --long --tag --match='version*' 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^version//' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    python ../put_version_into_build_xml.py
}

build() {
    cd "${srcdir}/${_pkgname}"

    export JAVA_HOME="$(java_8_home)"
    ant build
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -Dm755 "resources/ffdec.sh" "${pkgdir}/usr/bin/ffdec"
    install -Ddm755 "${pkgdir}/usr/share/java/${_pkgname}"
    for f in dist/* ; do
        cp -dr --no-preserve=ownership "$f" "${pkgdir}/usr/share/java/${_pkgname}"
    done
    install -Dm644 "license.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/license.txt"
}
