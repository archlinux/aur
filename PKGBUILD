# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Andreas Grapentin <andreas@grapentin.org>

pkgname=vmdebootstrap-pureos
_gitpkgname="${pkgname%-pureos}"
pkgver=1.11
pkgrel=3
pkgdesc='Bootstrap Debian into a (virtual machine) disk image. Custom version, required to build PureOS.'
arch=('any')
url='http://git.liw.fi/vmdebootstrap/'
license=('GPL-3.0-or-later')
depends=(
  'debootstrap-pureos'
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
provides=('vmdebootstrap')
conflicts=('vmdebootstrap')
options=('!debug' '!strip')

source=(
  # `vmdeboostrap` with a missing `t` is a legit typo
  "${_gitpkgname}-${pkgver}.tar.gz::https://source.puri.sm/Librem5/vmdeboostrap/-/archive/upstream/${pkgver}/vmdeboostrap-upstream-${pkgver}.tar.gz"
  'default_arch.patch'
  'fix_path.patch'
  '0001-Don-t-enforce-U-EFI-on-arm64.patch'
  'python_3_syntax.patch'
)

sha512sums=(
  '4fe39f6b779167d1d1ae5e02bcb9dd51d6a7e192596fc8b9ea4b737e5f510b33ebd606b38e194cd1451e445a8985f59cdb348f7c553f1c343b38c92b06c87892'
  'f4d553b0364275809fd19f1597a149f7f8c6d4b53a654011700b2bb44b12a7bce08370488a36b359d56bfe90329b727f3f018d5670aac8c6aa3635ee26313fe7'
  '64e32ecf6ac9089433da632b6406f3ef6da242d2443574af5a6f7d2ecdc4cb2fa3e0e366c47f890123266650dd3ccdafb797f675c96d5035aa4bd40472a7ed3c'
  'c023215ca973d198e9067c4126252f9f9402235d22ae9d033df43fe0bc995df033620301b6ab0790964e0cd24d0d3f9bf88b2e806c0c85216dd27cf1b51775d4'
  '1458c0c0f915ca31f6e5c4cd4e103c831ee44d82bbecdee6e6116316dd780fef2232d4160478b8f33a14afd9ccf27c36b1a2cfaf6f46da93023f8b6c5973affe'
)

prepare() {
  # Fix typo and remove the `upstream` part
  mv -v "vmdeboostrap-upstream-${pkgver}" \
    "${_gitpkgname}-${pkgver}"
  cd "${_gitpkgname}-${pkgver}"
  patch -p1 < ../default_arch.patch
  patch -p1 < ../fix_path.patch
  patch -p1 < ../0001-Don-t-enforce-U-EFI-on-arm64.patch
  patch -p1 < ../python_3_syntax.patch
}

build() {
  cd "${_gitpkgname}-${pkgver}"
  python -m build --wheel --no-isolation
  make -C man man
}

package() {
  cd "${_gitpkgname}-${pkgver}"
  python -I -m installer --destdir="${pkgdir}" dist/*.whl

  echo >&2 'Packaging the license'
  install -D -m 644 COPYING \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE

  echo >&2 'Packaging the README'
  install -D -m 644 README \
    "${pkgdir}"/usr/share/doc/${pkgname}/README

  echo >&2 'Packaging the manual'
  install -D -m 644 -t "${pkgdir}/usr/share/man/man8" \
    man/_build/man/vmdebootstrap.8
}
