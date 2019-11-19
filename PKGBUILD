# Maintainer  : Kr1ss $(sed s/\+/./g\;s/\-/@/ <<<\<kr1ss+x-yandex+com\>)
# Contributor : Olivier Le Moal <mail at olivierlemoal dot fr>
# Contributor : Dawid Wrobel <cromo@klej.net>
# Contributor : Sébastien Duquette <ekse.0x@gmail.com>
# Contributor : onny <onny@project-insanity.org>


pkgname=wfuzz-git
pkgver() {
  cd "${pkgname/-git}"
  git describe --long --tags | sed 's/v[^0-9]*//;s/-/.r/;s/-g/./'
}
pkgver=2.4.2.r0.619ea18
pkgrel=1

pkgdesc='Web application fuzzer - python3 build of the dev branch'
url='https://github.com/xmendez/wfuzz'
license=('GPL')
arch=('any')

depends=('python-pycurl' 'python-future' 'python-chardet')
makedepends=('python-mock' 'python-netaddr' 'python-pip' 'python-sphinx' 'git' 'rsync')

provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

source=("git+$url.git")
sha256sums=('SKIP')

build() {
  cd "${pkgname/-git}/docs"

  python conf.py
  make SPHINXOPTS='-Q -j auto' man html
}

package() {
  cd "${pkgname/-git}"

  install -Dt "$pkgdir/usr/share/man/man1/" docs/_build/man/*.1
  install -Dt "$pkgdir/usr/share/doc/${pkgname/-git}/" -m644 README.md
  rsync -rpt docs/_build/html "$pkgdir/usr/share/doc/${pkgname/-git}/"

  install -Dm644 *_bash_completion "$pkgdir/etc/bash_completion.d/${pkgname/-git}"

  install -dm644 "$pkgdir/usr/share/${pkgname/-git}/wordlists"
  rsync -rpt wordlist/* "$pkgdir/usr/share/${pkgname/-git}/wordlists/"

  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
