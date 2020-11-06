# Maintainer: Sainnhe Park <sainnhe@gmail.com>
_variant='vim'
_extname=coc-pyright
_packdir="usr/share/vim/vimfiles/pack/coc/start/${_extname}"
url='https://github.com/fannheyward/coc-pyright'
pkgdesc='Pyright extension for coc.nvim'

pkgname="${_variant}-${_extname}-git"
provides=("${_variant}-${_extname}")
conflicts=("${_variant}-${_extname}")
arch=('any')
depends=("${_variant}-coc" 'python')
optdepends=('autopep8: autopep8 formatting plugin'
            'python-black: black formatting plugin'
            'yapf: yapf formatting plugin'
            'flake8: flake8 linting plugin'
            'bandit: bandit linting plugin'
            'mypy: mypy linting plugin'
            'pytype: pytype linting plugin'
            'python-pep8: pep8 linting plugin'
            'python-prospector: prospector linting plugin'
            'python-pydocstyle: pydocstyle linting plugin'
            'pylama: pylama linting plugin'
            'python-pylint: pylint linting plugin')
makedepends=('yarn' 'npm' 'git')
license=('MIT')
source=("${_extname}::git+${url}.git")
pkgver=r204.9c13197
pkgrel=1
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_extname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_extname}"
    yarn install --frozen-lockfile --preferred-cache-folder "${srcdir}/.cache"
}

package() {
    cd "${srcdir}/${_extname}"
    yarn pack; tar xvf *.tgz; rm *.tgz
    cd package
    _dependencies=$(grep -Po '"dependencies":' package.json) || _dependencies=""
    if [ -n "${_dependencies}" ]; then
        yarn install --production --no-lockfile --ignore-scripts --prefer-offline --preferred-cache-folder "${srcdir}/.cache"
    fi
    find . -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/${_packdir}/{}" \;
    rm -rf "${srcdir}/${_extname}/package"
    find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
    chown -R root:root "${pkgdir}"
}
