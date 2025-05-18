# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: Jef Roosens

pkgname='cinny-desktop'
pkgver='4.7.0'
pkgrel='1'
pkgdesc='Matrix client focusing primarily on a simple, elegant and secure interface.'
arch=('x86_64')
url='https://cinny.in/'
license=('MIT')
depends=('gst-plugins-good' 'gtk3' 'libappindicator-gtk3' 'librsvg' 'libvips' 'openssl' 'sqlite' 'webkit2gtk')
makedepends=('nodejs' 'npm' 'rust')
options=('!debug')
source=("${pkgname}-${pkgver}.zip::https://github.com/cinnyapp/${pkgname}/releases/download/v${pkgver}/${pkgname}-v${pkgver}.zip")
b2sums=('d5c5d8b31417bae1651240c0d61e46004b307f5968f493b6ebf5590f0635851fe539bdec5e99c8b355fbd342531149f3deecad413fecb3cbafc94f39be7ba8f4')

build() {
    cd "${pkgname}"
    msg2 'Installing Node dependencies...'
    cd 'cinny' && npm --legacy-peer-deps ci
    cd .. && npm ci
    msg2 'Running Tauri build...'
    # With the default memory limit, the build fails due to having insufficient
    # memory available. 4GB seems to be enough for now.
    NODE_OPTIONS=--max_old_space_size=4096 npm run tauri build -- --bundles 'deb'
}

package() {
    ar x "${pkgname}/src-tauri/target/release/bundle/deb/cinny_${pkgver}_amd64.deb" 'data.tar.gz'
    tar xzf 'data.tar.gz' -C "${pkgdir}"
}
