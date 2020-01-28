# Maintainer: Matthias Lisin <ml@visu.li>
# Contributor: Chris Nixon <chris.nixon@sigma.me.uk>
pkgname=pyenv-git
pkgver=1.2.16.r5.g7097f820
pkgrel=2
pkgdesc='Simple Python version management'
arch=('any')
url='https://github.com/pyenv/pyenv'
license=('MIT')
conflicts=('pyenv')
provides=('pyenv')
source=('git+https://github.com/pyenv/pyenv')
md5sums=('SKIP')

pkgver() {
    cd pyenv
    git describe --long | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
    cd pyenv

    install -dm755 "${pkgdir}"/{usr/bin,opt/pyenv}

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 completions/pyenv.bash "${pkgdir}/usr/share/bash-completion/completions/pyenv"
    install -Dm644 completions/pyenv.fish "${pkgdir}/usr/share/fish/completions/pyenv.fish"
    install -Dm644 completions/pyenv.zsh "${pkgdir}/usr/share/zsh/site-functions/_pyenv"

    cp -r libexec "${pkgdir}/opt/pyenv/libexec"
    ln -s "/opt/pyenv/libexec/pyenv" "${pkgdir}/usr/bin/pyenv"

    # install python-build plugin
    cd plugins/python-build
    PREFIX="${pkgdir}/opt/pyenv" ./install.sh 
    ln -s /opt/pyenv/bin/python-build "${pkgdir}/usr/bin/python-build"

    for bin in pyenv-{,un}install; do
        ln -s /opt/pyenv/bin/"${bin}" "${pkgdir}/opt/pyenv/libexec/${bin}"
    done
}
