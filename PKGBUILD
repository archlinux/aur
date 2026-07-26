# Maintainer: Josef Sejrek <packages@budbrain.de>

# Warum ein -bin-Paket aus einem RPM:
#
# Die App ist proprietär, es gibt also keinen Quelltext zum Bauen. Das AUR ist
# trotzdem der richtige Ort dafür — es verteilt selbst keine Binärdateien,
# sondern nur diese Bauanleitung; heruntergeladen wird beim Nutzer, direkt von
# budbrain.de.
#
# Als Quelle dient das RPM aus dem eigenen Paket-Repo, nicht ein zusätzliches
# Archiv: eine Artefaktquelle weniger, die aus dem Tritt geraten kann. Das
# Binary darin ist gegen glibc 2.34 gelinkt und läuft damit auf Arch ohne
# Weiteres.

pkgname=jssysinfo-bin
pkgver=1.10
pkgrel=1
pkgdesc="System tray monitor for CPU, GPU, temperature, network, memory and swap"
arch=('x86_64')
url="https://www.budbrain.de"
license=('LicenseRef-proprietary')
depends=('gtk3' 'hicolor-icon-theme' 'libayatana-appindicator')
provides=('jssysinfo')
conflicts=('jssysinfo')

# !strip ist Pflicht: makepkg strippt sonst jedes Binary im Paket. Diese App
# löst ihre Symbole im Absturzfall zur Laufzeit im eigenen Prozess auf — ohne
# Debug-Info nennt der Bericht nur noch Offsets.
options=('!strip' '!debug' '!emptydirs')

# Release-Nummer des RPM, aus dem dieses Paket entsteht — sie steigt,
# wenn sich der Paketinhalt bei gleicher Programmversion ändert.
# update-aur.sh setzt sie aus der .spec; hier nichts von Hand ändern.
_rpmrel=1
_rpm="jssysinfo-${pkgver}-${_rpmrel}.x86_64.rpm"
source=("https://www.budbrain.de/rpm/x86_64/${_rpm}")
noextract=("${_rpm}")
sha256sums=('440a0cee0d32214baa7b6fc63363f496f2df9b2e7916fdb80191682083442dbe')

package() {
    # Bewusst selbst entpacken statt makepkg machen zu lassen: ob RPMs
    # automatisch extrahiert werden, hängt an der libarchive-Version.
    bsdtar -xf "${srcdir}/${_rpm}" -C "${pkgdir}"

    # Die build-id-Verweise unter /usr/lib/.build-id sind ein Fedora-Konstrukt
    # für dessen debuginfo-Mechanismus. Auf Arch gehören sie nicht ins Paket.
    rm -rf "${pkgdir}/usr/lib/.build-id"

    # Das RPM legt die Lizenz unter dem RPM-Paketnamen ab, Arch erwartet sie
    # unter dem Namen DIESES Pakets.
    if [[ -d "${pkgdir}/usr/share/licenses/jssysinfo" ]]; then
        mv "${pkgdir}/usr/share/licenses/jssysinfo" \
           "${pkgdir}/usr/share/licenses/${pkgname}"
    fi
}
