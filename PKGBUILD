# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Jan Tojnar <jtojnar@gmail.com>

_pkgname='hamster-gtk'
pkgname="python-$_pkgname-git"
_branch='develop'
pkgver=0.11.0.r105.g6b5d106
pkgrel=1
pkgdesc="A GTK interface to the hamster time tracker"
url="https://github.com/projecthamster/hamster-gtk"
depends=('gtk3' 'python' 'python-gobject' 'python-hamster-lib-git' 'python-orderedset')
makedepends=('git' 'python-setuptools')
options=(!emptydirs)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
license=('GPL3')
arch=('any')
source=("git://github.com/projecthamster/$_pkgname.git#branch=$_branch")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$_pkgname"
    find hamster_gtk -type f -exec sed -i 's/backports\.//g' {} +
    sed -i -e "s/find_packages()/find_packages(exclude=['tests'])/" setup.py
    sed -i -e 's!setup.py install!setup.py install --root="$(DESTDIR)"!g' Makefile
    make install DESTDIR="$pkgdir/"
}
