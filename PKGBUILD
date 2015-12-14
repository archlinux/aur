# Maintainer: Parazyd <parazyd AT dyne DOT org>
pkgname=jaromail
pkgver=4.0
pkgrel=2
pkgdesc="A commandline tool to easily and privately handle your e-mail"
arch=('x86_64' 'i686')
url="http://dyne.org/software/jaro-mail"
license=('GPL3')
depends=('zsh' 'mutt' 'fetchmail' 'vim' 'msmtp' 'notmuch' 'abook' 'elinks' 'pinentry' 'wipe' 'alot')
makedepends=('gcc' 'libgnome-keyring' 'glib2')
source=("https://files.dyne.org/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=("706468fc339ebc90901d050cf2c4ea76c0bc58943184ac6792970fddd8a2052f")

build() {

	cd "$pkgname-$pkgver"
    make

}

package() {

    cd "$pkgname-$pkgver"

    # local vars
    prefix=$pkgdir/usr/local
    jaro_libexec=$prefix/share/jaromail
    jaro_share=$prefix/share/jaromail
    #out of package vars
    PREFIX=/usr/local
    JARO_LIBEXEC=$PREFIX/share/jaromail
    JARO_SHARE=$PREFIX/share/jaromail

    mkdir -p "$jaro_share"
    mkdir -p "$jaro_share/.mutt"
    mkdir -p "$jaro_share/.stats"
    cp -ra doc/* $jaro_share/.mutt/
    cp -ra src/mutt/* $jaro_share/.mutt/
    cp -ra src/stats/* $jaro_share/.stats/

    mkdir -p $jaro_libexec/bin
    mkdir -p $jaro_libexec/zlibs
    cp src/jaro $jaro_libexec/bin/
    cp -ra build/gnu/* $jaro_libexec/bin/
    cp -r src/zlibs/* $jaro_libexec/zlibs/

    for l in $(ls $jaro_libexec/zlibs/ | grep '.zwc$'); do
        rm -f $l
    done

    for l in $(ls $jaro_libexec/zlibs/ | grep -v '.zwc$'); do
        zsh -c "zcompile $jaro_libexec/zlibs/$l"
    done

    chmod -R a+rX "$jaro_share"

    mkdir -p $prefix/bin
    echo -e "#!/usr/bin/env zsh" > $prefix/bin/jaro
    echo -e "export JAROWORKDIR=${JARO_SHARE}" >> $prefix/bin/jaro

    zsh -c "zmodload zsh/pcre"

    echo -e "export JAROMAILDIR=${PREFIX}" >> $prefix/bin/jaro
    echo "${JARO_SHARE}/bin/jaro \${=@}" >> $prefix/bin/jaro
    
    chmod +x $prefix/bin/jaro

    printf "\n\n*********************IMPORTANT**********************\n\n"
    printf "Jaro Mail installed in: $PREFIX\n"
    printf "Executable path: $PREFIX/bin/jaro\n\n"
    printf "To initialize your Mail dir use: jaro init\n"
    printf  "Default is $HOME/Mail\n"
    printf "Change it via environment variable JAROMAILDIR\n"
    printf "****************************************************\n\n"

}
