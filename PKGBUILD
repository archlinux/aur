# Maintainer: envolution
# Contributor: Johannes Schleifenbaum <johannes [at] js-webcoding [dot] de>
# Please report issues at https://github.com/jojosch/pkgbuilds
# fixed by Timo Sarawinski <muhviehstarr>

_TESTS=0 #Set to 1 to enable tests.  Warning - they are slow and won't work well past firewalls

pkgname='testssl.sh-git'
_pkgname='testssl.sh'
pkgver=3.2rc3+r4653+g90a51e797
pkgrel=1
pkgdesc="Testing TLS/SSL encryption (git version)"
arch=('any')
url="https://github.com/drwetter/testssl.sh"
license=("GPL-2.0-or-later")
depends=('perl' 'bash' 'coreutils' 'util-linux' 'openssl' 'bind-tools' 'procps-ng')
makedepends=('git')
checkdepends=('perl-data-dump' 'perl-json' 'perl-test-base')
conflicts=('testssl.sh')
provides=('testssl.sh')
install="${_pkgname}.install"
source=(
  "${pkgname}::git+https://github.com/drwetter/testssl.sh.git"
  'set-install-dir.patch'
)
sha256sums=('SKIP'
            'ed81981de5d8f41de3a36f30fca283d2f668d62da1eda71d3799aa10bd49b617')

pkgver() {
  cd ${pkgname}

  _version=$(git tag --sort=-v:refname --list | head -n1)
  _commits=$(git rev-list --count HEAD)
  _short_commit_hash=$(git rev-parse --short=9 HEAD)
  echo "${_version#'v'}+r${_commits}+g${_short_commit_hash}"
}

prepare() {
  #this patch edits the main command file to tell it
  #that we've installed to /usr/share/$pkgname
  patch -p0 -d ${pkgname} -i ../"set-install-dir.patch"
}

check() {
  #These tests can take an extremely long time and rely on external services
  #and assume no port filtering both ways.  Default to off even if makepkg has
  #it enabled
  if [ $_TESTS == 1 ]; then
    cd "${pkgname}"
    TESTSSL_INSTALL_DIR="$(pwd)" prove -v
  else
    msg2 "Skipping check() based on PKGBUILD default.  Edit the PKGBUILD to enable"
  fi
}

package() {
  cd "${pkgname}"

  install -Dm 755 testssl.sh          "${pkgdir}/usr/bin/testssl"
  install -Dm 644 etc/* -t            "${pkgdir}/usr/share/testssl.sh/etc"
  install -Dm 644 Readme.md -t        "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 doc/testssl.1.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 doc/testssl.1 -t    "${pkgdir}/usr/share/man/man1"
}
