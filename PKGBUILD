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

source=("git+$url.git#branch=dev")
sha256sums=('SKIP')

build() {
  cd "${pkgname/-git}/docs"
  python conf.py
  make man html
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
  PATH=/usr/bin/ find "$pkgdir/usr/lib/python3.7/site-packages/${pkgname/-git}" \
          -name *.pyc -execdir rm '{}' +
}

# vi: ts=2 sw=2 et:

