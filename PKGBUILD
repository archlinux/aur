# Maintainer: Antheas Kapenekakis (aur at antheas.dev)
# Maintainer: MrDuartePT <gonegrier.duarte@gmail.com>
_electronversion=31
_pkgname=hhd-ui
pkgname=$_pkgname
pkgver=3.2.3
pkgrel=1
pkgdesc="Configurator interface for Handheld Daemon."
arch=('x86_64')
# provides=("${_pkgname}")
conflicts=("${_pkgname}")
url='https://hhd.dev'
license=('GPL-3.0-or-later')
depends=("electron$_electronversion")
optdepends=('hhd: a version of Handheld Daemon to connect to (also works over the network).')
makedepends=('asar' 'libxss' 'npm')
_srcname=hhd-ui
source=("git+https://github.com/hhd-dev/hhd-ui.git#tag=v${pkgver}")
sha512sums=('547b8dd89d34a19dda6da4a3699da0677b6667a4b43b881dff270e2b4771563940e6dc65daf33513807732e51e8568d9bfa94ca101cf8e1966df6daad7d5c40f')

prepare() {
	export ELECTRONVERSION=$_electronversion

  cd $_srcname
	sed -i "s|@electronversion@|${ELECTRONVERSION}|" "./pkg/hhd-ui.sh"
  npm ci
	sed -i "s|\"version\": \"1.0.0\"|\"version\": \"${pkgver}\"|" ./electron/package.json
  cd ./electron
  npm ci
}

build() {
  cd $_srcname
  export npm_config_target=$(tail /usr/lib/electron/version)
  export npm_config_arch=x64
  export npm_config_target_arch=x64
  export npm_config_runtime=electron
  export npm_config_build_from_source=true
  npm run electron-build
  cd ./electron
  npm run build
}

package() {
  # Install the app
  cd $srcdir/$_srcname/electron
	install -vDm644 ./dist/linux-unpacked/resources/app.asar -t "${pkgdir}/usr/lib/${_pkgname}"
	install -vDm644 ./package.json -t "${pkgdir}/usr/lib/${_pkgname}"

  # Install the icons
  cd $srcdir/$_srcname
	install -vDm644 ./art/library_capsule.png "${pkgdir}/usr/share/applications/${pkgname}/library_capsule.png"
	install -vDm644 ./art/library_hero.png "${pkgdir}/usr/share/applications/${pkgname}/library_hero.png"
	install -vDm644 ./art/library_logo.png "${pkgdir}/usr/share/applications/${pkgname}/library_logo.png"
	install -vDm644 ./art/main_capsule.png "${pkgdir}/usr/share/applications/${pkgname}/main_capsule.png"
	install -vDm644 ./art/icon.png "${pkgdir}/usr/share/applications/${pkgname}/icon.png"

  # Install scripts
	install -vDm644 "./pkg/hhd-ui.desktop" -t "${pkgdir}"/usr/share/applications
	install -vDm755 "./pkg/hhd-ui.sh" "${pkgdir}/usr/bin/${_pkgname}"
}
