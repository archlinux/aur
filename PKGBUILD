# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Contributor: Giga300 <giga300@protonmail.com>

pkgname=bitwarden-git
pkgver=1.24.6.r384.gfcadedd4
pkgrel=1
pkgdesc='A secure and free password manager for all of your devices. (development version)'
arch=('x86_64')
url='https://github.com/bitwarden/desktop'
license=('GPL3')
depends=('electron11' 'libnotify' 'libsecret' 'libxtst' 'libxss' 'libnss_nis')
makedepends=('git' 'npm' 'python' 'node-gyp' 'nodejs-lts-fermium' 'jq')
conflicts=(${pkgname%-git})
source=(${pkgname%-git}::'git+https://github.com/bitwarden/desktop.git'
        jslib::'git+https://github.com/bitwarden/jslib.git'
        package.json.patch
        messaging.main.ts.patch
        ${pkgname%-git}.sh
        ${pkgname%-git}.desktop)
sha512sums=('SKIP'
            'SKIP'
            '4d5ca27983e492243d8945365196686d3986a552b8516f2a9077e9f8653d97f20be20d4203c676bdde6d283181b34bff32e1244695bec703c7b6bf4022fb5321'
            '822d97be407c2ac2a6926f5c925b0fd188c541014a623dd3815fdbf5ef67c0542f43aaf8d11535571a83a265f620e330f5326244f42c3902fddab442128fda95'
            'ac220119aa3590858a78f8159c9a055485b9a2b034c99555a2c1b9b140b5f6b9daa615db38dec4b72223dc37d92c3680aeb83d73d8b2a2f16bcd60bf8d833efa'
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
	SYSTEM_ELECTRON_VERSION=$(electron11 -v | sed 's/v//g')
	jq < package.json --arg ver $SYSTEM_ELECTRON_VERSION \
	   '.build["electronVersion"]=$ver | .build["electronDist"]="/usr/lib/electron11"' \
	   > package.json.patched
	mv package.json.patched package.json
}

build() {
	cd "${pkgname%-git}"
	export npm_config_cache="$srcdir/npm_cache"
	export ELECTRON_SKIP_BINARY_DOWNLOAD=1
	electronDist=$(dirname $(realpath $(which electron11)))
	electronVer=$(electron11 --version | tail -c +2)
	npm install
	npm run build
	npm run clean:dist
	npm exec -c "electron-builder --linux --x64 --dir -c.electronDist=$electronDist \
	             -c.electronVersion=$electronVer"
}

package(){
	cd "${pkgname%-git}"
	install -vDm755 dist/linux-unpacked/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname%-git}/resources"

	for i in 16 32 48 64 128 256 512; do
		install -vDm644 resources/icons/${i}x${i}.png "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname%-git}.png"
	done
	install -vDm644 resources/icon.png "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/${pkgname%-git}.png"

	install -vDm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/bitwarden-desktop"
	install -vDm644 "${srcdir}"/${pkgname%-git}.desktop -t "${pkgdir}"/usr/share/applications
}
