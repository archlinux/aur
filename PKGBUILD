# Maintainer: taotieren <admin@taotieren.com>

pkgname=ofdgo-git
pkgver=r1075.be69e2a
pkgrel=1
pkgdesc="Native cross-platform pure-Go OFD / PDF rendering and viewing tool"
arch=($CARCH)
url="https://github.com/xiaoqidun/ofdgo"
license=('Apache-2.0')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
#replaces=(${pkgname})
depends=(
    hicolor-icon-theme
)
optdepends=()
makedepends=(
    git
    go
)
backup=()
options=('!debug')
#install=${pkgname}.install
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^V//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

build() {
    cd "${srcdir}/${pkgname}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    mkdir -pv build/
    go build -o build/ofdgo ./cmd/webview 
}

package() {
    cd "${srcdir}/${pkgname}"

    install -vDm0755 build/${pkgname%-git} -t ${pkgdir}/usr/bin/
    install -vDm0644 assets/webui/ofdgo.png -t ${pkgdir}/usr/share/icons/hicolor/512x512/apps/
    install -vDm0644 assets/webui/ofdgo.svg -t ${pkgdir}/usr/share/icons/hicolor/scalable/apps/
    install -vDm0644 *.md -t ${pkgdir}/usr/share/doc/${pkgname}/
    install -vDm0644 NOTICE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -vDm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -vDm0644 /dev/stdin ${pkgdir}/usr/share/applications/${pkgname%-git}.desktop <<EOF
[Desktop Entry]
Type=Application
Version=1.0
Name=ofdgo
Name[zh_CN]=ofdgo
GenericName=OFD / PDF Document Viewer
GenericName[zh_CN]=OFD / PDF 文档阅读器
Comment=Native cross-platform pure-Go OFD / PDF rendering and viewing tool
Comment[zh_CN]=原生跨平台纯 Go 语言 OFD / PDF 渲染与阅读工具
Exec=ofdgo %F
Icon=ofdgo
Terminal=false
StartupNotify=true
Categories=Office;Viewer;
MimeType=application/ofd;application/pdf;
EOF
    install -vDm0644 /dev/stdin ${pkgdir}/usr/share/mime/packages/${pkgname%-git}.xml <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
  <mime-type type="application/ofd">
    <comment>Open Fixed-layout Document</comment>
    <comment xml:lang="zh_CN">OFD 文档</comment>
    <glob pattern="*.ofd"/>
  </mime-type>
</mime-info>
EOF
}
