# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Atom Long <atom0815@gmail.com>
pkgname=electron-builder
pkgver=26.15.3
# 可以通过 npm search electron-builder来确定版本
pkgrel=1
pkgdesc="A complete solution to package and build a ready for distribution Electron app with “auto update” support out of the box"
arch=(any)
url="https://www.electron.build/"
license=('MIT')
depends=(
    'nodejs'
    'python'
    'python-setuptools'
)
makedepends=(
    'npm'
)
options=(
    '!strip'
)
source=("${pkgname}-${pkgver}.tgz::http://registry.npmmirror.com/${pkgname}/-/${pkgname#nodejs-}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('ba4a932b2bff1d82f5a56416d9c9d9ea0a2a20f46b92fc64fed2f070094122bb')
package() {
    local HOME="${srcdir}/.electron-gyp"
	export NPM_CONFIG_CACHE="${srcdir}/.npm_cache"
	export NPM_CONFIG_MAXSOCKETS=32
	if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
		{
			export NPM_CONFIG_REGISTRY="https://registry.npmmirror.com"
			export NODEJS_ORG_MIRROR="https://npmmirror.com/mirrors/node"
		}
		find ./ -type f -name "package-lock.json" -exec sed -i "s/registry.npmjs.org/registry.npmmirror.com/g" {} +
	fi
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
    find "${pkgdir}"/usr -type d -exec chmod 755 {} +
    install -Dm644 "${pkgdir}/usr/lib/node_modules/${pkgname#nodejs-}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
