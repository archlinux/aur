# Maintainer: Ayatale <ayatale@qq.com>

pkgname=alist-bin
_pkgname=${pkgname%-bin}
pkgver=2.1.0
_pkgver=${pkgver}
pkgrel=5
pkgdesc="Another file list program that supports multiple storage"
arch=("aarch64" "arm" "armv6h" "armv7h"  "i686" "x86_64")
url="https://github.com/Xhofe/alist"
license=('AGPL3')
provides=(${_pkgname})
source=(
"${_pkgname}-${pkgver}::git+https://github.com/Xhofe/alist#tag=v${pkgver}"
"${_pkgname}-${pkgver}-web.tar.gz::https://github.com/alist-org/alist-web/releases/download/${pkgver}/dist.tar.gz"
"alist.service"
)
sha256sums=('SKIP'
            '2bba9149988f9429270d0378750d249ab2c39d210cd3331b0b8b54ee690c39ee'
            '432974ff640e0830249dd28d9151092caef3e5bfec427ed270a028c5b8c50152')
prepare(){
    cd $srcdir/
    cp -pvrf dist/* ${_pkgname}-${pkgver}/public
    cd ${_pkgname}-${pkgver}
    sed -i 's|"data/|"/var/lib/alist/|g' conf/config.go
    sed -i 's|"data/|"/var/lib/alist/|g' bootstrap/log.go

}
build(){
    cd $srcdir/${_pkgname}-${pkgver}
    appName="alist"
    builtAt="$(date +'%F %T %z')"
    goVersion=$(go version | sed 's/go version //')
    gitAuthor=$(git show -s --format='format:%aN <%ae>' HEAD)
    gitCommit=$(git log --pretty=format:"%h" -1)
    gitTag=$(git describe --long --tags --dirty --always)
    ldflags="\
    -w -s \
    -X 'github.com/Xhofe/alist/conf.BuiltAt=$builtAt' \
    -X 'github.com/Xhofe/alist/conf.GoVersion=$goVersion' \
    -X 'github.com/Xhofe/alist/conf.GitAuthor=$gitAuthor' \
    -X 'github.com/Xhofe/alist/conf.GitCommit=$gitCommit' \
    -X 'github.com/Xhofe/alist/conf.GitTag=$gitTag' \
    "
    go build -ldflags="$ldflags" alist.go


}

package() {
    cd $srcdir/
    install -Dm755 ${_pkgname}-${pkgver}/alist ${pkgdir}/usr/bin/alist
    install -Dm644 alist.service -t ${pkgdir}/usr/lib/systemd/system/
}

