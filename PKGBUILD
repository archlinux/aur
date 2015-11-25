# Maintainer: Alex Szczuczko <alex@szc.ca>
# Contributor: TDY <tdy.aur@gmail.com>

pkgname=ceylon-git
pkgver=master
pkgrel=1
pkgdesc="A powerful statically typed language for writing large programs in groups"
arch=("any")
url="http://ceylon-lang.org/"
license=("Apache" "custom:GPL-CP" "LGPL")
depends=("java-environment>=7" "bash")
makedepends=("git" "apache-ant")
optdepends=("nodejs: for JavaScript interoperability")
source=("ceylon-git::git+https://github.com/ceylon/ceylon.git#branch=master")
sha256sums=("SKIP")

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --match 'dist-*' --long --tags | sed -e 's/dist-//' -e 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname/dist"
    ant clean publish
}

package() {
    cd "$srcdir/$pkgname/dist/dist"

    #
    # Main files
    #

    # General
    install -dm755 "$pkgdir/usr/share/java/$pkgname/"
    cp -a contrib bin lib repo samples templates "$pkgdir/usr/share/java/$pkgname/"
    find "$pkgdir/usr/share/java/$pkgname/" -type d -print0 | xargs -0 chmod 755
    find "$pkgdir/usr/share/java/$pkgname/" -type f -print0 | xargs -0 chmod 644

    # Bin
    find "$pkgdir/usr/share/java/$pkgname/" -type f -name '*.bat' -print0 | xargs -0 rm
    chmod 755 "$pkgdir/usr/share/java/$pkgname/bin/ceylon"

    #
    # System integration
    #

    # Bin
    install -dm755 "$pkgdir/usr/bin/"
    ln -s "/usr/share/java/$pkgname/bin/ceylon" "$pkgdir/usr/bin/$pkgname"

    # Completion
    install -dm755 "$pkgdir/usr/share/bash-completion/completions/"
    ln -s "/usr/share/java/$pkgname/contrib/scripts/ceylon-completion.bash" "$pkgdir/usr/share/bash-completion/completions/$pkgname"

    # License
    install -Dm644 LICENSE-GPL-CP "$pkgdir/usr/share/licenses/$pkgname/GPL-CP"
    install -Dm644 NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
