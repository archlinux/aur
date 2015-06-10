# Maintainer: Swift Geek
# Contributor: Pablo Olmos de Aguilera C. pablo+aur at odac dot co

_pkgname=powerline
pkgname="python-${_pkgname}"
pkgdesc='The ultimate statusline/prompt utility (stable package).'
pkgver=2.1.4
pkgrel=1
url="https://github.com/${_pkgname}/${_pkgname}"
license=('MIT')
arch=('any')
depends=('python>=3.2')
optdepends=('python-psutil: improved system information'
            'python-pygit2: improved git support'
            'zsh: better shell prompt'
            'gvim: vim compiled with Python support')
makedepends=('git' 'python-setuptools' 'python-sphinx')
conflicts=('python2-powerline'
           'python2-powerline-git'
           'python-powerline-git'
           'otf-powerline-symbols-git')
provides=('otf-powerline-symbols')
install="${_pkgname}.install"
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/${_pkgname}/${_pkgname}/archive/${pkgver}.tar.gz"
        "${install}")
sha256sums=('4e657ff7c03c3c7269d0faeaefc9408c96da10b1ea561fe165b84ea6bc2fd03e'
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
	python setup.py install --root="${pkgdir}" --optimize=1

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
