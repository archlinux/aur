# Maintainer: Matthew McGinn <mamcgi@gmail.com>
# Contributor: Felipe F. Tonello <eu@felipetonello.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# TODO: support Toast

pkgbase=bitbake
pkgname=('bitbake' 'bitbake-vim')
_github_url="https://github.com/openembedded/bitbake"
pkgver=1.44.1
pkgrel=1
pkgdesc='Build tool executing tasks and managing metadata.'
arch=('any')
url='https://www.openembedded.org/wiki/Main_Page'
license=('GPL2')
makedepends=('git' 'wget')
source=("https://github.com/openembedded/bitbake/archive/${pkgver}.tar.gz")
md5sums=('f1738e17e75c71166fb9f4ef7367ae51')

check() {
    # if ! git config --global --get user.name; then
    #     unset_name=1
    #     git config --global user.name "Bitbake Tester"
    # fi
    # if ! git config --global --get user.email; then
    #     unset_email=1
    #     git config --global user.email "test@bitbake.com"
    # fi
    # use http over ftp to use travis
    # grep -rl "[^s]ftp://" "${pkgname}-${pkgver}"/lib/bb/tests/*py | xargs sed -i 's@ftp://@http://@g'
    # git config --local -l
    cd "${pkgbase}-${pkgver}"
    BB_SKIP_NETTESTS='yes' PYTHONPATH="${srcdir}/${pkgbase}-${pkgver}/lib" PATH="${PATH}:${srcdir}/${pkgbase}-${pkgver}/bin" python ./bin/bitbake-selftest --failfast -v
    # if [ "${unset_name}" -eq 1 ]; then
    #     unset_name=1
    #     git config --global --unset user.name
    # fi
    # if [ "${unset_email}" -eq 1 ]; then
    #     unset_email=1
    #     git config --global --unset user.email
    # fi
}

package_bitbake() {
    depends=(
        'python'
        'python-beautifulsoup4'
        'python-codegen'
        'python-django18'
        'python-ply'
        'python-progressbar'
        'python-pyinotify'
        'python-simplediff'
    )
    install=bitbake.install

    _pythonver=$(python --version | awk '{print $2}' | awk -F. '{print $1"."$2}')
    cd "${pkgbase}-${pkgver}"

    find . -iname "*.log" -delete
    install -d "${pkgdir}/usr/bin"
    install bin/bitbake* "${pkgdir}/usr/bin"

    install -d "${pkgdir}/usr/lib/python${_pythonver}/site-packages"
    cp -Ra lib/bb "${pkgdir}/usr/lib/python${_pythonver}/site-packages"
    cp -Ra lib/prserv "${pkgdir}/usr/lib/python${_pythonver}/site-packages"
    cp -Ra lib/hashserv "${pkgdir}/usr/lib/python${_pythonver}/site-packages"
    cp -Ra lib/bb/pysh "${pkgdir}/usr/lib/python${_pythonver}/site-packages"

    install -d "${pkgdir}/usr/share/man/man1"
    install doc/bitbake.1 "${pkgdir}/usr/share/man/man1"
}

package_bitbake-vim() {
    cd "${pkgbase}-${pkgver}"

    install -d "${pkgdir}/usr/share"
    cp -Ra contrib/vim "${pkgdir}/usr/share"
}
