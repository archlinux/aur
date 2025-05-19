# Maintainer: Hauke Rehfeld <aur.archlinux.org@haukerehfeld.de>
_pkgname=python-keyring-minimal
pkgname="$_pkgname-git"
pkgver=r12.5c266c5
pkgrel=3
pkgdesc="A minimal libsecret keyring in python that works with keepassxc."
arch=(any)
url="https://github.com/hrehfeld/python-keyring-minimal"
depends=('python' 'libsecret')
license=(AGPL-3.0)
makedepends=("python" "python-pip" "git" 'python-build')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("git+${url}.git")
sha256sums=('SKIP')
noextract=()

pkgver() {
	cd "$srcdir/${_pkgname}"

	# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${_pkgname}"
	git checkout master
}

build() {
    cd $srcdir/$_pkgname
    python -m build --wheel --no-isolation
}
package() {
    cd $srcdir/$_pkgname
    python -m installer --destdir="$pkgdir" dist/*.whl

	  for f in "keyring-minimal-askpass"
	  do
		  install -Dm755 "$srcdir/${_pkgname}/$f" "$pkgdir/usr/bin/$f"
	  done
}
