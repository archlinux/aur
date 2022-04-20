# Maintainer: Cedric Roijakkers <cedric [the at sign goes here] roijakkers [the dot sign goes here] be>.
# Inspired from the PKGBUILD for ferdi-git.

_pkgname='ferdium'
pkgname="ferdium-git"
pkgver=develop.r0.gd283f1d4
pkgrel=1
pkgdesc='A messaging browser that allows you to combine your favorite messaging services into one application - git version'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://ferdium.org/"
license=('Apache')
_electronpkg='electron15'
depends=("$_electronpkg" 'libxkbfile')
appbranch="develop"
recipiesbranch="master"
pnpmversion="6.32.8"
npmversion="8.7.0"
nodejsversion='16.14.2'
# We're depending on node v16 until https://github.com/nodejs/node-gyp/issues/2534 is fixed
makedepends=('nvm' 'git' 'python')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
	"$pkgname::git+https://github.com/ferdium/ferdium-app#branch=${appbranch}"
	"$pkgname-recipes::git+https://github.com/ferdium/ferdium-recipes#branch=${recipiesbranch}"
	'fix-autostart-path.diff'
)
sha512sums=('SKIP'
            'SKIP'
            '5263a9e1f4f9e4435f857181e67eb6b3ed254a18371ab5430bdf614821831aea2474f385b3860e783119fed5eb0c5f0cc94c74b1510e2ae29da524cd0d77fee3')

_sourcedirectory="$pkgname"

case "$CARCH" in
	i686)
		_electronbuilderarch='ia32'
	;;
	armv7h)
		_electronbuilderarch='armv7l'
	;;
	aarch64)
		_electronbuilderarch='arm64'
	;;
	*)
		_electronbuilderarch='x64'
	;;
esac

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Provide git submodules
	git submodule init
	git config submodule.recipes.url "$srcdir/$pkgname-recipes"
	git submodule update --init --recursive --remote --rebase --force

	# Set system Electron version for ABI compatibility
	sed -E -i 's|("electron": ").*"|\1'"$(cat "/usr/lib/$_electronpkg/version")"'"|' 'package.json'

	# Loosen node version restriction
	sed -E -i 's|("node": ").*"|\1'"$(node --version | sed 's/^v//')"'"|' 'package.json'

	# Specify path for autostart file
	patch --forward -p1 < '../fix-autostart-path.diff'
}

pkgver() {
	cd "$srcdir/$_sourcedirectory/"
	git describe --long --all | sed -e 's/^v//' -e 's/-\([^-]*-g[^-]*\)$/-r\1/' -e 's/-/./g' | sed -e 's#^heads/##g'
}

build() {
	# Prepare recipes
	cd "$srcdir/$_sourcedirectory/"

	# Disable the prepare script for recipes as we don't want husky to run
# 	sed -E -i 's|"prepare": ".*"|"prepare": ""|' 'recipes/package.json'

	export ELECTRON_CACHE="${srcdir}"/.cache/electron
    export ELECTRON_BUILDER_CACHE="${srcdir}"/.cache/electron-builder
    export CSC_IDENTITY_AUTO_DISCOVERY=false
    export CI=true

    # Deactivate any pre-loaded nvm, and make sure we use our own in the current source directory
    which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]

	# Install the correct version of NodeJS
    nvm install ${nodejsversion}

	# Install the correct versions of npm and pnpm
	npm i -gf npm@${npmversion}
	npm i -gf pnpm@${pnpmversion}

	# Build recipe archives
	pnpm install
	# Ignore errors for now
	pnpm run prepare-code || true

	cd recipes
	pnpm i
	pnpm run package
	cd ..
	export NODE_ENV='production'
	pnpm run build -- --linux --"${_electronbuilderarch}" --dir -c.electronDist="/usr/lib/$_electronpkg" -c.electronVersion="$(cat "/usr/lib/$_electronpkg/version")"
}

package() {
	cd "$srcdir/$_sourcedirectory/"

	local _outpath='out/linux'
	if [ "$_electronbuilderarch" != 'x64' ]; then
		_outpath="$_outpath-$_electronbuilderarch"
	fi
	_outpath="$_outpath-unpacked"

	install -Dm644 "$_outpath/resources/app.asar" "$pkgdir/usr/lib/$_pkgname/app.asar"
	cp -r --no-preserve=ownership --preserve=mode "$_outpath/resources/app.asar.unpacked/" "$pkgdir/usr/lib/$_pkgname/app.asar.unpacked/"

	install -dm755 "$pkgdir/usr/bin/"
	cat << EOF > "$pkgdir/usr/bin/$_pkgname"
#!/bin/sh
NODE_ENV=production ELECTRON_IS_DEV=0 exec $_electronpkg '/usr/lib/$_pkgname/app.asar' "\$@"
EOF
	chmod +x "$pkgdir/usr/bin/$_pkgname"

	install -dm755 "$pkgdir/usr/share/applications/"
	cat << EOF > "$pkgdir/usr/share/applications/$_pkgname.desktop"
[Desktop Entry]
Name=${_pkgname^}
Exec=/usr/bin/$_pkgname %U
Terminal=false
Type=Application
Icon=$_pkgname
StartupWMClass=${_pkgname^}
Comment=Ferdi is your messaging app / former Emperor of Austria and combines chat & messaging services into one application. Ferdi currently supports Slack, WhatsApp, WeChat, HipChat, Facebook Messenger, Telegram, Google Hangouts, GroupMe, Skype and many more. You can download Ferdi for free for Mac & Windows.
MimeType=x-scheme-handler/ferdi;
Categories=Network;InstantMessaging;
EOF

	for _size in 16 24 32 48 64 96 128 256 512 1024; do
		install -Dm644 "build-helpers/images/icons/${_size}x${_size}.png" "$pkgdir/usr/share/icons/hicolor/${_size}x${_size}/apps/$_pkgname.png"
	done
}
