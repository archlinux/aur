# Maintainer: Mark Collins <tera_1225 hat hotmail ðot com>
pkgname=lameta
pkgver=2.1.2_alpha
pkgrel=1
pkgdesc="The Metadata Editor for Transparent Archiving of language document materials"
arch=('any')
url="https://github.com/onset/lameta"
license=('MIT')
makedepends=('nvm')
source=("https://github.com/onset/${pkgname}/archive/refs/tags/v${pkgver//_/-}.tar.gz"
	"lameta.desktop")
sha256sums=('2c48ad180599dde51129b9ac89292aab5332780a6c601e011b7ee2346282fc4c'
            '375f8c3eeb54bd79468d728b6d3520e2f9ca6085cda7776e7eded18b006d55e3')

build() {
	cd "${pkgname}-${pkgver//_/-}"
	echo "Setting up Nodejs version 14 with nvm"
	source /usr/share/nvm/init-nvm.sh
	nvm install 14
    echo "Running nvm exec 14 npm install yarn"
	nvm exec 14 npm install yarn
    echo "Running nvm exec 14 ./node_modules/.bin/yarn install"
	nvm exec 14 ./node_modules/.bin/yarn install
	echo "Running nvm exec 14 ./node_modules/.bin/lingui compile"
	nvm exec 14 ./node_modules/.bin/lingui compile
	echo "Running nvm exec 14 node ./node_modules/webpack/bin/webpack --config webpack.main-process.js --colors"
	export NODE_ENV=production
	nvm exec 14 node ./node_modules/webpack/bin/webpack --config webpack.main-process.js --colors
	echo "Running nvm exec 14 node ./node_modules/webpack/bin/webpack --config webpack.renderer-process.production.js --colors"
    nvm exec 14 node ./node_modules/webpack/bin/webpack --config webpack.renderer-process.production.js --colors
	echo "Running nvm exec 14 ./node_modules/.bin/electron-builder --linux --dir -c.extraMetadata.homepage='https://github.com/onset/lameta' --x64"
    nvm exec 14 ./node_modules/.bin/electron-builder --linux --dir -c.extraMetadata.homepage="https://github.com/onset/lameta" --x64
}

check() {
	cd "${pkgname}-${pkgver//_/-}"
	echo "Setting up Nodejs version 14 with nvm"
	source /usr/share/nvm/init-nvm.sh
	nvm install 14
	echo "Running nvm exec 14 ./node_modules/.bin/jest --clearCache"
	nvm exec 14 ./node_modules/.bin/jest --clearCache
	export NODE_ENV=test
	echo "Running nvm exec 14 node --trace-warnings ./test/runTests.js unit"
	nvm exec 14 node --trace-warnings ./test/runTests.js unit
}

package() {
	echo "Performing installation."
	mkdir "${pkgdir}/opt"
	cp -r "${pkgname}-${pkgver//_/-}/release/linux-unpacked" "${pkgdir}/opt/lameta"
	install -Dm644 lameta.desktop -t "${pkgdir}/usr/share/applications/"
	install -d "${pkgdir}/usr/bin/"
	ln -s /opt/lameta/lameta "${pkgdir}/usr/bin/lameta"
	echo "NOTE: this build dir is huge, so you might want to clean it up:"
    cd ../ && du -h -d0 "$(pwd)"
}
