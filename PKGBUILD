# Maintainer: Will Price <will.price94@gmail.com>
_version=2018-10-17
pkgname=stanford-parser
pkgver=3.9.2
pkgrel=3
pkgdesc="A natural language parser is a program that works out the grammatical structure of sentences."
arch=(x86_64)
url="https://nlp.stanford.edu/software/lex-parser.shtml#Download"
license=('GPL')
groups=()
depends=(java-runtime)
optdepends=('stanford-corenlp-models-english: English models')
provides=('stanford-parser')
source=("https://nlp.stanford.edu/software/stanford-parser-full-${_version}.zip")
sha512sums=('1ecd54a26f413b6227caa9b2c04231816fb9bc1cf373efad1201f4d9a8cbe3f5dec8064c2f3680cc9e7dabc10ef4c6016941ab7420b1995af5be0e02587f8027')

package() {
    cd "${srcdir}/stanford-parser-full-${_version}"
    mkdir -p "${pkgdir}"/usr/{bin,share/{stanford-parser,doc/stanford-parser}}
    cp -r . "${pkgdir}/usr/share/stanford-parser"

    pushd "${pkgdir}/usr/bin"
    for script in lexparser{,-{gui,lang,lang-train-test}}; do
        cat > ${pkgdir}/usr/bin/${script} <<- EOF
			#!/bin/bash

			cd /usr/share/stanford-parser
			./${script}.sh
		EOF
		chmod +x ${pkgdir}/usr/bin/${script}
    done
    popd

    for doc in README{,_dependencies}.txt; do
        install -m 644 ${doc} ${pkgdir}/usr/share/doc/stanford-parser/
    done
}
