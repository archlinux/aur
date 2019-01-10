# Maintainer: Harms <thotro at lyse dot net>
_gituser="atilaneves"
_gitrepo="cmake-ide"

pkgname=emacs-cmake-ide-git
pkgver=0.5.r201.g0a90200
pkgrel=1
pkgdesc="Enable IDE-like features on Emacs for CMake projects."
url="https://github.com/${_gituser}/${_gitrepo}.git"
arch=('any')
license=('custom')
depends=('emacs' 'emacs-dash' 'emacs-s')
makedepends=('git')
optdepends=('rtags' 'flycheck' 'emacs-auto-complete-clang' 'emacs-company-mode' 'irony-mode')
provides=('emacs-cmake-ide')
source=("git+https://github.com/${_gituser}/${_gitrepo}.git"
	cmake-ide.el.patch)
sha256sums=('SKIP'
            '6a486daeed6d4085646c1afaa1327be8dc81bcd360578f4d92435e59a60eaae7')

pkgver()
{
	cd "${_gitrepo}"
	git describe --long --tags | git describe --long | sed 's/^V//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare()
{
	cd ${_gitrepo}
	patch -p1 < "${srcdir}/cmake-ide.el.patch"
}

build()
{
	cd "${_gitrepo}"
	emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package()
{
	cd "${_gitrepo}"
	install -d "$pkgdir"/usr/share/emacs/site-lisp/"${_gitrepo}"/
	install -d "$pkgdir"/usr/share/licenses/emacs-cmake-ide/
	install -m644 *.el{c,} "$pkgdir"/usr/share/emacs/site-lisp/"${_gitrepo}"/
	install -m644 LICENSE "$pkgdir"/usr/share/licenses/emacs-cmake-ide/
}
