# Maintainer: Vinicius P. M. Miguel <viniciusp070204@gmail.com>
# Contributor: Marcos Paulo Evers Cordeiro 
# PKGBUILD to termonal
# Terminal is a terminal-based word game, inspired by popular word games, adapted for Portuguese. It runs entirely in the command line interface.

pkgname=termonal
pkgver=1.0.0
pkgrel=1
pkgdesc="A CLI-based word guessing game in Portuguese (based on termonal)"
arch=('any')
url="https://github.com/viniciuskant/termonal"
license=('MIT')
depends=('python')
makedepends=('git')
source=("$pkgname::git+$url.git")
sha512sums=('SKIP')

package() {
    cd "$srcdir/$pkgname"
    
    if [ -f "termo_cli.py" ]; then
        if head -1 "termo_cli.py" | grep -q "^#!"; then
            sed '1s|^#!.*|#!/usr/bin/env python3|' "termo_cli.py" > termo_cli_fixed.py
        else
            echo '#!/usr/bin/env python3' > termo_cli_fixed.py
            cat "termo_cli.py" >> termo_cli_fixed.py
        fi
        sed -i "s|'pt-br/conjugações'|'/usr/share/termonal/pt-br/conjugações'|g" termo_cli_fixed.py
        sed -i "s|'pt-br/icf'|'/usr/share/termonal/pt-br/icf'|g" termo_cli_fixed.py
        install -Dm755 termo_cli_fixed.py "$pkgdir/usr/bin/termonal"
        rm termo_cli_fixed.py
    else
        for pyfile in *.py; do
            if [ -f "$pyfile" ]; then
                if head -1 "$pyfile" | grep -q "^#!"; then
                    sed '1s|^#!.*|#!/usr/bin/env python3|' "$pyfile" > termo_cli_fixed.py
                else
                    echo '#!/usr/bin/env python3' > termo_cli_fixed.py
                    cat "$pyfile" >> termo_cli_fixed.py
                fi
                sed -i "s|'pt-br/conjugações'|'/usr/share/termonal/pt-br/conjugações'|g" termo_cli_fixed.py
                sed -i "s|'pt-br/icf'|'/usr/share/termonal/pt-br/icf'|g" termo_cli_fixed.py
                install -Dm755 termo_cli_fixed.py "$pkgdir/usr/bin/termonal"
                rm termo_cli_fixed.py
                break
            fi
        done
    fi
    
    install -d "$pkgdir/usr/share/termonal"
    cp -r pt-br "$pkgdir/usr/share/termonal/"
    
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}