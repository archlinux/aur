# Maintainer: Arseniy Sharoglazov <mohemiv@gmail.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Peter Wu <peter@lekensteyn.nl>
# Contributor: Miguel Revilla <yo@miguelrevilla.com>
# Contributor: s1gma <s1gma@mindslicer.com>

pkgname=binwalk2
_gitname=binwalk
pkgver=2.4.3
pkgrel=10
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
source=(
  "${_gitname}::git+${url}#commit=ce6c706cc0cc13dbaa4c5cf22e7f03fcd83835ac"
  "CVE-2026-7179.patch::https://sources.debian.org/data/main/b/binwalk/2.4.3%2Bdfsg1-3/debian/patches/prevent-path-traversal-in-wince.patch"
)
sha512sums=(
    'SKIP'
    'ad8bb01ecdb1f8a2f3af82f8f1607f1e2e0dd7ffaed914dd2156749d36954e8932c5bf064f3bdc1f272b2a72842272bb264f19fa89129d98756ccc06c0e655e4'
)

build() {
  cd ${_gitname}
  python -m build --wheel --no-isolation
}

check() {
  cd ${_gitname}
  python -m venv --clear --without-pip --system-site-packages .testenv
  .testenv/bin/python -m installer dist/*.whl
  .testenv/bin/python -m pytest
}

package() {
  cd ${_gitname}
  python -m installer --destdir="$pkgdir" dist/*.whl

  mv "${pkgdir}/usr/bin/binwalk" "${pkgdir}/usr/bin/binwalk2"

  install -Dm 644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
