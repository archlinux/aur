# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Co-Maintainer: Chris Billington <chrisjbillington at gmail dot com>
pkgname=git-nautilus-icons-git
pkgver=2.0.0.r0.g636aeb3
pkgrel=1
pkgdesc="A Nautilus, Nemo, and Caja extension to overlay icons on files in git repositories"
arch=('any')
url="https://github.com/chrisjbillington/git-nautilus-icons"
license=('BSD 2-Clause "Simplified"')
depends=('python-gobject')
makedepends=('python-setuptools-scm')
optdepends=('python-nautilus: Nautilus support'
            'nemo-python: Nemo support'
            'python-caja: Caja support')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" "${pkgname%-git}-common" 'git-caja-icons'
           'git-nemo-icons')
replaces=("${pkgname%-git}-common-git" 'git-caja-icons-git'
          'git-nemo-icons-git')
source=("git+https://github.com/chrisjbillington/git-nautilus-icons.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"

	# compile Python bytecode for modules outside of site-packages:
	python -m compileall -d / "$pkgdir"/usr/share
	python -O -m compileall -d / "$pkgdir"/usr/share
}
