# Maintainer  : Kr1ss $(sed s/\+/./g\;s/\-/@/ <<<\<kr1ss+x-yandex+com\>)
# Contributor : Olivier Le Moal <mail at olivierlemoal dot fr>
# Contributor : Dawid Wrobel <cromo@klej.net>
# Contributor : Sébastien Duquette <ekse.0x@gmail.com>
# Contributor : onny <onny@project-insanity.org>


pkgname=wfuzz-git
pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/v[^0-9]*//;s/-/.r/;s/-g/./'
}
pkgver=3.0.1.r0.5488e63
pkgrel=1

pkgdesc='Web application fuzzer - python3 build of the dev branch'
url='https://github.com/xmendez/wfuzz'
license=('GPL')
arch=('any')

makedepends=('python-mock' 'python-netaddr' 'python-sphinx' 'git')
depends=('python-pycurl' 'python-future' 'python-chardet')

provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

source=("git+$url.git")
sha256sums=('SKIP')


build() {
  cd "${pkgname%-git}"
  python setup.py build
  cd docs
  python conf.py
  make SPHINXOPTS='-Q -j auto' man html
}

package() {
  cd "${pkgname%-git}"

  install -Dm644 docs/_build/man/*.1 -t"$pkgdir/usr/share/man/man1/"
  install -Dm644 README.md -t"$pkgdir/usr/share/doc/${pkgname/-git}/"
  cp -a --no-preserve=ownership docs/_build/html "$pkgdir/usr/share/doc/${pkgname/-git}/"

  install -Dm644 *_bash_completion "$pkgdir/etc/bash_completion.d/${pkgname/-git}"

  install -dm755 "$pkgdir/usr/share/${pkgname/-git}"
  cp -a --no-preserve=ownership wordlist "$pkgdir/usr/share/${pkgname/-git}/wordlists"

  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
