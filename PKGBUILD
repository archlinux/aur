# Maintainer: Will Price <will.price94@gmail.com>
pkgname=stanford-parser
pkgver=3.8.0
pkgrel=2
pkgdesc="A natural language parser is a program that works out the grammatical structure of sentences."
arch=(x86_64)
url="https://nlp.stanford.edu/software/lex-parser.shtml#Download"
license=('GPL')
groups=()
depends=(java-runtime)
optdepends=('stanford-corenlp-models-english: English models')
provides=('stanford-parser')
_version=2017-06-09
source=("https://nlp.stanford.edu/software/stanford-parser-full-${_version}.zip")
md5sums=('93695f5f6d42ac17f140965d239d1bc1')

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
