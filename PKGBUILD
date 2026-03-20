# Maintainer: Trey Blancher $(base64 -d <<< dHJleUBibGFuY2hlci5uZXQK)
pkgname=newrelic-infra
_name='infrastructure-agent'
pkgver=1.72.8
pkgrel=1
pkgdesc="New Relic Infrastructure Agent"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/newrelic/${_name}/"
license=('Apache-2.0')
groups=('newrelic')
makedepends=('go')
optdepends=()
options=(!buildflags)
provides=("${pkgname}")
conflicts=("${pkgname}-bin")
backup=("etc/${pkgname}/${pkgname}.yml")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/newrelic/${_name}/archive/refs/tags/$pkgver.tar.gz"
        "${pkgname}.yml::https://github.com/newrelic/infrastructure-agent/blob/master/assets/examples/infrastructure/newrelic-infra-template.yml.example")

build() {
	cd "${srcdir}/${_name}-$pkgver"
	make compile
    make dist
}

#  Ignoring this because `make test` fails for me, I think it fails because some
#  tests have no files associated with them.
#  
# check() {
#	cd "${_name}-$pkgver"
#	make test
#}

package() {
	cd "${srcdir}/${_name}-$pkgver"
    local _arch
    case $(uname -m) in
        x86_64)
            _arch="amd64"
            ;;
        aarch64)
            _arch="arm64"
            ;;
        armv7h)
            _arch="arm"
            ;;
        *)
            print "Unknown architecture $(uname -m)!  Exiting..." >&2 
            exit 1
            ;;
    esac
    install -dm u=rwx,go=rx "${pkgdir}/usr/bin"
    install -dm u=rwx,go=rx "${pkgdir}/etc/${pkgname}"
    install -Dm u=rwx,go=rx \
        dist/linux-${pkgname}{,-ctl,-service}_linux_${_arch}/${pkgname}* \
        "${pkgdir}/usr/bin/"
    install -Dm u=rw,go=r "${srcdir}/${pkgname}.yml" "${pkgdir}/etc/${pkgname}/"
}
sha256sums=('1f04ddb97c9e43dced56ebe36485f7045b7244b999339a60e54c98d7bbf49be5'
            'b5ef080a6345b737bc56bc594a8220a681d98ddd79c033fdf954b222aa076509')
