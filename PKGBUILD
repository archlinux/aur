pkgname=jibber
pkgver=21.405d41d
pkgrel=1
pkgdesc="Notification backend for Jira WebHooks to Jabber"
url="https://github.com/seletskiy/jibber"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('go')

source=("git://github.com/seletskiy/jibber.git" "jibber.service")
md5sums=('SKIP' 'SKIP')
backup=(
    'etc/jibber/jibber.conf'
    'etc/jibber/tpl/footer.tpl'
    'etc/jibber/tpl/head.tpl'
    'etc/jibber/tpl/issue-updated-changelog.tpl'
    'etc/jibber/tpl/issue-updated-comment.tpl'
    'etc/jibber/tpl/issue-updated-common.tpl'
    'etc/jibber/tpl/main.tpl'
)

pkgver() {
    cd "${pkgname}"
    echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
    cd "$srcdir/$pkgname"

    rm -rf "$srcdir/.go/src"

    mkdir -p "$srcdir/.go/src"

    export GOPATH=$srcdir/.go

    mv "$srcdir/$pkgname" "$srcdir/.go/src/"

    cd "$srcdir/.go/src/jibber/"
    ln -sf "$srcdir/.go/src/jibber/" "$srcdir/$pkgname"

    go get
}

package() {
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/etc/jibber/tpl/"
    mkdir -p "$pkgdir/etc/systemd/system/"
    cp "$srcdir/.go/bin/$pkgname" "$pkgdir/usr/bin"
    cp -r "$srcdir/$pkgname/tpl" "$pkgdir/etc/jibber/"
    cp -r "$srcdir/$pkgname/jibber.conf" "$pkgdir/etc/jibber/jibber.conf"
    cp -r $(readlink -f "$srcdir/jibber.service") "$pkgdir/etc/systemd/system/"
}
