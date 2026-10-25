# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Maintainer:  Marin Moulinier <https://github.com/p1-mmr>

pkgname="vmlinux-to-elf"
pkgver=1.3.7
pkgrel=2
pkgdesc="Recover a fully analyzable .ELF from a raw kernel, through extracting the kernel symbol table (kallsyms)"
arch=(
  'any'
)
url="https://github.com/marin-m/${pkgname}"
license=(
  'GPL-3.0-or-later'
)
depends=(
  'python>=3.9'
  'python-lz4>=4.4.5'
  'python-minilzo>=1.2'
  'python-peewee>=3.17'
  'python-zstandard>=0.25.0'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools>=69'
  'python-setuptools-scm>=8'
)
optdepends=(
  # 'glib2: GUI'
  # 'gtk4: GUI'
  'python-gobject: GUI'
  'libadwaita: GUI'
)
provides=(
  "python-${pkgname}=${pkgver}"
)
conflicts=(
  "python-${pkgname}"
)
options=(
  '!strip'
)
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "${url}/archive/refs/tags/${pkgver}/${_pkgsrc}.tar.gz"
)
sha256sums=('75c155265d0705362fd8560113a2ea17d0c842ad2405180ec4f138859d006744')

build() {
  export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"

  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

package() {
  local site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -vDm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"

  cd "${pkgname//-/_}/ui/assets"
  install -vDm644 "re.fossplant.vmlinux-to-elf.desktop" \
    -t "${pkgdir}/usr/share/applications"
  install -vDm644 "re.fossplant.vmlinux-to-elf.metainfo.xml" \
    -t "${pkgdir}/usr/share/metainfo"
  install -vDm644 "re.fossplant.vmlinux-to-elf.svg" \
    -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"

  install -vd "${pkgdir}/usr/share/licenses"
  ln -vsf "${site_packages}/${pkgname//-/_}-${pkgver}.dist-info/licenses" \
    "${pkgdir}/usr/share/licenses/${pkgname}"
}
