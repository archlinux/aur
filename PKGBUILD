# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Peter Wu <peter@lekensteyn.nl>
# Contributor: Miguel Revilla <yo@miguelrevilla.com>
# Contributor: s1gma <s1gma@mindslicer.com>

pkgname=binwalk-git
_gitname=binwalk
pkgver=2.3.8.r36.g686820a
pkgrel=1
pkgdesc='Tool for searching a given binary image for embedded files'
url='https://github.com/OSPG/binwalk'
arch=(any)
license=(MIT)
depends=(
  python
  python-setuptools
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
  git
)
checkdepends=(
  python-pytest
)
optdepends=(
  'python-pyqtgraph: graph and visualization support'
  'python-opengl: binviz module support'
  'python-capstone: disassembly support'
  'arj: ARJ decompression support'
  'cabextract: CAB archive support'
  'cpio: CPIO archvie support'
  'gzip: GZIP decompression support'
  'mtd-utils: JFFS filesystem support'
  'p7zip: ZIP, LZMA and ISO decompression support'
  'squashfs-tools: squashfs support'
  'tar: TAR archive support'
  'bzip2: BZIP2 archive support'
  'unrar: RAR decompression support'
  'xz: XZ decompression support'
  'firmware-mod-kit: cramfs support'
  'lhasa: LHA support'
  'sleuthkit: forensic analysis support'
)
provides=('binwalk')
conflicts=("binwalk")
source=(${pkgname}::git+${url})
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --tags --match 'v*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${pkgname}
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname}
  python -m venv --clear --without-pip --system-site-packages .testenv
  .testenv/bin/python -m installer dist/*.whl
  .testenv/bin/python -m pytest
}

package() {
  cd ${pkgname}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
