# Maintainer: Stefan Tatschner <rumpelsepp@sevenbyte.org>
# Contributor: Swift Geek
# Contributor: Pablo Olmos de Aguilera C. pablo+aur at odac dot co

_pkgname=powerline
pkgname="python2-${_pkgname}"
pkgdesc='The ultimate statusline/prompt utility (stable package).'
pkgver=2.2
pkgrel=1
url="https://github.com/${_pkgname}/${_pkgname}"
license=('MIT')
arch=('any')
depends=('python2>=2.6')
optdepends=('python2-psutil: improved system information'
            'python2-pygit2: improved git support'
            'zsh: better shell prompt'
            'gvim: vim compiled with Python support')
makedepends=('git' 'python2-setuptools' 'python2-sphinx')
conflicts=('python-powerline'
           'python-powerline-git'
           'python-powerline-git'
           'otf-powerline-symbols-git')
provides=('otf-powerline-symbols')
install="${_pkgname}.install"
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/${_pkgname}/${_pkgname}/archive/${pkgver}.tar.gz"
        "${install}")
sha256sums=('0f1b8e0737f3ae91486e29e5c7c110f6ebb33ca7933e4cbaae2e28b47c3d2995'
            'af07852748ddba1544feee53fdf747d3dd163597f026719f8a6f80045d0c5425')

build(){
  	cd ${srcdir}/${_pkgname}-${pkgver}/docs
	# Issue #1388
  	sed -i -e '3ifrom functools import reduce\' source/powerline_automan.py
  	make man
  	cd _build/man
  	gzip ./*
}

package() {
	cd ${srcdir}/${_pkgname}-${pkgver}
	python2 setup.py install --root="${pkgdir}" --optimize=1

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
  	install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/docs/_build/man/"*.gz "${pkgdir}/usr/share/man/man1/"
}
