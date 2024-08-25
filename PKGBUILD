# Maintainer: <tjmnkrajyej at gmail dot com>
_gh() {
    curl -s "https://api.github.com/repos/$1" | awk -F '"' "/\"$2\":/{print \$4; exit}"
}

_repository=DanielGavin/ols
_odindate="`_gh odin-lang/Odin/releases/latest created_at`"
read -r _commit <<< "`_gh "$_repository/commits?per_page=1&until=$_odindate" sha`"

pkgname=odinls
pkgver=2024_08_01
pkgrel=1
pkgdesc='ols: language server for Odin'
arch=(x86_64)
url=https://github.com/$_repository
license=(MIT)
makedepends=(git)
depends=(odin)
options=('!lto')
source=(git+$url#commit=$_commit)
sha256sums=(SKIP)

pkgver() {
    cd ols
    git log -1 --format=%cs | tr - _
}

build() {
    cd ols
    ./build.sh
}

package() {
    install -D ols/ols "$pkgdir/usr/bin/ols"
}
