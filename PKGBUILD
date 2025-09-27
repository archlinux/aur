# Maintainer: taotieren <admin@taotieren.com>

pkgname=snow
_name=Snow
groups=(snow-lang)
pkgver=0.10.0
pkgrel=4
_java=25
pkgdesc="AI-friendly programming language inspired by the LLM era. Its design goal is to make it easier for LLMs to generate and understand programming code."
arch=($CARCH)
url="https://gitee.com/jcnc-org/snow"
license=('Apache-2.0')
depends=(
    glibc
    zlib
)
makedepends=(
    jdk${_java}-graalvm-bin
    'git'
    'maven'
    'musl'
)
optdepends=(
    "ideology: IDEology is the IDE for the Snow programming language."
)
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
backup=()
options=('!strip' '!debug')
#install=${pkgname}.install
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('ebbb6b6a50e453e54b3dd97ee8dc653c6b07fd7e54dee5783e01d2da8a90c1db')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${pkgname}"
    mvn -P native-linux -DskipTests clean package
}

package() {
    cd "${pkgname}"
    install -Dm0755 target/${_name} "${pkgdir}/usr/bin/${pkgname}"
    install -dm0775 "${pkgdir}/usr/lib/${pkgname}" \
        "${pkgdir}/usr/share/doc/${pkgname}"

    cp -R lib/* "${pkgdir}/usr/lib/${pkgname}"
    cp -R docs/* "${pkgdir}/usr/share/doc/${pkgname}"
    cp -R *.md "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
