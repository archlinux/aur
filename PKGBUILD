# Maintainer: taotieren <admin@taotieren.com>

pkgname=snow
_name=Snow
pkgver=0.10.0
pkgrel=1
# _java=24
pkgdesc="Snow is an AI-friendly programming language inspired by the LLM era. Its design goal is to make it easier for LLMs to generate and understand programming code."
arch=($CARCH)
url="https://gitee.com/jcnc-org/snow"
license=('Apache-2.0')
depends=(
    #     "java-runtime=${_java}"
    glibc
    zlib
)
makedepends=(
    #     "java-environment=${_java}"
    jdk24-graalvm-ee-bin
    'git'
    'maven'
    'musl'
)
provides=(${pkgname})
conflicts=(${pkgname})
replaces=(${pkgname})
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
    #     export PATH="/usr/lib/jvm/java-${_java}-openjdk/bin:${PATH}"
    mvn -P native-linux -DskipTests clean package
}

#check() {
#	cd "${pkgname}"
#	export PATH="/usr/lib/jvm/java-${_java}-openjdk/bin:${PATH}"
#	mvn -am -Plight-test -Dproject.build.outputTimestamp="${SOURCE_DATE_EPOCH}" test
#}

package() {
    cd "${pkgname}"
    install -Dm0755 target/${_name} -t "${pkgdir}/usr/bin/"
    install -dm0775 "${pkgdir}/usr/lib/${pkgname}" \
        "${pkgdir}/usr/share/doc/${pkgname}"

    cp -R lib/* "${pkgdir}/usr/lib/${pkgname}"
    cp -R docs/* "${pkgdir}/usr/share/doc/${pkgname}"
    # jar
    #     install -vDm644 "target/${_name}-$pkgver.jar" "$pkgdir/usr/share/java/$pkgname/$_name.jar"
    #     install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<EOF
    # #!/bin/bash
    #
    # java_options=(
    #   -jar /usr/share/java/${pkgname}/${_name}.jar
    # )
    # PATH="/usr/lib/jvm/java-${_java}-openjdk/bin:$PATH"
    #
    # exec java "${java_options[@]}" "$@"
    #
    # EOF

    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
