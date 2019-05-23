# Maintainer: Valentijn V. <deepnavy at waifu dot club>
pkgname=gb-studio-git # '-bzr', '-git', '-hg' or '-svn'
_pkgname=gb-studio
pkgver=1.1.0.r36.g4e74b371
pkgrel=2
pkgdesc="Visual retro game maker"
arch=('x86_64')
url="https://github.com/chrismaltby/gb-studio"
license=('MIT')
groups=()
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'util-linux' 'trash-cli')
makedepends=('git' 'yarn' 'npm' 'nodejs' 'dpkg')
provides=("gb-studio")
conflicts=("gb-studio")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/chrismaltby/gb-studio.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
	cd "${_pkgname}"
        build_ver=$(git describe --abbrev=0 --tags | cut -c 2-)

        msg2 "Installing npm packages..."
	npm install
	msg2 "Building deb file..."
        npx electron-forge make --targets deb
        cd out/make
	msg2 "Extracting deb file..."
        bsdtar -xf "${_pkgname}_${build_ver}_amd64.deb"
}

package() {
	cd "${_pkgname}/out/make"
        tar xf data.tar.xz -C "${pkgdir}"

        install -D -m644 "${pkgdir}/usr/lib/gb-studio/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
        install -D -m644 "${pkgdir}/usr/share/doc/gb-studio/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
}
