# Maintainer: Cedric Roijakkers <cedric [the at sign goes here] roijakkers [the dot sign goes here] be>.
# Inspired from the PKGBUILD for ferdi-git.

_pkgname='ferdium'
pkgname="ferdium-git"
pkgver=6.0.0.nightly.65.r5542.d77d7e41
pkgrel=1
pkgdesc='A messaging browser that allows you to combine your favorite messaging services into one application (git build from latest commit).'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://ferdium.org/"
license=('Apache')
depends=('nss' 'atk' 'at-spi2-atk' 'libcups' 'libdrm' 'gdk-pixbuf2' 'gtk3' 'alsa-lib' 'c-ares' 'ffmpeg' 'libevent' 'libxkbfile' 'libxslt' 'minizip' 're2' 'snappy')
appbranch="develop"
makedepends=('nvm' 'git' 'python')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
	"$pkgname::git+https://github.com/ferdium/ferdium-app#branch=${appbranch}"
)
sha512sums=('SKIP')

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
	# Due to patches and sed's, reset the code to upstream before starting
	cd "$srcdir/$_sourcedirectory/"
	git reset --hard origin/"${appbranch}"

	# Initialise the recipes submodule
	git submodule init
	cd "$srcdir/$_sourcedirectory/recipes"
	git reset --hard
	cd "$srcdir/$_sourcedirectory/"
	git submodule update --init --recursive --remote --rebase --force

	# Specify path for autostart file
	sed -i -e "s#^const executablePath =.*#const executablePath = '/usr/bin/ferdium';#g" src/stores/AppStore.js
}

pkgver() {
	cd "$srcdir/$_sourcedirectory/"
	printf "%s.r%s.%s" "$(python -c "import sys, json; print(json.load(sys.stdin)['version'])" < package.json | sed -e 's/-/./g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	# Prepare recipes
	cd "$srcdir/$_sourcedirectory/"

	# Set environment variables needed for NodeJS/Electron
    export CI=true

    # Deactivate any pre-loaded nvm, and make sure we use our own in the current source directory
    which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]

	# Install the correct version of NodeJS (read from .nvmrc)
	nvm install $(cat .nvmrc)
    nvm use

    # Check if the correct version of node is being used
    if [[ "$(node --version)" != "v$(cat .nvmrc)" ]]
    then
    	echo "Using the wrong version of NodeJS! Expected [v"$(cat .nvmrc)"] but using ["$(node --version)"]."
    	exit 1
    fi

    # Extract the correct versions of npm and pnpm from the package.json files
    EXPECTED_NPM_VERSION=$(node -p 'require("./package.json").engines.npm')
    EXPECTED_PNPM_VERSION=$(node -p 'require("./recipes/package.json").engines.pnpm')

	# Empty the cache before building to avoid issues with packages not being found
	npm cache clean --force

	# Install the correct versions of npm and pnpm
	npm i -gf npm@${EXPECTED_NPM_VERSION}
	npm i -gf pnpm@${EXPECTED_PNPM_VERSION}

	# This is useful if we move from 'npm' to 'pnpm' for the main repo as well
    if [[ -s 'pnpm-lock.yaml' ]]; then
		BASE_CMD=pnpm
    else
		BASE_CMD=npm
    fi

	# Build recipe archives
	$BASE_CMD i
	$BASE_CMD run prepare-code || true

	# Run the package script
	pushd recipes
    pnpm i
    pnpm run package
    popd

	# Make sure the internal version of electron-builder is being used by prefixing it to the $PATH
	export PATH=./node_modules/.bin/:$PATH

	# Run the electron build script
	NODE_ENV='production' $BASE_CMD run build -- --dir
}

package() {
	cd "$srcdir/$_sourcedirectory/"

	# Determine where the unpacked output directory is located
	local _outpath='out/linux'
	if [ "$_electronbuilderarch" != 'x64' ]; then
		_outpath="$_outpath-$_electronbuilderarch"
	fi
	_outpath="$_outpath-unpacked"

	# Copy the linux-unpacked directory to the system
	install -d -m755 "${pkgdir}/opt/$pkgname/"
	cp -pr "$_outpath"/* "${pkgdir}/opt/$pkgname/"

	# Create a symlink in the default $PATH
	install -d -m755 "${pkgdir}/usr/bin/"
    ln -s "/opt/$pkgname/$_pkgname" ${pkgdir}/usr/bin/$_pkgname

    # Fix permissions of chrome-sandbox for those running the hardened kernel
    chmod 4755 "${pkgdir}/opt/$pkgname/chrome-sandbox"

    # Create a .desktop file
	install -dm755 "$pkgdir/usr/share/applications/"
	cat << EOF > "$pkgdir/usr/share/applications/$_pkgname.desktop"
[Desktop Entry]
Name=${_pkgname^}
Exec=/usr/bin/$_pkgname %U
Terminal=false
Type=Application
Icon=ferdium
StartupWMClass=Ferdium
Comment=Ferdium is your messaging app / former heir to the throne of Austria-Hungary and combines chat & messaging services into one application. Ferdium currently supports Slack, WhatsApp, Gmail, Facebook Messenger, Telegram, Google Hangouts, GroupMe, Skype and many more. You can download Ferdium for free for Mac, Windows, and Linux.
MimeType=x-scheme-handler/ferdium;
Categories=Network;InstantMessaging;
EOF

	# Install the icons
	for _size in 16 24 32 48 64 96 128 256 512 1024; do
		install -Dm644 "build-helpers/images/icons/${_size}x${_size}.png" "$pkgdir/usr/share/icons/hicolor/${_size}x${_size}/apps/$_pkgname.png"
	done
}
