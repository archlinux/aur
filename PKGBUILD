# Maintainer: Marat Moustafine <moustafine-@t-tuta-d.t-io>

_pkgname=qtools
pkgname=$_pkgname-git
pkgver=latest
pkgrel=1
pkgdesc='A toolset for reading/writing flash of Qualcomm chips'
arch=('i686' 'x86_64')
url=https://github.com/forth32/$_pkgname
license=('LGPL3')
depends=('readline')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
backup=(etc/$_pkgname/chipset.cfg)
source=(git+$url.git
        chipconfig.patch
        rename-qterminal.patch)
sha256sums=('SKIP'
            '618abb9acc929cdab9964a49254681bca07ffab088e283936501bfcdb5a881e4'
            'b7d074976dc8191b8133d2bdc7cd20d850f08b868acfab0bc50e3b4eca8b5989')

pkgver() {
  cd $_pkgname
  (
    set -o pipefail
    git describe --long --tags 2> /dev/null | sed -r 's/^[r|v]//;s/-/+/g' ||
    printf '%s+%s' $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
  )
}

prepare() {
  cd $_pkgname
  patch -N -p 1 -i ../chipconfig.patch
  patch -N -p 1 -i ../rename-qterminal.patch
}

build () {
  cd $_pkgname
  make all
}

package() {
  cd $_pkgname
  install -D -m 755 -t $pkgdir/usr/bin \
    mibibsplit \
    qbadblock \
    qblinfo \
    qcommand \
    qdload \
    qefs \
    qflashparm \
    qident \
    qnvram \
    qrflash \
    qrmem \
    qterm \
    qwdirect \
    qwflash
  install -D -m 644 -t $pkgdir/usr/lib/$_pkgname/loaders loaders/*.bin
  install -D -m 644 -t $pkgdir/usr/share/doc/$_pkgname doc/*.odt
  install -D -m 644 -t $pkgdir/etc/$_pkgname chipset.cfg
}
