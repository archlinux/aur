# Maintainer: Antheas Kapenekakis (aur at antheas.dev)
# Maintainer: MrDuartePT <gonegrier.duarte@gmail.com>
_electronversion=28
_pkgname=hhd-ui
pkgname=$_pkgname
pkgver=1.0.3
pkgrel=1
pkgdesc="Configurator interface for Handheld Daemon."
arch=('x86_64')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
url='https://hhd.dev'
license=('MIT')
depends=("electron$_electronversion")
makedepends=('asar' 'libxss' 'npm')
_srcname=hhd-ui-$pkgver
source=("https://github.com/hhd-dev/hhd-ui/archive/refs/tags/v${pkgver}.tar.gz" "hhd-ui.desktop" "hhd-ui.sh")
sha512sums=('60f7712b0c158a7c3bb99e3236e02f2c6de4344197ebcaea7ffbce67385bc8d3361a0820e6afdad94232b565a5cf71ce255c9d558f1888230a66320c18e7a2b3'
            '598e77e42769adf69b78b39e784c24bb53202039316309c216ab1bb17d55f1820dadd453234085118aa3563d1593105b6287d793e58c5246bb71ec260103da28'
            '3f3a0b215d241b2c9f37efa3ce66adf1f1f58dc651853c924ac44c597b6b6b813548af4aba58c3c030ccbb56264bf4bb5e3d2b5a7be5098650e2581adf70645a')

prepare() {
	export ELECTRONVERSION=$_electronversion
	sed -i "s|@electronversion@|${ELECTRONVERSION}|" "$srcdir/hhd-ui.sh"

  cd $_srcname
  npm ci
	sed -i "s|"version": "1.0.0"|"version": "${pkgver}"|" "package.json"
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
  cd $_srcname/electron
	install -vDm644 dist/linux-unpacked/resources/app.asar -t "${pkgdir}/usr/lib/${_pkgname}"
	install -vDm644 package.json -t "${pkgdir}/usr/lib/${_pkgname}"
	# cp -vr dist/linux-unpacked/resources/app.asar.unpacked -t "${pkgdir}/usr/lib/${_pkgname}"

	install -vDm644 icon/android-chrome-512x512.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"

  cd $srcdir
	install -vDm755 "${srcdir}/hhd-ui.sh" "${pkgdir}/usr/bin/${_pkgname}"
	install -vDm644 "${srcdir}/hhd-ui.desktop" -t "${pkgdir}"/usr/share/applications
}
