# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>

pkgname=lynis-git
_pkgname=lynis
pkgver=2.1.0.407.dfe5e80
pkgrel=1
pkgdesc='Security and system auditing tool to harden Unix/Linux systems'
url='http://cisofy.com/lynis/'
license=('GPL3')
arch=('any')
backup=('etc/lynis/default.prf')
depends=('sh')
optdepends=(
  'net-tools: networking tests'
  'bash-completion: completion for bash'
)
makedepends=('git')
provides=('lynis')
conflicts=('lynis')
source=(${pkgname}::git+https://github.com/CISOfy/${_pkgname})
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "%s.%s.%s" "$(git describe --tags --abbrev=0)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname}
  sed -e 's|/path/to/lynis|/usr/bin/lynis|g' -i extras/systemd/lynis.service
}

package() {
  cd ${pkgname}

  # profile
  install -Dm 644 default.prf "${pkgdir}/etc/${_pkgname}/default.prf"

  # binary
  install -Dm 755 lynis "${pkgdir}/usr/bin/${_pkgname}"

  # plugins, include, db
  install -d "${pkgdir}/usr/share/${_pkgname}"
  cp -a db include plugins "${pkgdir}/usr/share/${_pkgname}"

  # doc files
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" README INSTALL CHANGELOG FAQ
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 README "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # manpage
  install -Dm 644 ${_pkgname}.8 "${pkgdir}/usr/share/man/man8/${_pkgname}.8"

  # completion
  install -Dm 644 extras/bash_completion.d/${_pkgname} "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"

  # systemd
  install -d "${pkgdir}/usr/lib/systemd/system/"
  install -m 644 extras/systemd/{lynis.service,lynis.timer} "${pkgdir}/usr/lib/systemd/system/"
}

# vim:set ts=2 sw=2 ft=sh et:
