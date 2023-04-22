_pkgname=joplin
pkgname=$_pkgname-electron
pkgver=2.10.13
pkgrel=1
_electronversion=22
pkgdesc="Joplin Desktop (Beta) for Linux, using the system Electron package"
arch=('any')
url="https://github.com/laurent22/joplin"
license=('AGPL-3.0')
depends=("electron$_electronversion" 'gtk3' 'libexif' 'libgsf' 'libjpeg-turbo' 'libwebp' 'libxss' 'nodejs>=17.3'
    'nss' 'orc' 'rsync' 'libvips')
optdepends=('libappindicator-gtk3: for tray icon')
makedepends=('git' 'npm' 'yarn' 'python' 'rsync' 'jq' 'yq' 'electron' 'libgsf' 'node-gyp>=8.4.1' 'libvips')
conflicts=("joplin-desktop")
source=(
    "joplin-${pkgver}.tar.gz::https://github.com/laurent22/joplin/archive/v${pkgver}.tar.gz"
    "joplin.desktop"
    "joplin.sh"
    "0001-support-enable-wayland-ime.patch"
)
sha256sums=(
    '0e94c0a2f280bb95d26ce7ba0af5f2668fe0c33be235df34b5910493f130e3e3'
    '9e26cd5f41d08c3c2804cf4f34cb867090371423ccbe250a890fac006d405deb'
    'bd8324d35faaf6815217d1cf31a0b5e4df80692b0312ad17aea20d51f95efd56'
    '88aebf8692468e8b2757bd32b888f620ef5de9f907bbe93a4851530faeb45c1e'
)

prepare() {
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1

    patch -Np1 -i "${srcdir}"/0001-support-enable-wayland-ime.patch -d "${srcdir}/joplin-${pkgver}"

    msg2 "Disabling husky (git hooks)"
    sed -i '/"husky": ".*"/d' "$srcdir/joplin-${pkgver}/package.json"

    msg2 "Deleting app-mobile and app-cli"
    rm -r "$srcdir/joplin-$pkgver/packages/app-mobile"
    rm -r "$srcdir/joplin-$pkgver/packages/app-clipper"
    rm -r "$srcdir/joplin-$pkgver/packages/app-cli"

	# Patch build to make it work with system electron
	export SYSTEM_ELECTRON_VERSION=$(electron$_electronversion -v | sed 's/v//g')
	export ELECTRONVERSION=$_electronversion
	sed -i "s|@electronversion@|${ELECTRONVERSION}|" "$srcdir/joplin.sh"

    msg2 "Installing dependencies through Yarn 3..."

    cd "$srcdir/joplin-$pkgver"
    yarn install
}

build() {
	electronDist=/usr/lib/electron$_electronversion
	electronVer=$(electron$_electronversion --version | tail -c +2)
    
	export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export LANG=en_US.utf8

    msg2 "Building the workspace"
    cd "$srcdir/joplin-$pkgver"

    yarn workspace @joplin/app-desktop build
	yarn workspace @joplin/app-desktop electron-builder --linux -c.electronDist=$electronDist -c.electronVersion=$electronVer
}

package() {
    cd "${srcdir}/joplin-${pkgver}"
    cd packages/app-desktop

    install -vDm644 dist/linux-unpacked/resources/app.asar -t "${pkgdir}/usr/lib/${_pkgname}"
    cp -vr dist/linux-unpacked/resources/app.asar.unpacked -t "${pkgdir}/usr/lib/${_pkgname}"
    cp -vr dist/linux-unpacked/resources/build -t "${pkgdir}/usr/lib/${_pkgname}"

	for i in 16 32 64 128 256 512 1024; do
		[[ -f "build/icons/${i}x${i}.png" ]] && install -vDm644 build/icons/${i}x${i}.png "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${_pkgname}.png"
	done

	install -vDm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/joplin-desktop"
	install -vDm644 "${srcdir}"/${_pkgname}.desktop -t "${pkgdir}"/usr/share/applications
}
