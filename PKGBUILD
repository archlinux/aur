pkgname=vigaphone-bin
pkgver=1.6.0_a
pkgrel=1
options=('!strip' '!debug')
groups=('pro-audio','vst3-plugins')
pkgdesc="ViGAPhone Synth Lab is a New Physical-Modeling Synthesizer MIDI-MPE application and VST3 plugin, Sound and Timbre Analyzer, Instrument Tuner and more..."
arch=('x86_64')
url="https://github.com/ViGAWorld-FR/ViGAWorld-ViGAPhone"
license=('custom')
source=("https://github.com/ViGAWorld-FR/ViGAWorld-ViGAPhone/releases/download/R${pkgver}/ViGAPhoneR_linux_amd64.tar.gz")
sha256sums=('c43147151ec0a888a81216f9540ea763eb8d98dc4ee69d9d7b3203cb72ebc9df')

depends=(
    'alsa-lib'
    'jack'
    'libx11'
    'libglvnd'
    'rsync'
)

makedepends=('rsync')

package() {
    cd "$srcdir/ViGAPhoneR"

    # Binaire
    install -pDm755 "ViGAPhone" "$pkgdir/usr/bin/ViGAPhone"

    # Licence
    install -pDm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Desktop entry
    # Ajout de la ligne Exec= dans le .desktop, et du chemin complet vers l'icône
    install -pDm644 installOnLinuxUser/org.vigaworld.vigaphone.desktop "$pkgdir/usr/share/applications/org.vigaworld.vigaphone.desktop"
	sed -i '/^\[Desktop Entry\]/a Exec=/usr/bin/ViGAPhone %f' $pkgdir/usr/share/applications/org.vigaworld.vigaphone.desktop
	sed -i "s|^Icon=.*|Icon=/usr/share/icons/hicolor/256x256/apps/org.vigaworld.vigaphone.png|" "$pkgdir/usr/share/applications/org.vigaworld.vigaphone.desktop"
    # Icône
    install -pDm644 installOnLinuxUser/org.vigaworld.vigaphone.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/org.vigaworld.vigaphone.png"
    install -pDm644 installOnLinuxUser/org.vigaworld.vigaphone.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/vigaphone.png"

    # Icône package manager
	install -pDm644 installOnLinuxUser/org.vigaworld.vigaphone.png "$pkgdir/usr/share/icons/hicolor/256x256/mimetypes/application-x-vigaphone-tsv.png"
    install -pDm644 installOnLinuxUser/org.vigaworld.vigaphone.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.vigaworld.vigaphone.svg"

    # MIME type
    install -pDm644 installOnLinuxUser/x-vigaphone-tsv.xml "$pkgdir/usr/share/mime/packages/x-vigaphone-tsv.xml"

	# metainfo & long Description
	install -pDm644 "installOnLinuxUser/org.vigaworld.vigaphone.metainfo.xml" "$pkgdir/usr/share/metainfo/org.vigaworld.vigaphone.metainfo.xml"

    # Locales
    for lang in locale/*; do
        langname=$(basename "$lang")
#        install -pDm644 "$lang/LC_MESSAGES/ViGAPhone.mo" "$pkgdir/usr/share/locale/$langname/LC_MESSAGES/ViGAPhone.mo"
		install -pDm644 $lang/ViGAPhone_$langname.po $pkgdir/usr/share/locale/$langname/ViGAPhone_$langname.po
    done

	# Données utilisateur (tout sauf ce qui est déjà installé ailleurs)
	# on garde installOnLinuxUser pour le script d'installation dans le $HOME
	rsync -a --chmod=D755,F644 --exclude=ViGAPhone --exclude=locale * $pkgdir/usr/share/vigaphone/
	# install global vst3
	install -dm 755 "$pkgdir/usr/lib/vst3"
	ln -rsf "$pkgdir/usr/share/vigaphone/VST3/ViGAPhone.vst3" "$pkgdir/usr/lib/vst3/"
}

