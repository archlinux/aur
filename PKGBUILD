# Maintainer: unknowndev <unknowndev at archlinux.info>

pkgname=fp-multiuser
pkgver=0.0.1
pkgrel=1
pkgdesc="A frp server plugin to support multiple users for frp"
arch=('x86_64')
url="https://github.com/gofrp/fp-multiuser"
license=('Apache')
depends=('glibc')
optdepends=('frps: provide frp server')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('d5dac6759d8a7a4e2ed531471f526e4e6e7134eb09571b48c9369b92dbe9960f032622a5fa3378e4ed0b72c6b92b76330b50819422731a491825735299ebc3b3')

__USE_BUILD__='upstream+opt'

build() {
    cd "${pkgname}-${pkgver}"

    case "${__USE_BUILD__}" in
    'upstream')
        make fp-multiuser
    ;;
    'upstream+opt')
#        export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
        export GOFLAGS="-buildmode=pie -trimpath -modcacherw" # -mod=readonly Lead to build failure
        export CGO_ENABLED=0 # build full static binary
        export CGO_CFLAGS="${CFLAGS}"
        export CGO_CPPFLAGS="${CPPFLAGS}"
        export CGO_LDFLAGS="${LDFLAGS}"
        make fp-multiuser
    ;;
    'my')
        #        export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
        export GOFLAGS="-buildmode=pie -trimpath -modcacherw" # -mod=readonly Lead to build failure
        export GO111MODULE=on
        export CGO_ENABLED=0 # build full static binary
        export CGO_CFLAGS="${CFLAGS}"
        export CGO_CPPFLAGS="${CPPFLAGS}"
        export CGO_LDFLAGS="${LDFLAGS}"
        go build -o "fp-multiuser" "./cmd/fp-multiuser"
    ;;
    *)
        echo "${__USE_BUILD__}"? WTF? >&2
        return 1
    ;;
    esac
}

__check() {
    cd "${pkgname}-${pkgver}"
    echo Unable to test at this time
#    go test -v --cover ./cmd/...
}

package() {
    cd "${pkgname}-${pkgver}"
#    sed -i '7 s/#Type=exec/Type=exec/'                "fp-multiuser.service"
#    sed -i '8 s/Type=simple/#Type=simple/'            "fp-multiuser.service"
#    install -Dm644 "fp-multiuser.service" -t          "$pkgdir/usr/lib/systemd/system"
#    install -Dm644 "fp-multiuser@.service" -t         "$pkgdir/usr/lib/systemd/system"

    case "${__USE_BUILD__}" in
    'upstream'|'upstream+opt')
        install -Dm755 "bin/fp-multiuser" -t          "${pkgdir}/usr/bin"
    ;;
    'my')
        install -Dm755 "fp-multiuser" -t              "${pkgdir}/usr/bin"
    ;;
    *)
        echo "${__USE_BUILD__}"? WTF? >&2
        return 1
    ;;
    esac
    
}
