# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="vmlinux-to-elf"
pkgver=1.2.3
pkgrel=1
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
sha256sums=('41fa1e914dcad235e1ba451d555f1bef3a6f13db222979fd8a0155149b6c05be')

build() {
  export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"

  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

package() {
  local site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  cd "${pkgname//-/_}/ui/assets"
  install -vDm644 "re.fossplant.vmlinux-to-elf.desktop" \
    "${pkgdir}/usr/share/applications/re.fossplant.vmlinux-to-elf.desktop"
  install -vDm644 "re.fossplant.vmlinux-to-elf.metainfo.xml" \
    "${pkgdir}/usr/share/metainfo/re.fossplant.vmlinux-to-elf.metainfo.xml"
  install -vDm644 "re.fossplant.vmlinux-to-elf.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/re.fossplant.vmlinux-to-elf.svg"

  install -vd "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -vsf "${site_packages}/${pkgname//-/_}-${pkgver}.dist-info/licenses/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
