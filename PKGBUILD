# Maintainer: robertfoster

pkgname=openbazaard
_ver=0.14.2
pkgver=$(echo "${_ver}" | tr -d -)
pkgrel=1
pkgdesc="Server daemon for communication between client and OpenBazaar network"
arch=(i686 x86_64)
url="https://github.com/OpenBazaar/openbazaar-go"
license=('MIT')
install=$pkgname.install
makedepends=(go)
_user=github.com/OpenBazaar
_repo=openbazaar-go
source=("https://github.com/OpenBazaar/openbazaar-go/archive/v${_ver}.tar.gz"
    $pkgname.service
    $pkgname.conf
    $pkgname.sysuser.conf
)

prepare() {
    export GOPATH="$srcdir"
    mkdir -p $GOPATH/src/${_user}
    ln -sf $srcdir/${_repo}-${_ver} $GOPATH/src/${_user}/${_repo}
    cd $GOPATH/src/${_user}/${_repo}
    go get
}

build() {
    cd "${srcdir}/src/${_user}/${_repo}"
    export GOFLAGS="-buildmode=pie -trimpath -modcacherw"
    go build -ldflags="-s -w" -o "${pkgname}"
}

package() {
    install -Dm755 "${srcdir}/src/${_user}/${_repo}/${pkgname}" \
    "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.service" \
    "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 "${srcdir}/${pkgname}.conf" \
    "${pkgdir}/etc/conf.d/${pkgname}"
    install -Dm755 "${srcdir}/${pkgname}.sysuser.conf" \
    "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}

md5sums=('543f674feda7dbd0f1ca0f22d9e59d2a'
         'ae3e285b857b7efeecbab29826f29735'
         '9fd31f8bc5b6ccc21a52fc1b58fdb9d6'
         '92cd2fa8929c5acddbddf7d4fc2fd494')
