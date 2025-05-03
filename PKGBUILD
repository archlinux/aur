# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin at gmail dot com>

pkgname=cursor-electron
pkgver=0.49.6
pkgrel=5
pkgdesc="The AI Code Editor"
arch=('x86_64')
url="https://www.cursor.com"
license=('custom:Proprietary') #should be fixed
_elnum=34
depends=(electron${_elnum} 'gcc-libs' 'hicolor-icon-theme' 'libx11' 'libxkbfile')
optdepends=('electron: For /usr/share/cursor/cursor-latestron')
provides=(cursor)
conflicts=(cursor)
source=("src.iso::https://downloads.cursor.com/production/0781e811de386a0c5bcb07ceb259df8ff8246a52/linux/x64/Cursor-${pkgver}-${arch}.AppImage"
		"https://gitlab.archlinux.org/archlinux/packaging/packages/code/-/raw/main/code.sh"
		'run.sh.in')
sha256sums=('587e3f670d15266446c91ccc9644e19216787c6cac30a0544883c24ecc864b8c'
            '5da1525b5fe804b9192c05e1cbf8d751d852e3717fb2787c7ffe98fd5d93e8c1'
            '1483b396caf793c39220892db75036e199e70fd75e685a593c40e64b85365739')
options=(!strip) #about 6.67MB strippable
prepare() {
  chmod +x src.iso
  ./src.iso --appimage-extract > /dev/null
  # Verify version of electron
  _correctron=$(grep -E '"electron": "[0-9]{2}' squashfs-root/usr/share/cursor/resources/app/package.json|awk '{print $2}'|cut -c2-3)
  if [[ $_elnum != $_correctron ]]; then
    echo "Using incorrectron. Change electron${_elnum} to electron${_correctron}"
    exit 1
  fi
}
package(){
	install -d "${pkgdir}"/usr/share/cursor/resources
	# Pick up resources
	mv squashfs-root/usr/share/{appdata,applications,bash-completion,icons,mime,zsh} "${pkgdir}/usr/share"
	mv squashfs-root/usr/share/cursor/resources/app "${pkgdir}/usr/share/cursor/resources/app"
	# Fix icon
	sed -i 's/^Icon=.*/Icon=cursor/' "${pkgdir}/usr/share/applications/cursor.desktop"
	sed -i 's/^Icon=.*/Icon=cursor/' "${pkgdir}/usr/share/applications/cursor-url-handler.desktop"
	# Launcher with latest electron
	sed -e s/code-flags/cursor-flags/ code.sh | head -n -2 | cat - run.sh.in > run.sh
	install -Dm755 run.sh "${pkgdir}/usr/share/cursor/cursor-latestron"
	# Launcher
	sed -e s/name=electron/name=electron${_elnum}/ -e s/code-flags/cursor-flags/ code.sh | head -n -2 | cat - run.sh.in > run.sh
	install -Dm755 run.sh "${pkgdir}/usr/bin/cursor"
	ln -sf /usr/bin/cursor "${pkgdir}/usr/share/cursor/cursor"
	# License
	install -Dm644 "${pkgdir}/usr/share/cursor/resources/app/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
