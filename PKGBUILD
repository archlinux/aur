# Maintainer: Will Price <will.price94@gmail.com>
_version=2018-02-27
pkgname=stanford-parser
pkgver=3.9.1
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
sha512sums=('e9c97218bed8046eb93ff02cc678ec5787bab9b95b7eb69247fa05facc34c89d51bebf0326dd4eac0b3be82806f9060e6635c7c784a26bce99ae4c28e8b55614')

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
