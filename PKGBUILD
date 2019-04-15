# Maintainer :  Kr1ss <kr1ss.x@yandex.com>
# Contributor : Olivier Le Moal <mail at olivierlemoal dot fr>
# Contributor : Dawid Wrobel <cromo@klej.net>
# Contributor : Sébastien Duquette <ekse.0x@gmail.com>
# Contributor : onny <onny@project-insanity.org>

pkgname=wfuzz-git
pkgver() {
  cd "${pkgname/-git}"
  git describe --tags | sed 's/v//;s/-/.dev/;s/-.\+//'
}
pkgver=2.3.4.dev94
pkgrel=1

pkgdesc='Web application fuzzer - python3 build of the dev branch'
url='https://github.com/xmendez/wfuzz'
license=('GPL')
arch=('any')

depends=('python-pycurl' 'python-future' 'python-chardet')
makedepends=('python-mock' 'python-netaddr' 'python-pip' 'python-sphinx' 'git' 'rsync')

provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

source=("git+$url.git#branch=dev"
        'setup.patch.sig'
        'setup.patch')
sha256sums=('SKIP'
            'SKIP'
            'fe63e8013e4fb647decd53e7c625798df74d0d6163b26c5e2a4bc77e3245727b')
validpgpkeys=('7A194E3F7A8F867BEA8A5339023F078862ACFE50')

prepare() {
  cd "${pkgname/-git}"
  # since configparser is included in CPython 3, we don't require it any longer
  patch -Np1 -i ../setup.patch
}

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

  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

# vi: ts=2 sw=2 et:

