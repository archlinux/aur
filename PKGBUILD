# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

_pkgname=timeline
pkgname=${_pkgname}-git
pkgver=r62.10bb4af
pkgrel=1
pkgdesc="A plain-text based distributed social network build on top of git configuration manager"
arch=('any')
url="https://ajdiaz.me/timeline/"
license=('GPL3')
depends=('bash' 'git')
makedepends=('pandoc')
conflicts=('timeline')
source=("${_pkgname}"::"git+https://github.com/ajdiaz/${_pkgname}.git"
        "${_pkgname}.service")
sha256sums=('SKIP'
            'ef063a64b2e38988cf7b7395161351e537e50719f4d77fa3d180e25b911371fd')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  make clean && make
  cd man
  gzip -fk *.[0-9]
}

package() {
  cd "${_pkgname}"

  # user service file
  install -D -m644 "${srcdir}/${_pkgname}.service" \
    "${pkgdir}/usr/lib/systemd/user/${_pkgname}.service"

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
