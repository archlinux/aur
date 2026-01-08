# Mantainer: tiziodcaio <d dot bass05 at pm dot me>
# Contributor: Matthew McGinn <mamcgi@gmail.com>
# Contributor: Felipe F. Tonello <eu@felipetonello.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase=bitbake
pkgname=(bitbake bitbake-vim)
pkgver=5.3
pkgrel=2
pkgdesc="Build tool executing tasks and managing metadata"
url="https://www.openembedded.org/wiki/Main_Page"
license=(GPL2)
arch=(any)
depends=(python python-beautifulsoup4 python-ply python-codegen
         python-progressbar python-pyinotify python-simplediff chrpath diffstat inetutils rpcsvc-proto)
#checkdepends=(git wget)
source=("https://git.openembedded.org/bitbake/snapshot/bitbake-yocto-${pkgver}.tar.gz")
sha256sums=('22754c09e296f964e7f5edfb75ead4121bdf29e3be616cb9b3ff3bb5cbc7ae81')

#check() {
#    if ! git config --global --get user.name; then
#        unset_name=1
#        git config --global user.name "Bitbake Tester"
#    fi
#    if ! git config --global --get user.email; then
#        unset_email=1
#        git config --global user.email "test@bitbake.com"
#    fi
#    cd "${pkgbase}-${pkgver}"
#    patch -p0 < "${srcdir}/ignore-TestHashEquivalenceTCPServer.patch"
#    BB_SKIP_NETTESTS='yes' PYTHONPATH="${srcdir}/${pkgbase}-${pkgver}/lib" PATH="${PATH}:${srcdir}/${pkgbase}-${pkgver}/bin" python ./bin/bitbake-selftest --failfast -v
#    if [ "${unset_name}" -eq 1 ]; then
#        unset_name=1
#        git config --global --unset user.name
#    fi
#    if [ "${unset_email}" -eq 1 ]; then
#        unset_email=1
#        git config --global --unset user.email
#    fi
#}

package_bitbake() {
    install=bitbake.install

    # _pythonver=$(python --version | awk '{print $2}' | awk -F. '{print $1"."$2}')
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
   
    cd "${pkgbase}-yocto-${pkgver}"

    find . -iname "*.log" -delete
    install -d "${pkgdir}/usr/bin"
    install bin/* "${pkgdir}/usr/bin"

    install -d "${pkgdir}${site_packages}"
    cp -Ra lib/* "${pkgdir}${site_packages}"

    rm -rvf "${pkgdir}${site_packages}/"{bs4,ply,progressbar,pyinotify.py,simplediff,codegen.py}

    # cp -Ra lib/prserv "${pkgdir}/usr/lib/python${_pythonver}/site-packages"
    # cp -Ra lib/hashserv "${pkgdir}/usr/lib/python${_pythonver}/site-packages"
    # cp -Ra lib/bb/pysh "${pkgdir}/usr/lib/python${_pythonver}/site-packages"

    install -D doc/bitbake.1 -t "${pkgdir}/usr/share/man/man1"
}

package_bitbake-vim() {
  depends=()
    cd "${pkgbase}-yocto-${pkgver}"

    install -d "${pkgdir}/usr/share"
    cp -Ra contrib/vim "${pkgdir}/usr/share"
}
