pkgname=vigaphone-bin
pkgver=1.1.0
pkgrel=1
options=('!strip' '!debug')
groups=('pro-audio')
pkgdesc="ViGAPhone Synth Lab is a MIDI Physical-Modeling Synthesizer, Sound and Timbre Analyzer, Instrument Tuner and more..."
arch=('x86_64')
url="https://github.com/ViGAWorld-FR/ViGAWorld-ViGAPhone"
license=('custom')
source=("https://github.com/ViGAWorld-FR/ViGAWorld-ViGAPhone/releases/download/R${pkgver}/ViGAPhoneR_linux_amd64.tar.gz")
	     https://github.com/ViGAWorld-FR/ViGAWorld-ViGAPhone/releases/download/R1.1.0/ViGAPhoneR_linux_amd64.tar.gz
sha256sums=('cd2c1930333f3c035310b997cccead1d5f7ebe01ca2ab03a302c68e01533afd8')

depends=(
    'alsa-lib'
    'jack'
    'libx11'
    'mesa'
    'freetype2'
    'fontconfig'
    'noto-fonts-emoji'
)

makedepends=('rsync')

package() {
    cd "$srcdir/ViGAPhoneR"

    # Binaire
    install -pDm755 "ViGAPhone" "$pkgdir/usr/bin/ViGAPhone"

    # Licence
    install -pDm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Desktop entry
    # Ajout de la ligne Exec= dans le .desktop
    install -pDm644 installOnLinuxUser/org.vigaworld.vigaphone.desktop "$pkgdir/usr/share/applications/org.vigaworld.vigaphone.desktop"
    sed -i '/^\[Desktop Entry\]/a Exec=sh -c "ViGAPhone %f"' "$pkgdir/usr/share/applications/org.vigaworld.vigaphone.desktop"

    # Icône
    install -pDm644 installOnLinuxUser/org.vigaworld.vigaphone.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/org.vigaworld.vigaphone.png"
    install -pDm644 installOnLinuxUser/org.vigaworld.vigaphone.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/vigaphone.png"

    # Icône package manager
    install -pDm644 installOnLinuxUser/org.vigaworld.vigaphone.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.vigaworld.vigaphone.svg"

    # MIME type
    install -pDm644 installOnLinuxUser/x-vigaphone-tsv.xml "$pkgdir/usr/share/mime/packages/x-vigaphone-tsv.xml"

	# metainfo & long Description
	install -pDm644 "installOnLinuxUser/org.vigaworld.vigaphone.metainfo.xml" "$pkgdir/usr/share/metainfo/org.vigaworld.vigaphone.metainfo.xml"

    # Locales
    for lang in locale/*; do
        langname=$(basename "$lang")
        install -pDm644 "$lang/LC_MESSAGES/ViGAPhone.mo" "$pkgdir/usr/share/locale/$langname/LC_MESSAGES/ViGAPhone.mo"
    done

    # Données utilisateur
    #- install -pD "$pkgdir/usr/share/vigaphone"
    #- cp -r configuration Instrument midi wav wavCapture run.vigaphone.tsv "$pkgdir/usr/share/vigaphone/"
	# Données utilisateur (tout sauf ce qui est déjà installé ailleurs)
	# on garde installOnLinuxUser pour le script d'installation dans le $HOME
	rsync -a --chmod=D755,F644 --exclude=ViGAPhone --exclude=locale * $pkgdir/usr/share/vigaphone/

}

