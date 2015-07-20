# Maintainer: Timothée Ravier <tim@siosm.fr>
# Contributor: Pablo Olmos de Aguilera C. pablo+aur at odac dot co
# Contributor: Kim Silkebækken <kim.silkebaekken+aur@gmail.com>

_gitname=powerline
_gitbranch=develop
pkgbase=python-powerline-git
pkgname=('python2-powerline-git' 'python-powerline-git')
pkgdesc='The ultimate statusline/prompt utility'
pkgver=2391.090cd13
pkgrel=1
url='https://github.com/powerline/powerline'
license=('MIT')
arch=('i686' 'x86_64')
install="${_gitname}.install"
source=("${_gitname}::git://github.com/powerline/${_gitname}.git#branch=${_gitbranch}"
        "${install}")
sha256sums=('SKIP'
            'af07852748ddba1544feee53fdf747d3dd163597f026719f8a6f80045d0c5425')

pkgver() {
	cd "${_gitname}"
	echo "$(git rev-list --count ${_gitbranch}).$(git rev-parse --short ${_gitbranch})"
}

build() {
	cd "${_gitname}"/docs
	if [ -x "/usr/bin/sphinx-build2" ]; then
		make man SPHINXBUILD=sphinx-build2 BUILDDIR=_build-python2
	fi
	if [ -x "/usr/bin/sphinx-build" ]; then
		make man SPHINXBUILD=sphinx-build BUILDDIR=_build-python
	fi
}

package_generic() {
	# Fonts
	install -dm755 "${pkgdir}/etc/fonts/conf.d"
	install -Dm644 "font/PowerlineSymbols.otf" "${pkgdir}/usr/share/fonts/OTF/PowerlineSymbols.otf"
	install -Dm644 "font/10-powerline-symbols.conf" "${pkgdir}/etc/fonts/conf.avail/10-powerline-symbols.conf"
	ln -s "../conf.avail/10-powerline-symbols.conf" "${pkgdir}/etc/fonts/conf.d/10-powerline-symbols.conf"

	# Vim Plugin
	install -Dm644 "powerline/bindings/vim/plugin/powerline.vim" "${pkgdir}/usr/share/vim/vimfiles/plugin/powerline.vim"

	# Zsh Plugin
	install -Dm644 "powerline/bindings/zsh/powerline.zsh" "${pkgdir}/usr/share/zsh/site-contrib/powerline.zsh"

	# Tmux Configuration
	install -Dm644 "powerline/bindings/tmux/powerline.conf" "${pkgdir}/usr/share/tmux/powerline.conf"

	# License
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# Manpages
	install -dm755 "${pkgdir}/usr/share/man/man1/"
	install -Dm644 "docs/${_BUILDDIR}/man/"* "${pkgdir}/usr/share/man/man1/"
}

package_python2-powerline-git() {
	depends=('python2>=2.6')
	optdepends=('python2-psutil: improved system information'
	            'python2-pygit2: improved git support'
	            'mercurial: improved mercurial support'
	            'zsh: better shell prompt'
	            'gvim: vim compiled with Python support')
	makedepends=('git' 'python2-setuptools' 'python2-sphinx')
	conflicts=('python2-powerline'
	           'python-powerline-git'
	           'python-powerline'
	           'otf-powerline-symbols-git')

	cd "${_gitname}"
	python2 setup.py install --root="${pkgdir}" --optimize=1

	export _BUILDDIR=_build-python2

	package_generic
}

package_python-powerline-git() {
	depends=('python>=3.2')
	optdepends=('python-psutil: improved system information'
	            'python-pygit2: improved git support'
	            'zsh: better shell prompt'
	            'gvim: vim compiled with Python support')
	makedepends=('git' 'python-setuptools' 'python-sphinx')
	conflicts=('python2-powerline'
	           'python2-powerline-git'
	           'python-powerline'
	           'otf-powerline-symbols-git')

	cd "${_gitname}"
	python setup.py install --root="${pkgdir}" --optimize=1

	export _BUILDDIR=_build-python

	package_generic
}
