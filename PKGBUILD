# Maintainer: taotieren <admin@taotieren.com>

pkgname=bookget-git
pkgver=1.2.4.1.gafc28fa
pkgrel=2
pkgdesc="bookget 数字图书馆下载工具，目前支持约50+个数字图书馆。"
arch=('any')
url="https://github.com/deweizhu/bookget"
license=('GPL-3.0')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
#replaces=(${pkgname})
depends=(go)
optdepends=('dezoomify-rs: Zoomable image downloader for Google Arts & Culture, Zoomify, IIIF, and others')
makedepends=(git)
backup=()
options=('!strip')
#install=${pkgname}.install
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --tags | sed 's/^v//;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    sed -i 's|root+string(os.PathSeparator)+"config.ini"|"/etc/bookget/config.ini"|g' config/conf.go
    sed -i 's|fPath, _ := os.Executable()|//fPath, _ := os.Executable()|g' config/conf.go
    sed -i 's|root := filepath.Dir(fPath)|//root := filepath.Dir(fPath)|g' config/conf.go
    sed -i 's|"path/filepath"|//"path/filepath"|g' config/conf.go

    mkdir -pv build/
    go build -o build
}

package() {
    cd "${srcdir}/${pkgname%-git}"

    install -Dm755 build/${pkgname%-git} -t ${pkgdir}/usr/bin/
    install -Dm0644 "${srcdir}/${pkgname%-git}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname%-git}/"
    install -Dm0644 "${srcdir}/${pkgname%-git}/config.ini" -t "${pkgdir}/etc/${pkgname%-git}/"
}
