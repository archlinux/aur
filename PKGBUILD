# Maintainer: Alexander Epaneshnikov <aarnaarn2@gmail.com>
# Contributor: Giga300 <giga300@protonmail.com>

pkgname=bitwarden-git
pkgver=1.24.6.r339.g3b4142bd
pkgrel=1
_nodeversion='14'
pkgdesc='Bitwarden Desktop Application (development version)'
arch=('x86_64')
url='https://github.com/bitwarden/desktop'
license=('GPL3')
depends=('electron11' 'libnotify' 'libsecret' 'libxtst')
makedepends=('git' 'npm' 'python' 'nvm' 'jq')
conflicts=('bitwarden')
options=('!strip' '!emptydirs')
source=(${pkgname%-git}::'git+https://github.com/bitwarden/desktop.git'
        jslib::'git+https://github.com/bitwarden/jslib.git'
        package.json.patch
        ${pkgname%-git}.sh
        ${pkgname%-git}.desktop)
sha512sums=('SKIP'
            'SKIP'
            'f222e442655391d267c0d9fb49265fc6ac0f430068b85ab818f37b83bca968cc811ccd9db6a78917e92500f8cef4cfa2dba7eb8240b106b8cc6f5aeb48a1ed51'
            'ac220119aa3590858a78f8159c9a055485b9a2b034c99555a2c1b9b140b5f6b9daa615db38dec4b72223dc37d92c3680aeb83d73d8b2a2f16bcd60bf8d833efa'
            '05b771e72f1925f61b710fb67e5709dbfd63855425d2ef146ca3770b050e78cb3933cffc7afb1ad43a1d87867b2c2486660c79fdfc95b3891befdff26c8520fd')

pkgver() {
	cd "${srcdir}/${pkgname%-git}"
	# cutting off 'v' prefix that presents in the git tag
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

_ensure_local_nvm() {
	# lets be sure we are starting clean
	which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
	export NVM_DIR="${srcdir}/.nvm"

	# The init script returns 3 if version
	# specified in ./.nvrc is not (yet) installed in $NVM_DIR
	# but nvm itself still gets loaded ok
	source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
	cd "${srcdir}/${pkgname%-git}"
	patch -p1 package.json "${srcdir}/package.json.patch"
	# Patch build to make it work with system electron
	SYSTEM_ELECTRON_VERSION=$(pacman -Q electron11 | cut -d' ' -f2 | cut -d'-' -f1)
	jq < package.json --arg ver $SYSTEM_ELECTRON_VERSION \
	   '.build["electronVersion"]=$ver | .build["electronDist"]="/usr/lib/electron11"' \
	   > package.json.patched
	mv package.json.patched package.json
	git submodule init
	git config submodule.jslib.url "$srcdir/jslib"
	git submodule update
	_ensure_local_nvm
	nvm install ${_nodeversion}
}

build() {
	cd "${srcdir}/${pkgname%-git}"
	_ensure_local_nvm
	export npm_config_cache="$srcdir/npm_cache"
	nvm use ${_nodeversion}
	export ELECTRON_SKIP_BINARY_DOWNLOAD=1
	npm install
	npm run build
	npm run clean:dist
	npx electron-builder build --dir
	nvm unalias default
}

package(){
	cd "${srcdir}/${pkgname%-git}"
	install -dm755 "${pkgdir}/usr/lib/${pkgname%-git}"
	cp -r dist/linux-unpacked/resources "${pkgdir}/usr/lib/${pkgname%-git}/"

	install -dm755 "${pkgdir}/usr/share/icons/hicolor"
	for i in 16 32 48 64 128 256 512; do
		install -Dm644 resources/icons/${i}x${i}.png "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname%-git}.png"
	done
	install -Dm644 resources/icon.png "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/${pkgname%-git}.png"

	install -dm755 "${pkgdir}/usr/bin"
	install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/bitwarden-desktop"

	install -Dm644 "${srcdir}"/${pkgname%-git}.desktop "${pkgdir}"/usr/share/applications/${pkgname%-git}.desktop
}
