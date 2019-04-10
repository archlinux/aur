# Maintainer: Ricardo (XenGi) Band <email@ricardo.band>

_maxwidth=80
_maxheight=22
_firstpokemon=1
_lastpokemon=151

pkgname=pokeshell
pkgver=1.0.0
pkgrel=6
pkgdesc="Displays pokemons in your shell"
arch=(any)
license=('MIT')
makedepends=('curl' 'imagemagick' 'img2xterm')
options=(!emptydirs)
install='pokeshell.install'

build() {
    cd "$srcdir/"
    for _i in `seq $_firstpokemon 1 $_lastpokemon` ; do
        printf "Generating Pokemon #$_i"
        # download pokemon image
        curl -sL https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$_i.png -o $_i.png
        printf "."
        # trim image
        convert $_i.png -trim -resize ${_maxwidth}x$(($_maxheight * 2))\>  $_i.png
        printf "."
        # convert to escape sequences
        img2xterm $_i.png > $_i.pokemon
        printf ". done\n"
        # cleanup
        rm -f $_i.png
    done
}

package() {
    cd "$srcdir/"
    for _i in `seq $_firstpokemon 1 $_lastpokemon` ; do
        install -D -m644 $_i.pokemon "${pkgdir}/usr/share/${pkgname}/$_i.pokemon"
    done
}

