# Maintainer: zml <zml@aoeu.xyz>
pkgname=base16-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r492.d2773ce
pkgrel=1
pkgdesc="Base16 provides carefully chosen syntax highlighting and a default set of sixteen colors suitable for a wide range of applications. Base16 is both a color scheme and a template."
arch=('any')
url="http://chriskempson.github.io/base16"
license=('MIT')
makedepends=('git' 'ruby') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip')
source=('base16::git+https://github.com/chriskempson/base16-builder.git'
        'base16-template-for'
        'base16-list-schemes'
        'base16.default')
sha256sums=('SKIP'
            'c1008db7487d261306db1cd20ba6258a1862b899fefaf7e6fd623ca58f31b4ad'
            'ebfd99c08bb03ce3029d3b792ffbee63b861300ab1aafb07e0a80ca380df0607'
            '54d9c2b1043a6b408fa5ef22aad435eb0178f773f8d616aebf2795bd87bb11b6')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
    [ ! -e "./index" ] || rm index
}

build() {
	cd "$srcdir/${pkgname%-git}"
    ./base16

    for i in schemes/*; do
        echo "$(basename -s .yml $i)" >> index
    done
}

package() {
	cd "$srcdir/${pkgname%-git}"

    # Utilities
    install -m 644 -D ../base16.default $pkgdir/etc/default/base16
    install -m 555 -D ../base16-template-for $pkgdir/usr/bin/base16-template-for
    install -m 555 -D ../base16-list-schemes $pkgdir/usr/bin/base16-list-schemes
    install -m 444 -D LICENSE.md $pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE

    # Color scheme and index
    install -m 555 -D -d $pkgdir/usr/share/base16
    install -m 444 index $pkgdir/usr/share/base16/index
    cp -R output/* $pkgdir/usr/share/base16
}

