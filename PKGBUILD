# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=timeline
pkgver=1.9
pkgrel=1
pkgdesc="A plain-text based distributed social network build on top of git configuration manager"
arch=('any')
url="https://ajdiaz.me/timeline/"
license=('GPL3')
depends=('bash' 'git')
makedepends=('pandoc')
conflicts=('timeline-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ajdiaz/${pkgname}/archive/${pkgver}.tar.gz"
        "${pkgname}.service")
b2sums=('f492c9dc1da6f07ad8e5b6894bc4a5abbfbb35ee4b479f084f001d6b8bc45c42d2bcced5f0415d239e2b51506f192f5d9df7f6412af458a706d89f255dec7cb0'
        '1ea9905ee31a8f722111e7aad4197326f5cbeffa7953c1678432172af1fbd72c8363ea00a94d2c1f3b332a3e85f6eeadd551a05b62ac00c3d42562b333e475f9')

prepare() {
  cd "${pkgname}-${pkgver}"
  sed -i "s/\$(shell git describe --tags)/${pkgver}/g" Makefile
}

build() {
  cd "${pkgname}-${pkgver}"
  make clean && make tl && make doc
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
