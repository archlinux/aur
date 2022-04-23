# Maintainer: Jiachen YANG <farseerfc@archlinux.org>
# Contributor: Dan Beste <dan.ray.beste@gmail.com>

pkgname='stratisd'
pkgver=2.4.4
pkgrel=1
pkgdesc='Easy to use local storage management for Linux.'
arch=('x86_64')
url='https://stratis-storage.github.io/'
license=('MPL2')
makedepends=('asciidoc' 'cargo' 'rust' 'clang')
depends=('dbus' 'cryptsetup' 'util-linux-libs' 'clevis' 'systemd')
optdepends=('stratis-cli: command line interface'
            'dracut: stratis as root filesystem support')
checkdepends=('python-pyudev')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/stratis-storage/stratisd/archive/v${pkgver}.tar.gz")
b2sums=('254edcf50be984294bb4d7323f274032410ff1e7064d102a921fcbd9f4e6fe7e7cd171a9c3d664712540b19522496a2bac53d1206521ce4892d80e67989b845e')

prepare() {
  cd "${pkgname}-${pkgver}"

  # patch libexec path in configs
  configs=(systemd/stratisd.service
           dracut/90stratis/module-setup.sh
           dracut/90stratis/stratisd-min.service
           systemd/stratisd-min-postinitrd.service)
  for file in ${configs[@]}; do
      echo "Patching libexec in $file"
      sed -i 's,/usr/libexec,/usr/lib,g' $file 
  done

  sed -e 's|-D unused||' -e 's|-D warnings||' -i Makefile # Fix build
}

build() {
  cd "${pkgname}-${pkgver}"

  # Release
  export LIBEXECDIR=/usr/lib
  make release
  make release-min
  make docs/stratisd.8
}

check() {
  cd "${pkgname}-${pkgver}"

  export LIBEXECDIR=/usr/lib
  make test
}

package() {
  cd "${pkgname}-${pkgver}"

  export LIBEXECDIR=/usr/lib
  install -dm755 "${pkgdir}/usr/lib/systemd/system-generators"
  install -dm755 "${pkgdir}/usr/bin"
  make install DESTDIR="${pkgdir}" PREFIX="/usr" LIBEXECDIR="/usr/lib"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
