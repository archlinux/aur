# Maintainer: Cedric Roijakkers <cedric [the at sign goes here] roijakkers [the dot sign goes here] be>.
# Inspired from the PKGBUILD for ferdi-git.

_pkgname='ferdium'
pkgname="ferdium-git"
pkgver=develop.r0.g81b4aae6
pkgrel=1
pkgdesc='A messaging browser that allows you to combine your favorite messaging services into one application (git build from latest commit).'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://ferdium.org/"
license=('Apache')
depends=('libxkbfile')
appbranch="develop"
recipiesbranch="master"
nodejsversion='18.0.0'
makedepends=('nvm' 'git' 'python' 'jq')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
	"$pkgname::git+https://github.com/ferdium/ferdium-app#branch=${appbranch}"
	"$pkgname-recipes::git+https://github.com/ferdium/ferdium-recipes#branch=${recipiesbranch}"
	'fix-autostart-path.diff'
)
sha512sums=('SKIP'
            'SKIP'
            'a38d053f249ab291049edb1afb61dcf4e513ab2ca15787861db6d06a181d41fa1a5a690688237bff4bb28efc8a09eae7759742699b1da5c124a037709c6f0eca')

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
	cd "$srcdir/$_sourcedirectory/recipes"
	git reset --hard origin/"${recipiesbranch}"
	cd "$srcdir/$_sourcedirectory/"
	git reset --hard origin/"${appbranch}"

	# Provide git submodules
	git submodule init
	git config submodule.recipes.url "$srcdir/$pkgname-recipes"
	git submodule update --init --recursive --remote --rebase --force

	# Specify path for autostart file
	patch --forward -p1 < '../fix-autostart-path.diff'
}

pkgver() {
	cd "$srcdir/$_sourcedirectory/"
	git describe --long --all | sed -e 's/^v//' -e 's/-\([^-]*-g[^-]*\)$/-r\1/' -e 's/-/./g' | sed -e 's#^heads/##g' | sed -e 's#^tags/##g'
}

build() {
	# Prepare recipes
	cd "$srcdir/$_sourcedirectory/"

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
    nvm use ${nodejsversion}

    # Check if the correct version of node is being used
    [[ $(node --version) == "v${nodejsversion}" ]]

    # Extract the correct versions of npm and pnpm from the package.json files
    EXPECTED_NPM_VERSION=$(jq --raw-output .engines.npm <"package.json")
    EXPECTED_PNPM_VERSION=$(jq --raw-output .engines.pnpm <"./recipes/package.json")

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

	# Run the electron build script
    $BASE_CMD run build -- --dir
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
Comment=Ferdium is your messaging app / former Emperor of Austria and combines chat & messaging services into one application. Ferdium currently supports Slack, WhatsApp, Gmail, Facebook Messenger, Telegram, Google Hangouts, GroupMe, Skype and many more. You can download Ferdium for free for Mac & Windows.
MimeType=x-scheme-handler/ferdium;
Categories=Network;InstantMessaging;
EOF

	# Install the icons
	for _size in 16 24 32 48 64 96 128 256 512 1024; do
		install -Dm644 "build-helpers/images/icons/${_size}x${_size}.png" "$pkgdir/usr/share/icons/hicolor/${_size}x${_size}/apps/$_pkgname.png"
	done
}
