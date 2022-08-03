# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

_pkgname=timeline
pkgname=${_pkgname}-git
pkgver=r103.ccd3fc3
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
b2sums=('SKIP'
        '1ea9905ee31a8f722111e7aad4197326f5cbeffa7953c1678432172af1fbd72c8363ea00a94d2c1f3b332a3e85f6eeadd551a05b62ac00c3d42562b333e475f9')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  make clean && make tl && make doc
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
