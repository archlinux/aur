# Maintainer: Vaughan Milliman <vaughanm1@protonmail.com>

pkgname=simple-screenshot
pkgver=0.0.1
pkgrel=0
pkgdesc="A very simple screenshot tool, entirely contained in this PKGBUILD"
arch=('any')
license=('MIT')

depends=('hacksaw' 'shotgun' 'xclip' 'xdialog')

package() {
	cat << 'EOF' > simple-screenshot
# screenshot tool, MIT License - Vaughan Milliman
# To use, get the hacksaw, shotgun, xclip, and xdialog packages, along with coreutils

tmpfile=$(mktemp)
selection=$(hacksaw -f "-i %i -g %g")
if [ $? -eq 0 ]; then
        shotgun $selection $tmpfile
        filepath="$(Xdialog --title "Save Screenshot" --stdout --inputbox "Save Screenshot (Cancel to Copy)" 10 40 $HOME/Pictures/$(date -Isec).png)"
        if [ -z "$filepath" ]; then
                xclip -selection clipboard -target image/png $tmpfile
        elif [ -f "$filepath" ]; then
                $(Xdialog --title "Overwrite path?" --yesno "Overwrite path $filepath?" 10 20)
                if [ $? -eq 0 ]; then
                        \cp --force $tmpfile "$filepath"
                fi
        else
                cp $tmpfile "$filepath"
        fi

        rm $tmpfile
fi
EOF
	install -Dm755 simple-screenshot "$pkgdir/usr/bin/simple-screenshot"
	rm simple-screenshot
}

