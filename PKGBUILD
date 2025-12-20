# Maintainer: taotieren <admin@taotieren.com>

pkgname=snow
groups=(snow-lang)
pkgver=0.13.0
pkgrel=1
_java=25
pkgdesc="AI-friendly programming language inspired by the LLM era. Its design goal is to make it easier for LLMs to generate and understand programming code."
arch=($CARCH)
url="https://gitee.com/jcnc-org/snow"
license=('Apache-2.0')
depends=(
    glibc
    hicolor-icon-theme
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
sha256sums=('b13b68bf47b70aa57a5dafa19a74bd72bccda353c2905da0e577182e678d8441')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
    cd "${srcdir}/${pkgname}"

    sed -i '
        /<buildArg>--static<\/buildArg>/d
        /<buildArg>--libc=musl<\/buildArg>/d
        /<buildArg>-H:CCompilerPath=\/opt\/musl\/bin\/musl-gcc<\/buildArg>/d
        /<buildArg>-H:CLibraryPath=\/opt\/musl\/lib<\/buildArg>/d
    ' pom.xml
}

build() {
    export PATH="/usr/lib/jvm/java-${_java}-graalvm/bin/:$PATH"
    export JAVA_HOME="/usr/lib/jvm/java-${_java}-graalvm"
    cd "${pkgname}"
    
    mvn dependency:purge-local-repository -DactTransitively=false -DreResolve=false
    mvn dependency:resolve -U
    mvn -P native-linux clean package -DskipTests \
        -Ddependency.go-offline.skip=true \
        -Dnative.image.buildArgs="--verbose --no-fallback"
}

package() {
    cd "${pkgname}"
    install -Dm0755 target/${pkgname} -t "${pkgdir}/usr/bin/"
    install -dm0775 "${pkgdir}/usr/lib/${pkgname}" \
        "${pkgdir}/usr/share/doc/${pkgname}" \
        "${pkgdir}/usr/share/${pkgname}"

    cp -R lib/* "${pkgdir}/usr/lib/${pkgname}"
    cp -R docs/* "${pkgdir}/usr/share/doc/${pkgname}"
    cp -R *.md "${pkgdir}/usr/share/doc/${pkgname}"
    cp -R playground/* "${pkgdir}/usr/share/${pkgname}"
    install -Dm0644 docs/README/IMG/icon/IMG_Snow.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
    install -Dm0644 docs/README/IMG/icon/IMG_Snow.svg "${pkgdir}/usr/share/icons/hicolor/scalable/mimetypes/application-x-snow.svg"
    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm0644 /dev/stdin ${pkgdir}/usr/share/mime/packages/application-x-snow.xml <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
    <mime-type type="application/x-snow">
        <comment>Snow source code</comment>
        <comment xml:lang="zh_CN">Snow 语言源代码</comment>
        <glob pattern="*.snow"/>
        <icon name="application-x-snow"/>
    </mime-type>
</mime-info>
EOF
}
