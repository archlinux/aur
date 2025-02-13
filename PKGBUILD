# Maintainer: jacopotediosi <jacopotediosi at gmail dot com>
# Contributor: envolution
# Contributor: Johannes Schleifenbaum <johannes [at] js-webcoding [dot] de>
# Fixed by: Timo Sarawinski <muhviehstarr>

_TESTS=0 # Set to 1 to enable tests.  Warning - they are slow and won't work well past firewalls

pkgname='testssl.sh-git'
_pkgname='testssl.sh'
pkgver=3.2rc4+r4739+g4b4260831
pkgrel=1

pkgdesc="Testing TLS/SSL encryption (git version)"
arch=('any')
url="https://github.com/testssl/testssl.sh"
license=("GPL-2.0-or-later")

depends=(
  bash
  bind-tools
  coreutils
  openssl
  procps-ng
  util-linux
)
makedepends=(
  git
)
checkdepends=(
  perl
  perl-data-dump
  perl-json
  perl-test-base
)

conflicts=('testssl.sh')
provides=('testssl.sh')

install="${_pkgname}.install"

sha512sums=('SKIP'
            '4cf8fc7403384952a0d3de6cc677773a79b912c9ed0074449cd9433ff5f0d7b5fc4f509a35f8100904db73622064ced5534565c31e0ed820ef019d7c627db2ff')
b2sums=('SKIP'
        'd7ff8525b34164b579e662e021963486ba92d0380efa4504900b90a17f7977991911df630ef6feaf20bf6db30e48e329ed0475d2356fec96744dac42d29bf4b7')

source=(
  "${pkgname}::git+https://github.com/testssl/testssl.sh.git"
  'set-install-dir.patch'
)

pkgver() {
  cd ${pkgname}

  _version=$(git tag --sort=-v:refname --list | head -n1)
  _commits=$(git rev-list --count HEAD)
  _short_commit_hash=$(git rev-parse --short=9 HEAD)
  echo "${_version#'v'}+r${_commits}+g${_short_commit_hash}"
}

prepare() {
  cd ${pkgname}
  patch -p0 < "${srcdir}/set-install-dir.patch"
}

check() {
  cd ${pkgname}

  # These tests can take an extremely long time and rely on external services
  # and assume no port filtering both ways.  Default to off even if makepkg has
  # it enabled
  if [ $_TESTS == 1 ]; then
    TESTSSL_INSTALL_DIR="$(pwd)" prove -v
  else
    msg2 "Skipping check() based on PKGBUILD default. Edit the PKGBUILD to enable"
  fi
}

package() {
  cd ${pkgname}

  install -Dm 755 testssl.sh          "${pkgdir}/usr/bin/testssl"
  install -Dm 644 etc/* -t            "${pkgdir}/usr/share/testssl.sh/etc"
  install -Dm 644 Readme.md -t        "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 doc/testssl.1.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 doc/testssl.1 -t    "${pkgdir}/usr/share/man/man1"
}
