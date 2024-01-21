# Maintainer: Hilary Jendrasiak <sylogista@sylogista.pl>
pkgname='noaa-apt'
pkgdesc='NOAA APT image decoder with GUI'
pkgver=1.4.1
pkgrel=1
arch=('x86_64' 'aarch64') 
url="https://github.com/martinber/${pkgname}"
license=('GPL3')
depends=('gsl' 'gtk3')
makedepends=('cargo' 'rustup')
source=("v${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('c7e13ff94e69cc0c0508b1485e592a1d755fb363488e5d46e6bcf4a01f7ed6c348f6b2a1d8eaf9df14e975ecad586073874cd77e0c9ebcb9c91a8d8113236790')

build()
{
    export RUSTUP_HOME="${srcdir}/.rustup/" 
    rustup install stable

    cd "${srcdir}/${pkgname}-${pkgver}"
    export NOAA_APT_RES_DIR="/usr/share/noaa-apt"

    cargo +stable build --release
}

package()
{
    cd "${srcdir}/${pkgname}-${pkgver}/"
    install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "debian/ar.com.mbernardi.noaa-apt.desktop" "${pkgdir}/usr/bin/usr/share/applications"
    
    cd res/
    find ./ -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/noaa-apt/{}" \;
}
