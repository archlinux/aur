# Maintainer: Damglador <damglador@gmail.com>

pkgname=gitfourchette-bin
_pkgname=gitfourchette

pkgver=1.7.0
pkgrel=1
arch=('x86_64' 'aarch64')

pkgdesc="The comfortable Qt-based Git GUI"
url="https://github.com/jorio/gitfourchette"
license=("GPL-3.0")

depends=(
    hicolor-icon-theme
    python-certifi
    python-pygit2
    python-pygments
    python-pyqt6
)
provides=("$_pkgname")
conflicts=("$_pkgname")

source_aarch64=(
    ${url}/releases/download/v${pkgver}/GitFourchette-${pkgver}-${arch}.AppImage
)
source_x86_64=(
    ${url}/releases/download/v${pkgver}/GitFourchette-${pkgver}-${arch}.AppImage
)
sha256sums_x86_64=('5136aa17006fa25cc7fa328fceb51c17020f858be19bf3eccedbe6b067bc77cf')
sha256sums_aarch64=('eb3a665acc326e06dc0a639f21a0b9f27474bb0d9aeabae963624714866b9f49')

package(){
	chmod +x ./GitFourchette-${pkgver}-${arch}.AppImage
    ./GitFourchette-${pkgver}-${arch}.AppImage --appimage-extract
    site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    install -d "$pkgdir/$site_packages"
	install -Dm644 squashfs-root/usr/share/applications/${_pkgname}.desktop \
	    -t "$pkgdir"/usr/share/applications/
	install -Dm644 squashfs-root/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png \
	    -t "$pkgdir"/usr/share/icons/hicolor/256x256/apps/
	cp -r --preserve=mode squashfs-root/opt/python3.14/lib/python3.14/site-packages/gitfourchette \
	    "$pkgdir/$site_packages"
	cat << EOF > "${_pkgname}.py"
#!/usr/bin/python3
import sys
from gitfourchette.__main__ import main
if __name__ == '__main__':
    if sys.argv[0].endswith('.exe'):
        sys.argv[0] = sys.argv[0][:-4]
    sys.exit(main())
EOF
    install -Dm755 ${_pkgname}.py "$pkgdir"/usr/bin/${_pkgname}
}
