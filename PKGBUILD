# Maintainer: Hilary Jendrasiak <sylogista@sylogista.pl>
pkgname='noaa-apt'
pkgdesc='NOAA APT image decoder with GUI'
pkgver=1.4.0
pkgrel=1
arch=('x86_64' 'aarch64') 
url="https://github.com/martinber/${pkgname}"
license=('GPL3')
depends=('gsl' 'gtk3')
makedepends=('cargo' 'rustup')
source=("v${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('d409b235b70e684262042c4f9ed702d87ec24cb2bd4b2e1d564b9d5196e7e970bf3d425fb37c2dca6d1422bf41b3bb90e1792a70bb140277ca474d98dc53fa90')

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
