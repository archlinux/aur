# Maintainer: taotieren <admin@taotieren.com>

pkgname=snow
groups=(snow-lang)
pkgver=0.11.0
pkgrel=5
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
sha256sums=('085966b8e539374aaf0b1d0fd58c73c55e72c38e51dd0585cb267fc4ecd96a69')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    export PATH="/usr/lib/jvm/java-${_java}-graalvm/bin/:$PATH"
    export JAVA_HOME="/usr/lib/jvm/java-${_java}-graalvm"
    cd "${pkgname}"
    mvn -P native-linux -DskipTests clean package
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
