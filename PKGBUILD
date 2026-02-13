pkgname=vigaphone-bin
pkgver=1.0.5
pkgrel=2
options=('!strip' '!debug')
groups=('pro-audio')
pkgdesc="ViGAPhone is a MIDI Physical‑Modeling Synthesizer Lab, Sound and Timbre Analyzer, Instrument Tuner and more..."
arch=('x86_64')
url="https://github.com/ViGAWorld-FR/ViGAWorld-ViGAPhone"
license=('custom')
source=("https://github.com/ViGAWorld-FR/ViGAWorld-ViGAPhone/releases/download/R${pkgver}/ViGAPhoneR_linux_amd64.tar.gz")
sha256sums=('15b7db1df7a35a5ba6393b0e2aa86b8b521f54e1e58e5cddc5bd7318872196c3')

depends=(
    'alsa-lib'
    'jack'
    'libx11'
    'mesa'
    'freetype2'
    'fontconfig'
)

makedepends=('rsync')

package() {
    cd "$srcdir/ViGAPhoneR"

    # Binaire
    install -Dm755 "ViGAPhone" "$pkgdir/usr/bin/ViGAPhone"

    # Licence
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Desktop entry
    # Ajout de la ligne Exec= dans le .desktop
    install -Dm644 installOnLinuxUser/org.vigaworld.vigaphone.desktop "$pkgdir/usr/share/applications/org.vigaworld.vigaphone.desktop"
    sed -i '/^\[Desktop Entry\]/a Exec=sh -c "ViGAPhone %f"' "$pkgdir/usr/share/applications/org.vigaworld.vigaphone.desktop"

    # Icône
    install -Dm644 installOnLinuxUser/org.vigaworld.vigaphone.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/org.vigaworld.vigaphone.png"

    # Icône package manager
    install -Dm644 installOnLinuxUser/org.vigaworld.vigaphone.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.vigaworld.vigaphone.svg"

    # MIME type
    install -Dm644 installOnLinuxUser/x-vigaphone-tsv.xml "$pkgdir/usr/share/mime/packages/x-vigaphone-tsv.xml"

	# metainfo & long Description
	install -Dm644 "installOnLinuxUser/org.vigaworld.vigaphone.metainfo.xml" "$pkgdir/usr/share/metainfo/org.vigaworld.vigaphone.metainfo.xml"

    # Locales
    for lang in locale/*; do
        langname=$(basename "$lang")
        install -Dm644 "$lang/LC_MESSAGES/ViGAPhone.mo" "$pkgdir/usr/share/locale/$langname/LC_MESSAGES/ViGAPhone.mo"
    done

    # Données utilisateur
    #- install -d "$pkgdir/usr/share/vigaphone"
    #- cp -r configuration Instrument midi wav wavCapture run.vigaphone.tsv "$pkgdir/usr/share/vigaphone/"
	# Données utilisateur (tout sauf ce qui est déjà installé ailleurs)
	# on garde installOnLinuxUser pour le script d'installation dans le $HOME
	rsync -a --chmod=D755,F644 --exclude=ViGAPhone --exclude=locale * $pkgdir/usr/share/vigaphone/

}

