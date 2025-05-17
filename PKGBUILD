# Contributor: VnPower <vnpower@loang.net>
# Maintainer: VnPower <vnpower@loang.net>

pkgname=pixivfe
pkgver=v3.0
pkgrel=1
pkgdesc='An open source alternative frontend for Pixiv'
arch=('any')
url='https://codeberg.org/PixivFE/PixivFE'
license=('AGPL-3.0-only')
makedepends=('go' 'git')
provides=('pixivfe')
conflicts=('pixivfe')
_tag="a1c1d8912bb6d0eb67a683a6dc57b3ead496bf27"
source=("$pkgname::git+https://codeberg.org/${pkgname}/${pkgname}.git#tag=${_tag}")
sha256sums=('d853af4d720c5abc107878bcdfd55f5517bca370591b81e6eaa3adf2b485929f')

pkgver() {
    cd "$pkgname"
    git describe --tags | sed 's/-.*//'
}

prepare() {
    cd "$srcdir/$pkgname"

    # set Go flags
    export GOPATH="$srcdir"/gopath
    export CGO_ENABLED=0
    export GIT_COMMIT_DATE="$(git show -s --format=%cd --date=format:"%Y.%m.%d")"
    export GIT_COMMIT_HASH="$(git rev-parse --short HEAD)"
    export REVISION="${GIT_COMMIT_DATE}-${GIT_COMMIT_HASH}"

    # download dependencies
    go mod download
}

build() {

    cd "$srcdir/$pkgname"
    go build -v \
      -trimpath \
      -buildmode=pie \
      -mod=readonly \
      -modcacherw \
      -ldflags "-extldflags=-static \
      -X codeberg.org/pixivfe/pixivfe/config.revision=${REVISION}" \
      -o ${pkgname} \
      .
}

package() {
    cd ${pkgname}

    install -vDm755 "$srcdir/$pkgname/$pkgname" "$pkgdir/usr/bin/${pkgname}"
}
