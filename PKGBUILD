# Maintainer: Jake <aur@ja-ke.tech>
pkgname=keepassxc-wordlists-hunspell
pkgver=1.0
pkgrel=2
pkgdesc="Wordlists generated from system Hunspell dicts for keepassxc"
arch=('any')
url="https://github.com/wooorm/dictionaries"
license=('GPL')
depends=('keepassxc>=2.2.0')
optdepends=('hunspell-de'
            'hunspell-en_US'
            'hunspell-en_GB'
            'hunspell-en_CA'
            'hunspell-en_AU'
            'hunspell-el'
            'hunspell-es_es'
            'hunspell-fr'
            'hunspell-he'
            'hunspell-hu'
            'hunspell-it'
            'hunspell-nl'
            'hunspell-pl'
            'hunspell-ro'
        )
        
# Possible dict files and front matter/license info length
_lang=("de_DE.dic" "en_US.dic" "en_GB.dic" "en_CA.dic" "en_AU.dic" "el_GR.dic" "es_ES.dic"\
        "fr_FR.dic" "he_HE.dic" "hu_HU.dic" "it_IT.dic" "nl_NL.dic" "pl_PL.dic" "ro_RO.dic")
_front=(16 1 1 1 1 1 1 1 1 1 1 1 1 1)

prepare() {

for ((i = 0; i < ${#_lang[@]}; ++i)); do
    file="${_lang[$i]}"
    
    if [ -f /usr/share/hunspell/$file ]; then
        #Strip everything but the words and convert to UTF-8
        tail -n +${_front[$i]} /usr/share/hunspell/$file | sed -r 's/\/.+//g' > $srcdir/$file.txt
        echo "Converted "$file"!"
    else
        echo "("$file" not found)"
    fi
done

}

package() {
    for file in ${_lang[@]}; do        
        if [ -f $srcdir/$file.txt ]; then
        install -Dm644 $srcdir/$file.txt $pkgdir/usr/share/keepassxc/wordlists/$file.wordlist
        fi
    done

}
