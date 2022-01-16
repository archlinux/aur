# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Contributor: Giga300 <giga300@protonmail.com>

pkgname=bitwarden-git
pkgver=1.24.6.r494.gdad1a95f
pkgrel=1
_electronversion=14
pkgdesc='A secure and free password manager for all of your devices. (development version)'
arch=('x86_64')
url='https://github.com/bitwarden/desktop'
license=('GPL3')
depends=("electron$_electronversion" 'libnotify' 'libsecret' 'libxtst' 'libxss' 'libnss_nis')
makedepends=('git' 'npm' 'python' 'node-gyp' 'nodejs-lts-fermium' 'jq')
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=(${pkgname%-git}::'git+https://github.com/bitwarden/desktop.git'
        jslib::'git+https://github.com/bitwarden/jslib.git'
        package.json.patch
        messaging.main.ts.patch
        ${pkgname%-git}.sh
        ${pkgname%-git}.desktop)
sha512sums=('SKIP'
            'SKIP'
            '87cdb8287cbc0c4eb49b0fd456a66e200551b5da5c14991505f6301cf1b11132d938dfdf795c4df2a4b3e1ae2badf5dfe33c1207923ec8abc6f9b3e064af6015'
            'a54a37d554ab289086f1dbeec804be214dcb863548dc0858f1826bc15e70f2f73b0d296fa12959e27876ad846e13a08184a3f6782d3dd6c9baf7d0c7ed74a8ed'
            '44ee70d71abf9cf399736d00df0aa6815d452792c9589f5517fed4454bdfff6ad2a39ffee401eab0db180718b19e9565d9ecff8d1bd96a93d13e4f63eaf4d5fc'
            '05b771e72f1925f61b710fb67e5709dbfd63855425d2ef146ca3770b050e78cb3933cffc7afb1ad43a1d87867b2c2486660c79fdfc95b3891befdff26c8520fd')

pkgver() {
	cd "${pkgname%-git}"
	# cutting off 'v' prefix that presents in the git tag
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${pkgname%-git}"
	git submodule init
	git config submodule.jslib.url "$srcdir/jslib"
	git submodule update

	# Remove pre and postinstall routines from package.json.
	patch --strip=1 package.json ../package.json.patch
	# This patch is required to make "Start automatically on login" work
	patch --strip=1 src/main/messaging.main.ts ../messaging.main.ts.patch
	# Patch build to make it work with system electron
	export SYSTEM_ELECTRON_VERSION=$(electron$_electronversion -v | sed 's/v//g')
	export ELECTRONVERSION=$_electronversion
	jq < package.json \
	   '.build["electronVersion"]=$ENV.SYSTEM_ELECTRON_VERSION | .build["electronDist"]="/usr/lib/electron\(env.ELECTRONVERSION)"' \
	   > package.json.patched
	mv package.json.patched package.json
}

build() {
	cd "${pkgname%-git}"
	electronDist=/usr/lib/electron$_electronversion
	electronVer=$(electron$_electronversion --version | tail -c +2)
	export npm_config_cache="$srcdir/npm_cache"
	export ELECTRON_SKIP_BINARY_DOWNLOAD=1
	pushd jslib
	npm install
	popd
	npm install
	npm run build
	npm run clean:dist
	npm exec -c "electron-builder --linux --x64 --dir -c.electronDist=$electronDist \
	             -c.electronVersion=$electronVer"
}

package(){
	cd "${pkgname%-git}"
	install -vDm755 dist/linux-unpacked/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname%-git}"
	install -vDm644 build/package.json -t "${pkgdir}/usr/lib/${pkgname%-git}"

	for i in 16 32 48 64 128 256 512; do
		install -vDm644 resources/icons/${i}x${i}.png "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname%-git}.png"
	done
	install -vDm644 resources/icon.png "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/${pkgname%-git}.png"

	install -vDm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/bitwarden-desktop"
	install -vDm644 "${srcdir}"/${pkgname%-git}.desktop -t "${pkgdir}"/usr/share/applications
}
