# Maintainer: Frank Fishburn <frankthefishburn@gmail.com>
# Contributor: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=mailpile-git
pkgver=r5955.cb4f0a71
pkgrel=1
pkgdesc="A modern, fast web-mail client with user-friendly encryption and privacy features."
arch=('any')
license=('AGPL3')
depends=('python2-appdirs' 'python2-setuptools' 'python2-cryptography' 'python2-lxml' 'python2-jinja' 'spambayes' 'python2-selenium' 'python2-markupsafe' 'python2-nose' 'python2-mock' 'python2-crypto' 'python2-pydns' 'python2-pgpdump' 'python2-pillow' 'python2-pbr' 'python2-fasteners' )
url="http://www.mailpile.is"
provides=("mailpile")
conflicts=("mailpile")
install=mailpile.install
source=('git://github.com/pagekite/Mailpile.git' 'fix-rootdir.patch' 'mailpile.service')
md5sums=('SKIP' '87acc0758b08e62b4a8eea17e5f0da5e' '5109bf42611bb0e9f1ce7caa5a00a6e7')

pkgver() {
  cd "${srcdir}/Mailpile"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {

  # Fix path
  patch "${srcdir}/Mailpile/scripts/mailpile" fix-rootdir.patch
  cd "${srcdir}/Mailpile"

  # python2 fixes
  find . -type f -exec sed -i 's^bin/python^bin/python2^g' {} \;
  sed -i 's^python ^python2 ^g' Makefile

}

build() {

  cd "${srcdir}/Mailpile"

  # Compile bytecode
  python2 -m compileall -f mailpile

}

package() {

  cd "${srcdir}/Mailpile"

  install -d "${pkgdir}/usr/share"

  cp -r shared-data "${pkgdir}/usr/share/mailpile"
  cp -r mailpile "${pkgdir}/usr/share/mailpile/"

  find "${pkgdir}/usr/share/mailpile" -type f -exec chmod 644 '{}' ';'
  find "${pkgdir}/usr/share/mailpile" -type d -exec chmod 755 '{}' ';'

  install -D mp -t "${pkgdir}/usr/bin"
  install -Dm644 "../mailpile.service" -t "${pkgdir}/usr/lib/systemd/system"

}

# vim:set ts=2 sw=2 et:

