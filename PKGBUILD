# Maintainer: Damglador <damglador@gmail.com>

pkgname=gitfourchette-bin
_pkgname=gitfourchette

pkgver=1.5.0
pkgrel=2
arch=('x86_64' 'aarch64')

pkgdesc="The comfortable Qt-based Git GUI"
url="https://github.com/jorio/gitfourchette"
license=("GPL-3.0")

depends=(
    hicolor-icon-theme
    python
    python-pygit2
    python-pygments
    python-pyqt6
)
provides=("$_pkgname")
conflicts=("$_pkgname")

source_aarch64=(
    "${_pkgname}-${pkgver}.zip"::${url}/releases/download/v${pkgver}/GitFourchette-${pkgver}-${arch}.AppImage.zip
)
source_x86_64=(
    "${_pkgname}-${pkgver}.zip"::${url}/releases/download/v${pkgver}/GitFourchette-${pkgver}-${arch}.AppImage.zip
)
sha256sums_aarch64=(
    7adef1306bd42b48e9552094aa5721dedd6b6c9d2539caed7cb282038de37d7f
)
sha256sums_x86_64=(
    d67ca3faf5913feb141e5506360535cf333b57f47562baeeecd622991be8f508
)

package(){
    ./GitFourchette-${pkgver}-${arch}.AppImage --appimage-extract
    site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    install -d "$pkgdir/$site_packages"
	install -Dm644 squashfs-root/usr/share/applications/${_pkgname}.desktop \
	    -t "$pkgdir"/usr/share/applications/
	install -Dm644 squashfs-root/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png \
	    -t "$pkgdir"/usr/share/icons/hicolor/256x256/apps/
	cp -r --preserve=mode squashfs-root/opt/python3.13/lib/python3.13/site-packages/gitfourchette \
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
