# Maintainer: tuberry

_srcname=dict-cedict
_txtname=cedict_1_0_ts_utf-8_mdbg.txt
pkgname=dict-cedict-git
pkgver=20210629.r8.b2e60bc
pkgrel=1
pkgdesc="A port of CC-CEDICT database for dictd et al."
arch=('any')
url="https://www.mdbg.net/chinese/dictionary?page=cc-cedict"
license=('CCPL')
depends=('dictd')
makedepends=('dictd' 'git' 'python' 'curl')
provides=('dict-cedict')
conflicts=('dict-cedict')
install=${pkgname}.install
source=("${_txtname}.gz::https://www.mdbg.net/chinese/export/cedict/${_txtname}.gz"
        "git+https://github.com/tuberry/${_srcname}")
sha512sums=('SKIP'
            'SKIP')

pkgver()
{
    cd ${_srcname}
    printf "%s.r%s.%s" \
        "$( curl ${url} 2>&1 | grep Latest | grep -Eo '[[:digit:]]{4}-[[:digit:]]{2}-[[:digit:]]{2}' | tr -d '-' )" \
        "$( git rev-list --count HEAD )" \
        "$( git rev-parse --short HEAD )"
}

prepare()
{
    cd ${_srcname}
    ln -sf ${srcdir}/${_txtname} ${_txtname}
}

build()
{
    cd ${_srcname}
    make
}

package()
{
    cd ${_srcname}
    make DESTDIR=${pkgdir} install
}
