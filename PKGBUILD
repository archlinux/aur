# Maintainer: Andreas Grapentin <andreas@grapentin.org>
# Contributor: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=vmdebootstrap
pkgver=1.11
pkgrel=1
pkgdesc='Bootstrap Debian into a (virtual machine) disk image'
arch=('any')
url='https://web.archive.org/web/20230622145516/http://git.liw.fi/vmdebootstrap/'
license=('GPL3')
depends=(
  'debootstrap'
  'distro-info'
  'multipath-tools'
  'parted'
  'python'
  'python-cliapp-fiw'
  'qemu'
  'syslinux'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-sphinx'
  'python-wheel'
)
options=('!strip')

source=(
  "https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/vmdebootstrap/1.11-1/vmdebootstrap_1.11.orig.tar.xz"
  'default_arch.patch'
  'fix_path.patch'
  '0001-Don-t-enforce-U-EFI-on-arm64.patch'
  'python_3_syntax.patch'
  'fix_sphinx_man_pages_build.patch'
)

sha512sums=('072d20cc99e489db91d45b98b1905d8962c28097f0ee09893aab5d49c6eb362066ae27f1bac54b0e724b9046d5fdec3c6a13f30caf2278ceec31a85a3a165b3e'
            'f4d553b0364275809fd19f1597a149f7f8c6d4b53a654011700b2bb44b12a7bce08370488a36b359d56bfe90329b727f3f018d5670aac8c6aa3635ee26313fe7'
            '64e32ecf6ac9089433da632b6406f3ef6da242d2443574af5a6f7d2ecdc4cb2fa3e0e366c47f890123266650dd3ccdafb797f675c96d5035aa4bd40472a7ed3c'
            'c023215ca973d198e9067c4126252f9f9402235d22ae9d033df43fe0bc995df033620301b6ab0790964e0cd24d0d3f9bf88b2e806c0c85216dd27cf1b51775d4'
            '1458c0c0f915ca31f6e5c4cd4e103c831ee44d82bbecdee6e6116316dd780fef2232d4160478b8f33a14afd9ccf27c36b1a2cfaf6f46da93023f8b6c5973affe'
            '04c408c92f391ccf8cfa3a3f1e126ff0de39ec469a4bd356f9ff74906d2e7d80e58df1e89f238e8fee90c5bc5a8cd01ce3e69a3df8481e8b8e30cacd6f420137')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 < ../default_arch.patch
  patch -p1 < ../fix_path.patch
  patch -p1 < ../0001-Don-t-enforce-U-EFI-on-arm64.patch
  patch -p1 < ../python_3_syntax.patch
  patch -p1 < ../fix_sphinx_man_pages_build.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
  make -C man man
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -I -m installer --destdir="${pkgdir}" dist/*.whl

  echo >&2 'Packaging the license'
  install -D -m 644 COPYING \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE

  echo >&2 'Packaging the README'
  install -D -m 644 README \
    "${pkgdir}"/usr/share/doc/${pkgname}/README

  echo >&2 'Packaging the manual'
  install -D -m 644 -t "${pkgdir}/usr/share/man/man8" \
    man/_build/man/${pkgname}.8
}
