# Maintainer: parazyd <parazyd@dyne.org>
pkgname=jaromail
pkgver=4.1
pkgrel=2
pkgdesc="A commandline tool to easily and privately handle your e-mail"
arch=('x86_64' 'i686')
url="https://www.dyne.org/software/jaro-mail/"
license=('GPL3')
depends=('zsh' 'mutt' 'fetchmail' 'vim' 'msmtp' 'notmuch' 'abook' 'elinks' 'pinentry' 'wipe' 'alot')
makedepends=('gcc' 'glib2')
source=("https://files.dyne.org/$pkgname/$pkgname-$pkgver.tar.gz"
        "00-remove-libgnome-keyring.patch")
sha256sums=("1ace90a24c3f73ceeff7b7e34470a2d7d01894ac63fdec9e16f333f09d94573f"
            "3fa439b8ae02c33005a004c45f246e43fa3642c3eb2540c40ad31975e5ecd2a9")
# Jaromil https://jaromil.dyne.org/contact
validpgpkeys=('6113D89CA825C5CEDD02C87273B35DA54ACB7D10')


prepare() {
    patch "$pkgname-$pkgver/build/build-gnu.sh" "00-remove-libgnome-keyring.patch"
}

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

    echo -e "export JAROMAILDIR=${HOME}/Mail" >> $prefix/bin/jaro
    echo "${JARO_SHARE}/bin/jaro \${=@}" >> $prefix/bin/jaro
    
    chmod +x $prefix/bin/jaro

    printf "\n\n*********************IMPORTANT**********************\n\n"
    printf "Jaro Mail installed in: $PREFIX\n"
    printf "Executable path: $PREFIX/bin/jaro\n\n"
    printf "To initialize your Mail dir use: jaro init\n"
    printf "Default is /root/Mail\n"
    printf "Change it via environment variable JAROMAILDIR\n"
    printf "****************************************************\n\n"

}
