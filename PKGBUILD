# Maintainer: Diego Fernández Menéndez <dfimium499 at proton dot me>
# Contributor: Zhang Hua<zhanghua.00 at qq dot com>
# Contributor: Alejandro Quisbert <alejandropqc at protonmail dot com>
# Contributor: Ali Molaei <ali dot molaei at protonmail dot com> 

pkgname=mongosh-git
pkgver=5.2.4.r1.gf5a5b10e7
pkgrel=4
pkgdesc="The MongoDB Shell."
arch=("x86_64" "aarch64")
depends=("nodejs" "krb5")
makedepends=("nvm" "python" "git" "modclean")
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
    # Use specific npm version for compilation
    source /usr/share/nvm/init-nvm.sh
    install -d nvm
    export NVM_DIR="$srcdir"/nvm
    nvm install 24.18.0

    cd "${srcdir}/mongosh"

    # Compile to js (not standalone executable)
    npm run bootstrap
    npm run compile-cli

    # Exclude build dependencies
    npm prune --production

    # Remove prebuilt binaries for platforms/libcs we're not shipping for
    find . -path '*/node_modules/@nx/nx-*' -maxdepth 6 -type d \
    ! -name 'nx-linux-x64-gnu' -prune -exec rm -rf {} +

    # Clean up unused bloat
    modclean --path . -r -a "*.ts,.bin,.deps,.github,.vscode,bin.js,makefile" -I "license,makefile*"
}

# check(){
#     cd "${srcdir}/mongosh"
#     ./node_modules/.bin/lerna run test --scope @mongosh/cli-repl
# }
package() {
    cd "$srcdir"

    install -dm755 "$pkgdir/usr/bin" 
    install -dm755 "$pkgdir/usr/share/$pkgname"

    # Install program files under /usr/share
    cp -r mongosh "$pkgdir/usr/share/$pkgname"
    find "$pkgdir/usr/share/$pkgname/mongosh" -type d -exec chmod 755 {} +
    find "$pkgdir/usr/share/$pkgname/mongosh" -type f -exec chmod 644 {} +

    # Install bin wrapper
    cat > "$pkgdir/usr/bin/mongosh" << EOF
#!/bin/bash
exec node "/usr/share/$pkgname/mongosh/packages/cli-repl/bin/mongosh.js" "\$@"
EOF
    chmod 755 "$pkgdir/usr/bin/mongosh"

    # Install licences and docs
    cd mongosh
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -m644 "THIRD_PARTY_NOTICES.md" "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "AUTHORS" "$pkgdir/usr/share/doc/$pkgname/AUTHORS"
    cp -r "docs" "$pkgdir/usr/share/doc/$pkgname/"
    chmod -R 644 "$pkgdir/usr/share/doc/$pkgname/docs"
}

