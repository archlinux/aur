# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: phariseo <phariseo@hush.com>

pkgname=vlmcsd
pkgver=1113
pkgrel=1
pkgdesc="KMS Emulator in C"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/Wind4/vlmcsd"
license=('unknown')
makedepends=('libffi')
conflicts=('vlmcsd-git' 'vlmcsd-svn')
source=("https://github.com/Wind4/${pkgname}/archive/svn${pkgver}/svn${pkgver}.tar.gz"
        "${pkgname}.service"
        "${pkgname}@.service"
        "${pkgname}.socket")
sha256sums=('62f55c48f5de1249c2348ab6b96dabbe7e38899230954b0c8774efb01d9c42cc'
            '83e7e75f5874c17bfa40f08eea134ba636d7ac9864eea2c4ad1ae8159ec9af74'
            '5e1f1c556f16e61fcdaa197f9ada9d3d2a8d91d4b14b36e85181b323b3475623'
            '62fc0e5b50102fa7f1ce8e8d2c8cd1cb282dec9169179aa3ee083ca3d60772f3')

build() {
  cd "${pkgname}-svn${pkgver}"
  make
  cd man
  gzip -fk *.[0-9]
}

package() {
  cd "${pkgname}-svn${pkgver}"

  pushd bin
  for bin in vlmcs{d,}; do
    install -Dm755 ${bin} "${pkgdir}"/usr/bin/${bin}
  done
  popd

  pushd ../
  for unit in vlmcsd.service vlmcsd@.service vlmcsd.socket; do
    install -Dm644 "${srcdir}"/${unit} "${pkgdir}"/usr/lib/systemd/system/${unit}
  done
  popd

  pushd man
  for manpage in *.[0-9]; do
    section=${manpage##*.}
    install -Dm644 ${manpage}.gz "${pkgdir}"/usr/share/man/man${section}/${manpage}.gz
  done
}
