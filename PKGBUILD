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
pkgver=2.4.6.r0.f7bbca4
pkgrel=1

pkgdesc='Web application fuzzer - python3 build of the dev branch'
url='https://github.com/xmendez/wfuzz'
license=('GPL')
arch=('any')

makedepends=('python-mock' 'python-netaddr' 'python-sphinx' 'git')
depends=('python-pycurl' 'python-future' 'python-chardet')

provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

source=("git+$url.git" 'setup.patch')
sha256sums=('SKIP' '252de9391983d0f0ecbc22d68435df4789f78ff36af16c22d69bf70463ef97d0')


prepare() {
  cd "${pkgname%-git}"
  patch -Np1 -i ../setup.patch
}

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
