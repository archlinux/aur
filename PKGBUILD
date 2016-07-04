# Maintainer: Simon Kohlmeyer <simon.kohlmeyer@googlemail.com>
pkgname=rbenv-git
pkgver=0.4.0.r210.f0e8bdc
pkgrel=1
pkgdesc="Simple Ruby version manager"
arch=('i686' 'x86_64')
url="http://github.com/rbenv/rbenv"
license=('custom:MIT')
groups=()
depends=('ruby' 'bash')
makedepends=('git')
optdepends=('ruby-build')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install="rbenv.install"
source=('git://github.com/rbenv/rbenv')
noextract=()
md5sums=('SKIP')


build() {
    cd "${pkgname%-git}/src"
    ./configure
    make
}

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "%s" "$(git describe --tags --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
    cd "${pkgname%-git}"

    mkdir -p "$pkgdir/usr/share/licenses/${pkgname}"
    install -m 644 ./LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

    mkdir -p "$pkgdir/usr/lib/rbenv/completions/"
    install -m 644 ./completions/* "$pkgdir/usr/lib/rbenv/completions/"

    mkdir -p "$pkgdir/usr/lib/rbenv/libexec/"
    install -m 755 ./libexec/* "$pkgdir/usr/lib/rbenv/libexec/"

    mkdir -p "$pkgdir/usr/bin/"
    ln -s /usr/lib/rbenv/libexec/rbenv "$pkgdir/usr/bin/"

    mkdir -p "$pkgdir/usr/lib/rbenv/hooks/exec/gem-rehash"
    install -m 644 rbenv.d/exec/gem-rehash/rubygems_plugin.rb \
        "$pkgdir/usr/lib/rbenv/hooks/exec/gem-rehash/rubygems_plugin.rb"
    install -m 644 rbenv.d/exec/gem-rehash.bash \
        "$pkgdir/usr/lib/rbenv/hooks/exec/gem-rehash.bash"
}
