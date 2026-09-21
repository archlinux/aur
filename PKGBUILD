# Maintainer: Diego Fernández Menéndez <dfimium499 at proton dot me>
# Contributor: Zhang Hua<zhanghua.00 at qq dot com>
# Contributor: Alejandro Quisbert <alejandropqc at protonmail dot com>
# Contributor: Ali Molaei <ali dot molaei at protonmail dot com> 

pkgname=mongosh-git
pkgver=5.2.4.r1.gf5a5b10e7
pkgrel=5
pkgdesc="The MongoDB Shell."
arch=("x86_64" "aarch64")
depends=("nodejs" "krb5")
makedepends=("npm")
provides=("mongosh" "mongosh-bin")
conflicts=("mongosh" "mongosh-bin")
url="https://github.com/mongodb-js/mongosh"
license=("Apache-2.0")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver(){
    cd "${srcdir}/mongosh"
    git describe --tags --long | sed 's|^.*@\([0-9]\)|\1|;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
    cd "${srcdir}/mongosh"

    npm run bootstrap
    npm run compile-cli
    npm run webpack-build -w packages/cli-repl
}

# check(){
#     cd "${srcdir}/mongosh"
#     ./node_modules/.bin/lerna run test --scope @mongosh/cli-repl
# }
package() {
    cd "$srcdir"/mongosh

    install -dm755 "$pkgdir/usr/bin" 

    # Install node executable
    echo "#!/usr/bin/env node" | cat - packages/cli-repl/dist/mongosh.js > "$pkgdir"/usr/bin/mongosh

    chmod 755 "$pkgdir/usr/bin/mongosh"

    # Install licences and docs
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -m644 "THIRD_PARTY_NOTICES.md" "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "AUTHORS" "$pkgdir/usr/share/doc/$pkgname/AUTHORS"
    cp -r "docs" "$pkgdir/usr/share/doc/$pkgname/"
    chmod -R 644 "$pkgdir/usr/share/doc/$pkgname/docs"
}

