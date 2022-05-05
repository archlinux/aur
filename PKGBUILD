# Maintainer: Adrien Smith <adrien@panissupraomnia.dev>
# Contributor: Simon Kohlmeyer <simon.kohlmeyer@googlemail.com>

pkgname=rbenv-git
pkgver=1.2.0.r14.gc6cc0a1
pkgrel=1
pkgdesc="Simple Ruby version manager"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/rbenv/rbenv"
license=('MIT')
depends=('bash')
makedepends=('git')
optdepends=('ruby-build')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install="rbenv.install"
source=('git+https://github.com/rbenv/rbenv.git')
sha256sums=('SKIP')


build() {
    cd "${pkgname%-git}"
    src/configure
    make -C src
}

pkgver() {
    cd "${pkgname%-git}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${pkgname%-git}"

    install -Dm 644 ./LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

    # mkdir -p "$pkgdir/usr/lib/rbenv/completions/"
    install -Dm 644 -t "$pkgdir/usr/lib/rbenv/completions/" ./completions/*

    # mkdir -p "$pkgdir/usr/lib/rbenv/libexec/"
    install -Dm 755 -t "$pkgdir/usr/lib/rbenv/libexec/" ./libexec/*

    install -d "$pkgdir/usr/bin/"
    ln -s /usr/lib/rbenv/libexec/rbenv "$pkgdir/usr/bin/"

    install -Dm 644 rbenv.d/exec/gem-rehash/rubygems_plugin.rb \
        "$pkgdir/usr/lib/rbenv/hooks/exec/gem-rehash/rubygems_plugin.rb"
    install -m 644 rbenv.d/exec/gem-rehash.bash \
        "$pkgdir/usr/lib/rbenv/hooks/exec/gem-rehash.bash"
}
