# Maintainer: Berturion <berturion@free.fr>

pkgname=switchhosts-bin
pkgver=3.5.4
pkgrel=5517
pkgdesc="Switch hosts quickly!"
arch=('x86_64')
url="https://oldj.github.io/SwitchHosts"
license=("MIT")
options=(!strip)
depends=("desktop-file-utils")
makedepends=("imagemagick")
source=(
	'https://github.com/oldj/SwitchHosts/releases/download/v3.5.4/SwitchHosts._linux_x64_3.5.4.5517.zip'
	'https://raw.githubusercontent.com/oldj/SwitchHosts/master/app/assets/logo@512w.png'
	'switchhosts-bin.install'
	'switchhosts-bin.desktop'
)
sha256sums=(
	'c18e055e62a4509cbcf7e3b053783e45278e5bc26deb764d9b0c4c24f0b84e88'
	'b5ade225a7428f195babb47e3cf4760467b0514cca18f477011b339a7af9b685'
	'9fe12f1bc573f5d431fcc8f9ca3ed17fc1e1d30248ae3b58209fc53084ae0a4e'
	'7b17a4bd74b5652dae1d92054ca153e64b51e7271bf7ded0488d1f0aa8e2782c'
)
rm_src_files=(
	'SwitchHosts._linux_x64_3.5.4.5517.zip'
	'logo@512w.png'
)
package() {
    install -dm755 "$pkgdir/"{opt,usr/bin}
    cp -r "${srcdir}" "${pkgdir}/opt/${pkgname}"
    # remove useless source files
    for rm_src_file in ${rm_src_files[*]} ; do
		rm "${pkgdir}/opt/${pkgname}/${rm_src_file}"
    done
    ln -s "/opt/${pkgname}/switchhosts" "$pkgdir/usr/bin/switchhosts"
    install -Dm644 ${srcdir}/${pkgname}.desktop "$pkgdir"/usr/share/applications/${pkgname}.desktop
    # icons generation
    mkdir -p "icons"
    cd "icons"
    mv ${srcdir}/logo@512w.png logo_icon.png
    convert -background transparent logo_icon.png -define icon:auto-resize=16,32,48,64,128,256 app.ico
    convert app.ico logo_icon.png
    # icons installation
    sizes=(16 32 48 64 128 256)
    for i in 0 1 2 3 4 ; do
      install -d "${pkgdir}/usr/share/icons/hicolor/${sizes[$i]}x${sizes[$i]}/apps"
      install -Dm644 "logo_icon-${i}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${sizes[$i]}x${sizes[$i]}/apps/${pkgname}.png"
    done
}
