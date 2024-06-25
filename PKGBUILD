# Ex-Maintainer: Valentijn V. <neko at catgirlsin dot space>
# Maintainer: Riley T. <rt@hellscaped.dev>
pkgname=gb-studio-git # '-bzr', '-git', '-hg' or '-svn'
_pkgname=gb-studio
pkgver=4.0.0.r3.g11278cb3a
pkgrel=1
pkgdesc="Visual retro game maker"
arch=('x86_64')
url="https://github.com/chrismaltby/gb-studio"
license=('MIT')
groups=()
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'util-linux' 'trash-cli')
makedepends=('git' 'yarn' 'npm' 'nvm' 'nodejs')
provides=("gb-studio")
conflicts=("gb-studio")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/chrismaltby/gb-studio.git')
noextract=()
md5sums=('SKIP')

_ensure_local_nvm() {
    # let's be sure we are starting clean
    which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
    export NVM_DIR="${srcdir}/.nvm"

    # The init script returns 3 if version specified
    # in ./.nvrc is not (yet) installed in $NVM_DIR
    # but nvm itself still gets loaded ok
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
	cd "${_pkgname}"
	msg2 "Setting up NVM to switch NodeJS version..."
	_ensure_local_nvm
	nvm install
        msg2 "Installing yarn packages..."
	yarn
	msg2 "Hacky fix until they merge my PR for the linux target..."
	sed 's/\"win32\"\]/\"win32\"\, \"linux\"]/' forge.config.js > temporaryhackplsignoreuntilmyprismerged
	mv temporaryhackplsignoreuntilmyprismerged forge.config.js
	msg2 "Building zip file..."
        npx electron-forge make --targets @electron-forge/maker-zip
        cd out/make/zip/linux/x64
	msg2 "Extracting zip file..."
	buildzip=$(ls *.zip)
        bsdtar -xf "${buildzip}"
}

package() {
	cd "${_pkgname}/out/make/zip/linux/x64/GB Studio-linux-x64"
	mkdir -p "${pkgdir}/usr/lib/gb-studio"
	mkdir "${pkgdir}/usr/bin"
        cp -r ./* "${pkgdir}/usr/lib/gb-studio"
	ln -s /usr/lib/gb-studio/gb-studio "${pkgdir}/usr/bin/gb-studio"

        install -D -m644 ./LICENSES.chromium.html "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
        install -D -m644 ./LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
}
