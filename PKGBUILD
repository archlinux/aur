# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: Jef Roosens

pkgname='cinny-desktop'
pkgver='4.11.2'
pkgrel='1'
pkgdesc='Matrix client focusing primarily on a simple, elegant and secure interface.'
arch=('aarch64' 'x86_64')
url='https://cinny.in/'
license=('MIT')
depends=('gst-plugins-good' 'libappindicator-gtk3' 'librsvg' 'libvips' 'openssl' 'sqlite' 'webkit2gtk-4.1')
makedepends=('nodejs' 'npm' 'rust')
options=('!debug')
source=("${pkgname}-${pkgver}.zip::https://github.com/cinnyapp/${pkgname}/releases/download/v${pkgver}/${pkgname}-v${pkgver}.zip"
        "disable-updater.patch")
b2sums=('57ee78a2e900a0154927d317e51f291dee3fa72c904c3ffa33bec277807482c96b035539db1a882d08f9d33de2bbc194ccaa9ed21bfd8bf480de1067e3de066a'
        '657681dff8a2e9e3b1fd2b3686404ad2860a1c02528a097d5a2ae83b08b1e8150266fd024f6ad7f43dccacfefe7551a4cbed4b532539dfb6995ed712450621e8')

build() {
  cd "${pkgname}"
  patch -p1 < ../disable-updater.patch
  msg2 'Installing Node dependencies...'
  cd 'cinny' && npm --legacy-peer-deps ci
  cd .. && npm ci
  msg2 'Running Tauri build...'
  # With the default memory limit, the build fails due to having insufficient
  # memory available. 4GB seems to be enough for now.
  NODE_OPTIONS=--max_old_space_size=4096 npm run tauri build -- --bundles 'deb'
}

package() {
  case "${CARCH}" in
    aarch64) pkgarch="arm64" ;;
    x86_64) pkgarch="amd64" ;;
    *) pkgarch="unsupported" ;
  esac
  ar x "${pkgname}/src-tauri/target/release/bundle/deb/Cinny_${pkgver}_${pkgarch}.deb" 'data.tar.gz'
  tar xzf 'data.tar.gz' -C "${pkgdir}"
}
