pkgname=vigaphone-bin
pkgver=1.0.2
pkgrel=2
options=('!strip' '!debug')
groups=('pro-audio')
pkgdesc="ViGAPhone is a MIDI physical modelling synthesizer, audio‑analysis, and instrument‑tuning tool."
arch=('x86_64')
url="https://github.com/ViGAWorld-FR/ViGAWorld-ViGAPhone"
license=('custom')
#
source=("https://github.com/ViGAWorld-FR/ViGAWorld-ViGAPhone/releases/download/R${pkgver}/ViGAPhoneR_linux.tar.gz")
# test local source=("lastViGAPhoneR_linux.tar.gz")
sha256sums=('f16a2077a269c0c65995cd045ef64164df6210536c374e0d5e2f278d72244225')

depends=(
    'alsa-lib'
    'pipewire-jack'
    'libx11'
    'mesa'
    'freetype2'
    'fontconfig'
)
optdepends=(
    'jack'
)

makedepends=('rsync')

package() {
    cd "$srcdir/ViGAPhoneR"

    # Binaire
    install -Dm755 "ViGAPhone" "$pkgdir/usr/bin/vigaphone"

    # Licence
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Desktop entry
    # Ajout de la ligne Exec= dans le .desktop
    sed -i '/^\[Desktop Entry\]/a Exec=sh -c "vigaphone %f"' $srcdir/ViGAPhoneR/installOnLinuxUser/ViGAPhone.desktop
    install -Dm644 installOnLinuxUser/ViGAPhone.desktop "$pkgdir/usr/share/applications/vigaphone.desktop"

    # Icône
    install -Dm644 installOnLinuxUser/vigaphone256.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/vigaphone.png"

    # Icône package manager
    install -Dm644 installOnLinuxUser/vigaphone.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/vigaphone.svg"

    # MIME type
    install -Dm644 installOnLinuxUser/x-vigaphone-tsv.xml "$pkgdir/usr/share/mime/packages/x-vigaphone-tsv.xml"

	# metainfo & long Description
	install -Dm644 "installOnLinuxUser/org.vigaworld.vigaphone.metainfo.xml" "$pkgdir/usr/share/metainfo/org.vigaworld.vigaphone.metainfo.xml"

    # Données utilisateur
    install -d "$pkgdir/usr/share/vigaphone"
    #- cp -r configuration Instrument midi wav wavCapture run.vigaphone.tsv "$pkgdir/usr/share/vigaphone/"
    cp -a ./ "$pkgdir/usr/share/vigaphone/"


    # Locales
    for lang in locale/*; do
        langname=$(basename "$lang")
        install -Dm644 "$lang/LC_MESSAGES/ViGAPhone.mo" "$pkgdir/usr/share/locale/$langname/LC_MESSAGES/ViGAPhone.mo"
    done
}

