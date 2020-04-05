# Maintainer : pianoslum <pianoslum@mailbox.org>

pkgname=elster
pkgver=21.2.0
pkgrel=1
pkgdesc='Elektronische Steuererklärung - Ein Projekt der deutschen Steuerverwaltungen aller Länder und des Bundes zur Abwicklung der Steuererklärungen und Steueranmeldungen über das Internet (The official German software for electronic tax declaration)'
arch=('any')
url='https://www.elster.de/'
license=('proprietary')
depends=('wine' 'lib32-libldap')
provides=(elster)
options=(!strip)
source=(
    "https://download.elster.de/aktuell/ElsterFormularPrivat.msi"
    "elster"
    )

md5sums=(
    "482d925e8878a3ead4207663fafa1076"
    "1cad66434bf3a305e6d5700c61359ca1"
    )

build() {
    install -m755 -d "$srcdir"/tmp/elster/
    export WINEPREFIX="$srcdir"/tmp/elster/
    export WINEARCH="win32"
    # don't add shortcuts to desktop and don't install mono or gecko to the new wine bottle
    export WINEDLLOVERRIDES="winemenubuilder.exe=d;mscoree=d;mshtml=d"
    # don't show debug messages when running wine
    export WINEDEBUG="-all"
    wine msiexec /i "$srcdir"/ElsterFormularPrivat.msi /quiet
}

package() {
    install -d "$pkgdir"/opt/elster/
    cp -r "$srcdir"/tmp/elster/drive_c/Program\ Files/ElsterFormular/ "$pkgdir"/opt/elster
    find "$pkgdir"/opt/elster/ -type f -exec chmod 644 "{}" \;

    install -d "$pkgdir"/usr/bin/
    install -m755 elster "$pkgdir"/usr/bin/
}
