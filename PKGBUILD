# Maintainer: Terrasse <terrasse@qq.com>
# Maintainer: ccmywish <ccmywish@qq.com>
pkgname=chsrc-git
pkgver=20260725.r1996.80f5f4f
pkgrel=1
pkgdesc="A cli tool to change source for every software on every platform"
arch=('x86_64') # TODO: add more archs
url="https://github.com/RubyMetric/chsrc"
license=('GPL-3.0-or-later' 'MIT')
groups=()
depends=()
makedepends=('git')
checkdepends=('perl')
optdepends=('bash-completion: Bash auto-completion')
provides=('chsrc')
conflicts=('chsrc')
replaces=()
backup=()
options=()
install=
source=("$pkgname::git+$url")
noextract=()
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir"/"$pkgname"
    local date=$(git log -1 --format="%cd" --date=short | sed s/-//g)
    local count=$(git rev-list --count HEAD)
    local commit=$(git rev-parse --short HEAD)
    echo "$date.r${count}.$commit"
}

build() {
    cd "$srcdir"/"$pkgname"
	make build-in-release-mode
}

check() {
    cd "$srcdir"/"$pkgname"
    if [ ! -f "./chsrc" ]; then
        cp ./chsrc-release ./chsrc
    fi
    make fastcheck
}

package() {
    cd "$srcdir"/"$pkgname"
    make DESTDIR="$pkgdir" install
    # MIT License
    install -Dm 644 LICENSE-MIT.txt -t $pkgdir/usr/share/licenses/$pkgname
    # Texinfo
    makeinfo doc/chsrc.texi --output=doc/chsrc.info
    install -Dm 644 doc/chsrc.info -t $pkgdir/usr/share/info/
}
