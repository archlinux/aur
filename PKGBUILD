# Maintainer: Soc Virnyl S. Estela <renegan.ronin@gmail.com>
# Contributor: Matthias Lisin <ml@visu.li>
# Contributor: Chris Nixon <chris.nixon@sigma.me.uk>

_pkgname=pyenv
pkgname=$_pkgname-git
pkgver=2.0.0.r0.g1270ca6b
pkgrel=1
epoch=1
pkgdesc="Easily switch between multiple versions of Python (Git)"
arch=('any')
url='https://github.com/pyenv/pyenv'
license=('MIT')
depends=('bash' 'git')
conflicts=('pyenv')
provides=('pyenv')
source=('git+https://github.com/pyenv/pyenv.git')
sha512sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd $srcdir/$_pkgname
  # application
  install -vDm 755 libexec/* -t "${pkgdir}/usr/share/${_pkgname}/libexec"
  install -vdm 755 "${pkgdir}/usr/bin"
  ln -sv "/usr/share/${_pkgname}/libexec/${_pkgname}" \
    "${pkgdir}/usr/bin/${_pkgname}"
  # application hooks
  install -vDm 755 pyenv.d/exec/pip-rehash/* \
    -t "${pkgdir}/usr/share/${_pkgname}/pyenv.d/exec/pip-rehash"
  install -vDm 644 pyenv.d/exec/*.bash \
    -t "${pkgdir}/usr/share/${_pkgname}/pyenv.d/exec/"
  install -vDm 644 pyenv.d/rehash/*.bash \
    -t "${pkgdir}/usr/share/${_pkgname}/pyenv.d/rehash"
  install -vDm 644 pyenv.d/rehash/conda.d/* \
    -t "${pkgdir}/usr/share/${_pkgname}/pyenv.d/rehash/conda.d"
  install -vDm 644 pyenv.d/rehash/source.d/* \
    -t "${pkgdir}/usr/share/${_pkgname}/pyenv.d/rehash/source.d"
  # plugin
  install -vDm 755 plugins/python-build/bin/* \
    -t "${pkgdir}/usr/share/${_pkgname}/plugins/python-build/bin"
  for bin in {${_pkgname}-{install,uninstall},python-build}; do
    ln -sv "/usr/share/${_pkgname}/plugins/python-build/bin/${bin}" \
      "${pkgdir}/usr/bin/${bin}"
  done
  cp -av plugins/python-build/share \
    "${pkgdir}/usr/share/${_pkgname}/plugins/python-build"
  # licenses
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -vDm 644 plugins/python-build/LICENSE \
    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.python-build"
  # shell completion
  install -vDm 644 completions/*.fish \
    -t "${pkgdir}/usr/share/fish/vendor_completions.d/"
  install -vDm 644 completions/${_pkgname}.bash \
    "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -vDm 644 completions/${_pkgname}.zsh \
    "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
  # docs
  install -vDm 644 {CHANGELOG,COMMANDS,README}.md \
    -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -vDm 644 plugins/python-build/README.md \
    "${pkgdir}/usr/share/doc/${_pkgname}/README-python-build.md"
}
