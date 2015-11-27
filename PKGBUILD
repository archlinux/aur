# Maintainer: Yen Chi Hsuan <yan12125 at gmail dot com>

pkgname=jpexs-decompiler-git
_pkgname=jpexs-decompiler
_github_addr=jindrapetrik/jpexs-decompiler
pkgver=20151127
pkgrel=1
pkgdesc="Opensource flash SWF decompiler and editor"
arch=("any")
url="https://www.free-decompiler.com/flash/"
license=('GPL3')
makedepends=('git' 'apache-ant' 'java-environment=8' 'python')
depends=('java-runtime=8' 'bash') # bash for ffdec.sh
source=(
    "${_pkgname}"::"git+https://github.com/$_github_addr"
    'put_version_into_build_xml.py'
)
md5sums=(
    'SKIP'
    '7f20d8a7ae9e6fc17e9ac45d31802499'
)

java_8_home() {
    cd /usr/lib/jvm
    java_8_folder=$(ls --directory java-8-* | head -n 1)
    echo "/usr/lib/jvm/$java_8_folder"
}

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git log -1 --format='%cd' --date=short | tr -d -- '-'
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
