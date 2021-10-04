# Maintainer: Jiachen YANG <farseerfc@archlinux.org>
# Contributor: Dan Beste <dan.ray.beste@gmail.com>

pkgname='stratisd'
pkgver=2.4.2
pkgrel=2
pkgdesc='Easy to use local storage management for Linux.'
arch=('x86_64')
url='https://stratis-storage.github.io/'
license=('MPL2')
makedepends=('asciidoc' 'cargo' 'rust' 'clang')
depends=('dbus' 'cryptsetup' 'util-linux-libs' 'clevis' 'systemd')
optdepends=('stratis-cli: command line interface'
            'dracut: stratis as root filesystem support')
checkdepends=('python-pyudev')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/stratis-storage/stratisd/archive/v${pkgver}.tar.gz"
        "pr2665.patch::https://patch-diff.githubusercontent.com/raw/stratis-storage/stratisd/pull/2665.patch")
b2sums=('6a3a4176216575cfb9eff75073ac126e7bf7048025c521d76a9840cb0d6ef0a261d7c175e69b51ce32b31ae00c7a3d1945178ced0cca6f213211b38d15dae831'
        '68a0291b8837377f2e3c864d06c275d9aafa35cd9fb2836b37e10c774f2459b05879aafdf9634e669d819433bbea4825af73e982dd5b0205cfdce2aa3a4a7cf9')

prepare() {
  cd "${pkgname}-${pkgver}"

  # patch to allow nullptr deref
  patch -Np1 -i "$srcdir/pr2665.patch"

  # patch libexec path in configs
  configs=(systemd/stratisd.service
           dracut/90stratis/module-setup.sh
           org.storage.stratis2.service
           dracut/90stratis/stratisd-min.service
           systemd/stratisd-min-postinitrd.service)
  for file in ${configs[@]}; do
      echo "Patching libexec in $file"
      sed -i 's,/usr/libexec,/usr/lib,g' $file 
  done
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
