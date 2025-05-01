# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="Cursor"
_name="${_Name,,}"
_electron=32
pkgname="${_name}-electron"
pkgver=0.46.11
pkgrel=4
pkgdesc="The AI Code Editor"
arch=('aarch64' 'x86_64')
url="https://www.cursor.com"
license=('custom:Proprietary') #should be fixed
depends=('bash' 'gcc-libs' 'glibc' 'hicolor-icon-theme'
         'libx11' 'libxkbfile')
provides=("${_name}")
conflicts=("${_name}")
_pkgsrc="${_name}-${pkgver}"
source=("${pkgname}.sh")
source_aarch64=("${_pkgsrc}-aarch64.AppImage::https://anysphere-binaries.s3.us-east-1.amazonaws.com/production/client/linux/arm64/appimage/${_Name}-${pkgver}-ae378be9dc2f5f1a6a1a220c6e25f9f03c8d4e19.deb.glibc2.28-aarch64.AppImage")
source_x86_64=("${_pkgsrc}-x86_64.AppImage::https://anysphere-binaries.s3.us-east-1.amazonaws.com/production/client/linux/x64/appimage/${_Name}-${pkgver}-ae378be9dc2f5f1a6a1a220c6e25f9f03c8d4e19.deb.glibc2.25-x86_64.AppImage")
b2sums=('7731877436bc3fbc813862cc4517e280d9a74a8f9fa7fe3bf116206f82e5a9110460a82a7b66d7dd7b2109ec12f52547e4ee7a2f027cb4df9e8587b3826452fc')
b2sums_aarch64=('2f76693167f1623f75f914e0ff6febe37885a12980d8eb49e252a179fd52522da94aa3edf3011c8c9f27a46f4c3c2d8298ef673020bd4e89ac62634ea06ca961')
b2sums_x86_64=('2860a4a55d213a77f51dcf25b22eea4d2ae907d29a4ef42c6b4cf2d58bd2fa914456ec4e9736d7d33cf8a78b59b0763ee459649f9846fcdff65f6faf7c8efa5d')
options=(!strip) #about 6.67MB strippable
prepare() {
  chmod +x "${_pkgsrc}-${CARCH}.AppImage"
  ./"${_pkgsrc}-${CARCH}.AppImage" --appimage-extract > /dev/null
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
