# Maintainer: Julian Wolff <wolff@julianwolff.de>
pkgname=moc-mpris-git
pkgver=1.0.r3.ccfadf7
pkgrel=1
pkgdesc="MPRIS2 support for local or remote instances of MOC - music on console"
arch=(any)
url="https://github.com/progwolff/moc-mpris"
license=('GPL')
groups=()
depends=('python>=3.6' 'python-dbus' 'python-musicbrainzngs')
makedepends=()
checkdepends=()
optdepends=('moc: control a local instance of moc' 'xterm: raise moc')
provides=('moc-mpris-git=${pkgver}' 'moc-mpris=${pkgver}')
conflicts=('moc-mpris')
replaces=()
backup=()
options=()
#install=
#changelog=
source=("git+https://github.com/progwolff/moc-mpris")
noextract=()
md5sums=(SKIP)
validpgpkeys=()

_gitroot="https://github.com/progwolff/moc-mpris"
_gitname=moc-mpris

pkgver() {
  cd "$_gitname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
	cd "${srcdir}/${_gitname}"
	
	mkdir -p "${pkgdir}/usr/lib/systemd/user/"
	mkdir -p "${pkgdir}/usr/lib/moc-mpris/"
	
	install -D *.service "${pkgdir}/usr/lib/systemd/user/"
	install -D *.sh "${pkgdir}/usr/lib/moc-mpris/"
	install -D *.py "${pkgdir}/usr/lib/moc-mpris/"
	
	echo "Run \`systemctl --user enable --now moc_mpris.service\` to enable MPRIS2 support for a local instance of MOC"
	echo "Run \`systemctl --user enable --now moc_mpris.service@'<ssh-user>@<ssh-address>'\` to enable MPRIS2 support for a remote instance of MOC. You will need to set up a password-less ssh connection for this to work."
}
