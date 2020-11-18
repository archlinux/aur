# Maintainer: tuberry

_upstream='skywind3000/ECDICT-ultimate'
_srcname=dict-ecdict
pkgname=dict-ecdict-git
pkgver=1.0.0.r6.6594129
pkgrel=1
pkgdesc="A port of Ultimate ECDICT database for dictd et al."
arch=('any')
url="https://github.com/${_upstream}"
license=('MIT')
optdepends=('dictd: dict client and server')
makedepends=('dictd' 'git' 'curl' 'python' 'unzip')
provides=('dict-ecdict')
conflicts=('dict-ecdict')
install=${pkgname}.install
source=("git+https://github.com/tuberry/${_srcname}")
sha512sums=('SKIP')

_get_latest_release()
{ # from -- https://gist.github.com/lukechilds/a83e1d7127b78fef38c2914c4ececc3c
  curl --silent "https://api.github.com/repos/$1/releases/latest" |
    grep '"tag_name":' |
    sed -E 's/.*"([^"]+)".*/\1/'
}

pkgver()
{
    cd ${_srcname}
    printf "%s.r%s.%s" \
        "$( _get_latest_release ${_upstream} )" \
        "$( git rev-list --count HEAD )" \
        "$( git rev-parse --short HEAD )"
}


package()
{
    cd ${_srcname}
    make VERSION=$( _get_latest_release ${_upstream} ) DESTDIR=${pkgdir} install

    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${_srcname}/LICENSE
}
