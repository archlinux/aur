# Maintainer: Sebastian wniazdowski <psprint at zdharma dot org>

_name='zsh-zplugin-git'
pkgname="${_name}"
pkgver=r1477.43ac67f
pkgrel=1
pkgdesc="Flexible Zsh plugin manager with clean fpath, reports, completion management, turbo mode"
url="http://github.com/zdharma/zplugin"
arch=('any')
license=('GPL' 'MIT')
depends=('zsh>=4.3.17')
provides=('zsh-zplugin')
conflicts=('zsh-zplugin')
makedepends=('git')
source=('git+https://github.com/zdharma/zplugin.git')
sha512sums=('SKIP')

_gitname='zplugin'

pkgver() {
    cd "${_gitname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    # .../zplugin
    typeset _plugindir="${pkgdir}/usr/share/zsh/plugin-managers/${_gitname}"
    typeset _bindir="${_plugindir}"
    # .../zsh-zplugin-git
    typeset _licdir="${pkgdir}/usr/share/licenses/${pkgname}" 

    cd "${srcdir}/${_gitname}"

    # Zplugin's source files
    install -dm0755 "${_plugindir}"
    install -m0644 zplugin{,-side,-install,-autoload}.zsh "${_plugindir}"
    install -m0755 git-process-output.zsh "${_plugindir}"

    # Zplugin-module files
    find zmodules/ -type d -exec install -dm 755 "{}" "${_plugindir}/{}" \;
    find zmodules/ -type f -exec install -m 744 "{}" "${_plugindir}/{}" \;

    # Installation script, ad-hoc tests, etc.
    cd ${srcdir}/${_gitname}"/doc"
    install -dm0755 "${_plugindir}/doc"
    install -m0644 -- *install.sh test-* zcompile zplugin.1 "${_plugindir}/doc"
}
