# Maintainer: Vlad Glagolev <scm(at)vaygr(dot)net>

_pkgbase=mdp
pkgname=mdp-pass
pkgver=0.7.5
pkgrel=1
pkgdesc="simplified password manager"
arch=('i686' 'x86_64')
license=('ISC')
url="https://tamentis.com/projects/mdp/"
depends=('gnupg' 'ncurses')
provides=("${pkgname}")
conflicts=("${pkgname}-git")

source=(${url}/files/${_pkgbase}-${pkgver}.tar.gz{,.asc}
        mdp-name.patch)
sha256sums=('e6fa117a95ca1c6939766d66ac9c9a1840bf4de1b7180080fc073b04617ed5de'
            'SKIP'
            '667f27023790cdd1faab30779eedf5ce81d0b8e6201c21e70ea993ac2f7074b9')

prepare() {
  cd "${_pkgbase}-${pkgver}"

  sed -i "s:^PROG=.*:PROG=\"mdp-pass\":" configure

  patch -p0 < ../mdp-name.patch

  mv -v mdp.1 ${pkgname}.1
}

build() {
  cd "${_pkgbase}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${_pkgbase}-${pkgver}"

  make PREFIX="${pkgdir}/usr" install

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  for d in AUTHORS ChangeLog config.example INSTALL.txt README TODO; do
    install -Dm644 $d "${pkgdir}/usr/share/doc/${pkgname}/${d}"
  done
}
