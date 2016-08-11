# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>

pkgname=lynis-git
_pkgname=lynis
pkgver=2.3.2.1414.ed4dd3b
pkgrel=1
pkgdesc='Security and system auditing tool to harden Unix/Linux systems'
url='http://cisofy.com/lynis/'
license=('GPL3')
arch=('any')
backup=('etc/lynis/default.prf')
depends=('sh' 'awk')
optdepends=('net-tools: networking tests'
            'bind-tools: nameserver tests'
            'iptables: firewall tests'
            'bash-completion: completion for bash')
makedepends=('git')
provides=('lynis')
conflicts=('lynis')
source=(${pkgname}::git+https://github.com/CISOfy/${_pkgname})
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "%s.%s.%s" "$(git describe --tags --abbrev=0)" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname}
  sed -e 's|/path/to/lynis|/usr/bin/lynis|g' -i extras/systemd/lynis.service
}

package() {
  cd ${pkgname}

  # binary
  install -Dm 755 lynis "${pkgdir}/usr/bin/${_pkgname}"

  # profile
  install -Dm 644 default.prf "${pkgdir}/etc/${_pkgname}/default.prf"

  # plugins, include, db
  install -d "${pkgdir}/usr/share/${_pkgname}"
  cp -ra db include plugins "${pkgdir}/usr/share/${_pkgname}"

  # doc files
  install -Dm 644 README INSTALL CHANGELOG.md FAQ \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 ${_pkgname}.8 -t "${pkgdir}/usr/share/man/man8"

  # completion
  install -Dm 644 extras/bash_completion.d/${_pkgname} \
    -t "${pkgdir}/usr/share/bash-completion/completions"

  # systemd
  install -Dm 644 extras/systemd/{lynis.service,lynis.timer} \
    -t "${pkgdir}/usr/lib/systemd/system"
}

# vim:set ts=2 sw=2 ft=sh et:
