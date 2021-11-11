# Maintainer: Hilary Jendrasiak <sylogista@sylogista.pl>
pkgname='noaa-apt'
pkgdesc='NOAA APT image decoder with GUI'
pkgver=1.3.1
pkgrel=1
arch=('x86_64' 'aarch64') 
url="https://github.com/martinber/${pkgname}"
license=('GPL3')
depends=('gsl' 'gtk3')
makedepends=('cargo' 'rustup')
source=("v${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('7baf4f8e9e31bbdb6cf4b956741c2cf829de661e5c7b71bca5fb8d03f5d091c00a183ac11fd0bcf5b0e8c9fc312f2183ccead2be0700956c1ad100b68e2d4cd9')

build()
{
    export RUSTUP_HOME="${srcdir}/.rustup/" 
    rustup install nightly

    cd "${srcdir}/${pkgname}-${pkgver}"
    export NOAA_APT_RES_DIR="/usr/share/noaa-apt"

    cargo +nightly build --release
}

package()
{
    cd "${srcdir}/${pkgname}-${pkgver}/"
    install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "debian/ar.com.mbernardi.noaa-apt.desktop" "${pkgdir}/usr/bin/usr/share/applications"
    
    cd res/
    find ./ -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/noaa-apt/{}" \;
}
