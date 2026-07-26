# Maintainer: Josef Sejrek <packages@budbrain.de>

# Warum ein -bin-Paket aus einem RPM:
#
# Die App ist proprietär, es gibt also keinen Quelltext zum Bauen. Das AUR ist
# trotzdem der richtige Ort dafür — es verteilt selbst keine Binärdateien,
# sondern nur diese Bauanleitung; heruntergeladen wird beim Nutzer, direkt von
# budbrain.de. Genau deshalb liegen dort auch Spotify und Discord.
#
# Als Quelle dient das RPM aus dem eigenen Paket-Repo, nicht ein zusätzliches
# Archiv: eine Artefaktquelle weniger, die aus dem Tritt geraten kann. Das
# Binary darin ist gegen glibc 2.34 gelinkt und läuft damit auf Arch (rolling)
# ohne Weiteres.

pkgname=wheredidmystoragego-bin
pkgver=1.0.7
pkgrel=1
pkgdesc="See where your disk space went — as a colourful treemap"
arch=('x86_64')
url="https://www.budbrain.de"
license=('LicenseRef-proprietary')
depends=('gtk3' 'hicolor-icon-theme')
optdepends=('zenity: Rückfalldialoge, wenn der Desktop keine eigenen anbietet')
provides=('wheredidmystoragego')
conflicts=('wheredidmystoragego')

# !strip ist Pflicht, nicht Geschmackssache: makepkg strippt sonst jedes
# Binary im Paket. Diese App löst ihre Symbole im Absturzfall zur Laufzeit im
# eigenen Prozess auf — ohne Debug-Info nennt der Bericht nur noch Offsets.
options=('!strip' '!debug' '!emptydirs')

# Release-Nummer des RPM, aus dem dieses Paket entsteht — sie steigt,
# wenn sich der Paketinhalt bei gleicher Programmversion ändert.
# update-aur.sh setzt sie aus der .spec; hier nichts von Hand ändern.
_rpmrel=1
_rpm="wheredidmystoragego-${pkgver}-${_rpmrel}.x86_64.rpm"
source=("https://www.budbrain.de/rpm/x86_64/${_rpm}")
noextract=("${_rpm}")
sha256sums=('8d947a4e69ef249eee3e022286f24947c792b3c8799b8a479fbb75d43bf418f7')

package() {
    # Bewusst selbst entpacken statt makepkg machen zu lassen: ob RPMs
    # automatisch extrahiert werden, hängt an der libarchive-Version.
    bsdtar -xf "${srcdir}/${_rpm}" -C "${pkgdir}"

    # Die build-id-Verweise unter /usr/lib/.build-id sind ein Fedora-Konstrukt
    # für dessen debuginfo-Mechanismus. Auf Arch gehören sie nicht ins Paket.
    rm -rf "${pkgdir}/usr/lib/.build-id"

    # Das RPM legt die Lizenz unter dem RPM-Paketnamen ab, Arch erwartet sie
    # unter dem Namen DIESES Pakets.
    if [[ -d "${pkgdir}/usr/share/licenses/wheredidmystoragego" ]]; then
        mv "${pkgdir}/usr/share/licenses/wheredidmystoragego" \
           "${pkgdir}/usr/share/licenses/${pkgname}"
    fi
}
