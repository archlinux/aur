# Maintainer: Stefan Tatschner <rumpelsepp@sevenbyte.org>
# Contributor: Swift Geek
# Contributor: Pablo Olmos de Aguilera C. pablo+aur at odac dot co

_pkgname=powerline
pkgbase="python2-powerline"
pkgname=("python2-powerline" "python2-powerline-fonts" "python2-powerline-vim" "python2-powerline-zsh" "python2-powerline-tmux")
pkgdesc='The ultimate statusline/prompt utility (stable package).'
pkgver=2.2
pkgrel=3
url="https://github.com/${_pkgname}/${_pkgname}"
license=('MIT')
arch=('any')
makedepends=('git' 'python2-setuptools' 'python-sphinx')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/${_pkgname}/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('0f1b8e0737f3ae91486e29e5c7c110f6ebb33ca7933e4cbaae2e28b47c3d2995')

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}/docs"
    # Issue #1388
    sed -i -e '3ifrom functools import reduce\' source/powerline_automan.py
}

build(){
    cd ${srcdir}/${_pkgname}-${pkgver}/docs
    make man
}

package_python2-powerline() {
    depends=('python2>=2.6')
    optdepends=('python2-psutil: improved system information'
                'python2-pygit2: improved git support'
                'zsh: better shell prompt'
                'gvim: vim compiled with Python support')
    conflicts=('python-powerline'
               'python-powerline-git'
               'python-powerline-git')

    cd ${srcdir}/${_pkgname}-${pkgver}
    python2 setup.py install --root="${pkgdir}" --optimize=1

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -dm755 "${pkgdir}/usr/share/man/man1/"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/docs/_build/man/"* "${pkgdir}/usr/share/man/man1/"
}

package_python2-powerline-fonts() {
    pkgdesc='The patched fonts for powerline'
    provides=('otf-powerline-symbols')
    conflicts=('otf-powerline-symbols-git')
    install="powerline-fonts.install"

    cd ${srcdir}/${_pkgname}-${pkgver}

    install -dm755 "${pkgdir}/etc/fonts/conf.d"
    install -Dm644 "font/PowerlineSymbols.otf" "${pkgdir}/usr/share/fonts/OTF/PowerlineSymbols.otf"
    install -Dm644 "font/10-powerline-symbols.conf" "${pkgdir}/etc/fonts/conf.avail/10-powerline-symbols.conf"
    ln -s "../conf.avail/10-powerline-symbols.conf" "${pkgdir}/etc/fonts/conf.d/10-powerline-symbols.conf"
}

package_python2-powerline-vim() {
    pkgdesc='Powerline vim plugin (python2 build)'
    depends=('python2-powerline')

    cd ${srcdir}/${_pkgname}-${pkgver}
    install -Dm644 "powerline/bindings/vim/plugin/powerline.vim" "${pkgdir}/usr/share/vim/vimfiles/plugin/powerline.vim"
}

package_python2-powerline-zsh() {
    pkgdesc='Powerline zsh plugin'
    depends=('python2-powerline')

    cd ${srcdir}/${_pkgname}-${pkgver}
    install -Dm644 "powerline/bindings/zsh/powerline.zsh" "${pkgdir}/usr/share/zsh/site-contrib/powerline.zsh"
}

package_python2-powerline-tmux() {
    pkgdesc='Powerline tmux plugin'
    depends=('python2-powerline')

    cd ${srcdir}/${_pkgname}-${pkgver}
    install -Dm644 "powerline/bindings/tmux/powerline.conf" "${pkgdir}/usr/share/tmux/powerline.conf"
}
