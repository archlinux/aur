# Maintainer: Hilary Jendrasiak <sylogista@sylogista.pl>
pkgname='noaa-apt'
pkgdesc='NOAA APT image decoder with GUI'
pkgver=1.3.0
pkgrel=1
arch=('x86_64' 'aarch64') 
url="https://github.com/martinber/${pkgname}"
license=('GPL3')
depends=('gsl' 'gtk3')
makedepends=('cargo' 'rustup')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('418a43561ab2fc1d56fad0130affa7b384b2f5580ee27138742082625cc642d971171bfbb1f6cb3b55190a765181012c844b363281ce2f95fdf80998d6cc9075')

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
