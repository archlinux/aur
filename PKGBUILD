# Maintainer: Valentijn V. <neko at catgirlsin dot space>
pkgname=gb-studio-git # '-bzr', '-git', '-hg' or '-svn'
_pkgname=gb-studio
pkgver=1.1.0.r278.ga63866dd
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

        msg2 "Installing yarn packages..."
	yarn
	msg2 "Building deb file..."
        npx electron-forge make --targets deb
        cd out/make
	msg2 "Extracting deb file..."
	builddeb=$(ls *.deb)
        bsdtar -xf "${builddeb}"
}

package() {
	cd "${_pkgname}/out/make"
        tar xf data.tar.xz -C "${pkgdir}"

        install -D -m644 "${pkgdir}/usr/lib/gb-studio/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
        install -D -m644 "${pkgdir}/usr/share/doc/gb-studio/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
}
