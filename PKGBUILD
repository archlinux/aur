# Maintainer: Andreas Grapentin <andreas@grapentin.org>
# Contributor: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=vmdebootstrap
pkgver=1.11
pkgrel=1
pkgdesc='Bootstrap Debian into a (virtual machine) disk image'
arch=('any')
url='http://git.liw.fi/vmdebootstrap/'
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
  "http://git.liw.fi/cgi-bin/cgit/cgit.cgi/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.gz"
  'default_arch.patch'
  'fix_path.patch'
  '0001-Don-t-enforce-U-EFI-on-arm64.patch'
  'python_3_syntax.patch'
)

sha512sums=(
  'd5e0d1c19487e7ec03377eab4aa82631f37dc0ef0366dbf512a41c5a7feb4880dc0ed8ad8731f0a0fcb147bdb7dd2b3248039bbdaf4ddf38e05abd5ff6f39aa8'
  'f4d553b0364275809fd19f1597a149f7f8c6d4b53a654011700b2bb44b12a7bce08370488a36b359d56bfe90329b727f3f018d5670aac8c6aa3635ee26313fe7'
  '64e32ecf6ac9089433da632b6406f3ef6da242d2443574af5a6f7d2ecdc4cb2fa3e0e366c47f890123266650dd3ccdafb797f675c96d5035aa4bd40472a7ed3c'
  'c023215ca973d198e9067c4126252f9f9402235d22ae9d033df43fe0bc995df033620301b6ab0790964e0cd24d0d3f9bf88b2e806c0c85216dd27cf1b51775d4'
  '1458c0c0f915ca31f6e5c4cd4e103c831ee44d82bbecdee6e6116316dd780fef2232d4160478b8f33a14afd9ccf27c36b1a2cfaf6f46da93023f8b6c5973affe'
)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 < ../default_arch.patch
  patch -p1 < ../fix_path.patch
  patch -p1 < ../0001-Don-t-enforce-U-EFI-on-arm64.patch
  patch -p1 < ../python_3_syntax.patch
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
