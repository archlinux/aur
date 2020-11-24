# Maintainer :  Kr1ss  $(tr +- .@ <<<'<kr1ss+x-yandex+com>')
# Contributor : Olivier Le Moal <mail at olivierlemoal dot fr>
# Contributor : Dawid Wrobel <cromo@klej.net>
# Contributor : Sébastien Duquette <ekse.0x@gmail.com>
# Contributor : onny <onny@project-insanity.org>


pkgname=wfuzz-git
_pkgname="${pkgname%-git}"

pkgver() { git -C "$_pkgname" describe --long --tags | sed 's/v[^0-9]*//;s/-/.r/;s/-g/./'; }
pkgver=3.1.0.r0.02a809d
pkgrel=1

pkgdesc='Web application fuzzer - python3 build of the dev branch'
url="https://github.com/xmendez/$_pkgname"
license=('GPL')
arch=('any')

makedepends=('python-mock' 'python-netaddr' 'python-sphinx' 'texinfo' 'git')
depends=('python-pycurl' 'python-attrs' 'python-iniconfig' 'python-future' 'python-chardet'
         'python-more-itertools' 'python-pluggy' 'python-py' 'python-toml')

provides=("$_pkgname")
conflicts=("$_pkgname")

source=("git+$url.git")
sha256sums=('SKIP')


build() {
  cd "$_pkgname"
  python setup.py build

  cd docs
  make SPHINXOPTS='-Q -j auto' man info html
}

package() {
  cd "$_pkgname"
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1

  install -dm755                    "$pkgdir/usr/share/$_pkgname"
  cp -a --no-preserve=o wordlist    "$pkgdir/usr/share/$_pkgname/wordlists"

  install -Dm644 *_bash_completion  "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
  install -Dm644 README.md        -t"$pkgdir/usr/share/doc/$_pkgname/"

  cd docs/_build
  install -Dm644 man/*.1          -t"$pkgdir/usr/share/man/man1/"
  install -Dm644 texinfo/Wfuzz.info "$pkgdir/usr/share/info/$_pkgname.info"
  cp -a --no-preserve=o html        "$pkgdir/usr/share/doc/$_pkgname/"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
