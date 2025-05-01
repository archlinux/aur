# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="Cursor"
_name="${_Name,,}"
pkgname="${_name}-electron"
pkgver=0.49.6
pkgrel=1
pkgdesc="The AI Code Editor"
arch=('x86_64')
url="https://www.cursor.com"
license=('custom:Proprietary') #should be fixed
depends=('bash' 'gcc-libs' 'glibc' 'hicolor-icon-theme'
         'libx11' 'libxkbfile')
provides=("${_name}")
conflicts=("${_name}")
_pkgsrc="${_name}-${pkgver}"
source=("src.iso::https://downloads.cursor.com/production/0781e811de386a0c5bcb07ceb259df8ff8246a52/linux/x64/Cursor-${pkgver}-${arch}.AppImage")
b2sums=('SKIP')
options=(!strip) #about 6.67MB strippable
prepare() {
  chmod +x src.iso
  ./src.iso --appimage-extract > /dev/null
}

package(){
	install -d "${pkgdir}/usr/share/cursor/resources"
    # Pick up resources
	mv squashfs-root/usr/share/{appdata,applications,bash-completion,icons,mime,zsh} "${pkgdir}/usr/share"
	mv squashfs-root/usr/share/cursor/resources/app "${pkgdir}/usr/share/cursor/resources/app"
	# Fix icon
	sed -i 's/^Icon=.*/Icon=cursor/' "${pkgdir}/usr/share/applications/cursor.desktop"
	sed -i 's/^Icon=.*/Icon=cursor/' "${pkgdir}/usr/share/applications/cursor-url-handler.desktop"
    # Version of electron
    _elbin=electron$(grep -E '"electron": "[0-9]{2}' "${pkgdir}"/usr/share/cursor/resources/app/package.json|awk '{print $2}'|cut -c2-3)
    depends+=($_elbin)
    # Launcher
    echo -e "#!/bin/sh\nexec ${_elbin} --app=/usr/share/cursor/resources/app \$@" > run.sh
    install -Dm755 run.sh "${pkgdir}/usr/bin/cursor"
    ln -sf /usr/bin/cursor "${pkgdir}/usr/share/cursor/cursor"
}
