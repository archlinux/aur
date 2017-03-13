# Maintainer: William Gathoye <william plus aur at gathoye dot be>
# Contributor:

pkgname=mattermosti18n-git
pkgver=r23.7e95378
pkgrel=2
pkgdesc='A tool for Mattermost used to convert translations between GNU gettext .po and JSON files'
arch=('x86_64' 'i686')

# Let's remove the .git extension in order to keep a working repository and not
# a bare one.
# http://stackoverflow.com/a/11069413/3514658
url='https://github.com/rodcorsi/mattermosti18n'
license=('MIT')

makedepends=('go')
options=('!strip' '!emptydirs')

provides=('mattermosti18n')
conflicts=('mattermosti18n')

source=('git+https://github.com/rodcorsi/mattermosti18n')
sha512sums=('SKIP')

pkgver() {
    cd mattermosti18n
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    mkdir -p 'src/github.com/rodcorsi/mattermosti18n'
    # go build does not support symlinks. Do not use this.
    # ln -s "$_pkgname" "src/github.com/rodcorsi/$_pkgname"
    # Only copies files not dotfiles/dotfolders like .git
    cp -R mattermosti18n/* ./src/github.com/rodcorsi/mattermosti18n
}

build() {
    # Do not define GOPATH like "$GOPATH:$srcdir". As GOPATH is empty by
    # default, the ':' will be present at the biginning of the sttring and go
    # will complain with:
    # go: GOPATH entry is relative; must be absolute path: "".
    # Using the -pkgdir argument cannot be used for this use case either.
    GOPATH="$srcdir" go install github.com/rodcorsi/mattermosti18n/...
}

check() {
    GOPATH="$srcdir" go test -v -x github.com/rodcorsi/mattermosti18n...
}

package() {
    install -Dm755 bin/i18n2po "$pkgdir/usr/bin/i18n2po"
    install -Dm755 bin/po2i18n "$pkgdir/usr/bin/po2i18n"
    install -Dm644 src/github.com/rodcorsi/mattermosti18n/LICENSE \
        "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
