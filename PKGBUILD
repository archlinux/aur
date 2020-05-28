# Maintainer: Samuel Walladge <aur @ swalladge dot net>
pkgname=jobber
pkgver=1.4.3
pkgrel=1
pkgdesc='An alternative to cron, with sophisticated status-reporting and error-handling'
makedepends=('go')
depends=('glibc')
arch=('x86_64')
url='http://dshearer.github.io/jobber/'
license=('MIT')
sha256sums=('14efd9e088e4b3e1e4018fb8cd3161cc43da7941261b31c3e90d630545b305db')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dshearer/${pkgname}/archive/v${pkgver}.tar.gz")

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --libexecdir "/usr/share/${pkgname}/libexec" --localstatedir "/var"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    make
    sed -i "s/\/local\/libexec\//\/share\/${pkgname}\/libexec\//" "packaging/rpm/${pkgname}.service"
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 "bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 "bin/jobbermaster" "${pkgdir}/usr/share/${pkgname}/libexec/jobbermaster"
    install -Dm755 "bin/jobberrunner" "${pkgdir}/usr/share/${pkgname}/libexec/jobberrunner"
    install -Dm644 "bin/${pkgname}.conf" "${pkgdir}/etc/${pkgname}.conf"
    install -Dm644 "packaging/rpm/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
