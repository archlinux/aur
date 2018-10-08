# Maintainer: H. Rosendahl <h [at] ro [dot] sendahl [dot] de>
pkgname=um
_gemname=um
pkgver=4.1.0
pkgrel=1
pkgdesc="utility to create and maintain your own man pages so you can remember how to do stuff"
arch=("any")
url="https://github.com/sinclairtarget/um"
license=("MIT")
depends=("ruby" "ruby-kramdown")
makedepends=("ruby-rake")
options=(!emptydirs)
conflicts=('um-git')
source=("https://github.com/sinclairtarget/um/archive/4.1.0.tar.gz")
        
sha256sums=("SKIP")

build() {
    cd "$srcdir/$pkgname-$pkgver/"
    # Create man pages
    rm doc/man1/*
    rake

    # Compress man pages
    find doc/man1/ -name \*.1 -exec gzip {} \;

    # Build gem
    gem build --norc $_gemname.gemspec
}

package() {
    cd "$srcdir/$pkgname-$pkgver/"
    local _gemdir="$(ruby -e'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install --no-document \
        -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" \
        $_gemname-$pkgver.gem
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" \
        -t "$pkgdir/usr/share/licenses/$pkgname"
    rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
    install -Dm644 "$srcdir/$pkgname-$pkgver/um-completion.sh" \
        "$pkgdir/usr/share/bash-completion/completions/$_gemname"
}

# vim:set ts=4 sw=4 et:
