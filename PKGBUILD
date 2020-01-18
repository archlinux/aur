# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: sqrlfish at gmail dot com

pkgname=python-gyb-git
_pkgname=got-your-back
pkgver=1.34.r0.g79f3da5
pkgrel=1
pkgdesc="Command line tool for backing up Gmail messages to your computer"
arch=('any')
url="https://github.com/jay0lee/${_pkgname}"
license=('Apache')
makedepends=('python-setuptools' 'git')
depends=('python>=3.5.0'
         'python-google-api-python-client')
provides=('gyb')
conflicts=("${_pkgname}")
options=(!emptydirs)
source=("git+https://github.com/jay0lee/${_pkgname}.git")
sha256sums=('SKIP')


pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${_pkgname}"
	# Gyb uses the executable path for storing both client secrets, configuration
	# files, and flag files (like nobrowser.txt.)  We'll instead use
	# /usr/share/gyb/ for the static secrets, and the current directory for
	# anything user-configurable. This makes gyb behave as if the executable was
	# located in the current working directory, as is described in README.txt
	sed -i "s/CLIENT_SECRETS = getProgPath()/CLIENT_SECRETS = '\/usr\/share\/gyb\/'/" gyb.py
	sed -i "s/os\.path\.dirname(os\.path\.realpath(sys\.argv\[0\]))/os\.path\.curdir/" gyb.py
}

package() {
	cd "${_pkgname}"
	install -D -m755 gyb.py "${pkgdir}/usr/bin/gyb"
	install -D -m644 client_secrets.json "${pkgdir}/usr/share/gyb/client_secrets.json"
}

# vim:set ts=2 sw=2 et:
