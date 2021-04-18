# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=timeline
pkgver=1.8
pkgrel=1
pkgdesc="A plain-text based distributed social network build on top of git configuration manager"
arch=('any')
url="https://ajdiaz.me/timeline/"
license=('GPL3')
depends=('bash' 'git')
makedepends=('pandoc')
conflicts=('timeline-git')
source=("https://github.com/ajdiaz/${pkgname}/archive/${pkgver}.tar.gz"
        "${pkgname}.service")
sha256sums=('e4a11c24d5934521952f21580af570fbf86d81c94529b952c808b9796b54f4b2'
            'ef063a64b2e38988cf7b7395161351e537e50719f4d77fa3d180e25b911371fd')

prepare() {
  cd "${pkgname}-${pkgver}"
  sed -i "s/\$(shell git describe --tags)/${pkgver}/g" Makefile
}

build() {
  cd "${pkgname}-${pkgver}"
  make clean && make
  cd man
  gzip -fk *.[0-9]
}

package() {
  cd "${pkgname}-${pkgver}"

  # user service file
  install -D -m644 "${srcdir}/${pkgname}.service" \
   "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"

  # binary
  install -D -m755 "tl" "${pkgdir}/usr/bin/tl"

  # man
  for manpage in man/*.[0-9]; do
    section=${manpage##*.}
    install -Dm644 ${manpage}.gz \
      "${pkgdir}"/usr/share/man/man${section}/${manpage##*/}.gz
  done

  # docs
  install -D -m644 README "${pkgdir}/usr/share/doc/${_pkgname}/README"
}
