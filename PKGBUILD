# Maintainer: w568w <w568w at outlook dot com>
_pkgname=fdu-connect
pkgver=0.1.0.r2.g0246386
pkgrel=1
pkgname=${_pkgname}-git
pkgdesc="Go client for FDU EasyConnect (Forked from zju-connect)"
arch=('x86_64' 'aarch64' 'i686' 'armv7h' 'armv6h' 'riscv64' 'mips64el' 'mipsel' 'ppc64le')
url="https://github.com/AkiraSalvare/fdu-connect"
license=('AGPL-3.0-only')
depends=('glibc')
makedepends=('go' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=('etc/fdu-connect/config.toml')

source=("git+https://github.com/AkiraSalvare/fdu-connect.git#branch=main" "fdu-connect.service")

sha256sums=('SKIP'
            '1c970554b5c531f18a60ad1a432324b83be8dc55f8df1a187ec3edaf66ce37ec')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${_pkgname}"
  go build \
    -tags full \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -trimpath \
    -ldflags "-s -w -buildid= -linkmode external -extldflags \"${LDFLAGS}\"" \
    -o "${_pkgname}-${pkgver}"
}

package() {
  cd "$srcdir/${_pkgname}"
  install -Dm755 "${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 config.toml.example "${pkgdir}/usr/share/doc/${_pkgname}/config.toml.example"
  install -Dm644 "${srcdir}/fdu-connect.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
}
