# Maintainer: Damglador <damglador@gmail.com>

pkgname=gitfourchette-bin
_pkgname=gitfourchette

pkgver=1.7.1
pkgrel=1
arch=('x86_64' 'aarch64')

pkgdesc="The comfortable Qt-based Git GUI"
url="https://github.com/jorio/gitfourchette"
license=("GPL-3.0")

depends=(
  hicolor-icon-theme
  python-certifi
  python-pygit2
  python-pyqt6
  git
)
optdepends=(
  "python-pygments: syntax highlighting"
  "python-mfusepy: mount a git tree as FUSE filesystem"
)
provides=("$_pkgname")
conflicts=("$_pkgname")

# Would be nice to remove architecture dependency completely,
# but appimages are arch specific and have to execute to be extracted.
source_aarch64=(
  ${url}/releases/download/v${pkgver}/GitFourchette-${pkgver}-${arch}.AppImage
)
source_x86_64=(
  ${url}/releases/download/v${pkgver}/GitFourchette-${pkgver}-${arch}.AppImage
)
sha256sums_x86_64=('541b6d30d41ae6db9a4f3dbcd5d0ddd2c4e4d8629b64cd9119f448c42a4e1ba9')
sha256sums_aarch64=('541b6d30d41ae6db9a4f3dbcd5d0ddd2c4e4d8629b64cd9119f448c42a4e1ba9')

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
    sys.argv[0] = sys.argv[0].removesuffix('.exe')
    sys.exit(main())
EOF
  install -Dm755 ${_pkgname}.py "$pkgdir"/usr/bin/${_pkgname}
}
