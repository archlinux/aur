# Maintainer: Hilary Jendrasiak <sylogista@sylogista.pl>
pkgname='noaa-apt'
pkgdesc='NOAA APT image decoder with GUI'
pkgver=1.2.0
pkgrel=1
arch=('x86_64') 
url="https://github.com/martinber/${pkgname}"
license=('GPL3')
depends=('gsl' 'gtk3')
makedepends=('cargo' 'rustup')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('00e5ab0b25a85ffe1f6ecc02912b35aa883274f30e8f564daf2d5ca5138dbd4c425a163f75cb1b7bf49dfe39fff5243924a628483870972f80ea56211ec60673')

build()
{
    export RUSTUP_HOME="$srcdir/.rustup/" 
    rustup install nightly

    cd "${srcdir}/${pkgname}-${pkgver}"
    export NOAA_APT_RES_DIR="/usr/share/noaa-apt"
    cargo +nightly build --release
}

package()
{
    cd "${srcdir}/${pkgname}-${pkgver}/"
    install -Dm755 "target/release/${pkgname}" "$pkgdir/usr/bin/${pkgname}"
    install -Dm644 "debian/ar.com.mbernardi.noaa-apt.desktop" "$pkgdir/usr/bin/usr/share/applications"
    
    cd res/
    sudo find ./ -type f -exec install -Dm644 "{}" "/usr/share/noaa-apt/{}" \;
}
