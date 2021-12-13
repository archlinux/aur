# Maintainer :  Kr1ss  $(tr +- .@ <<<'<kr1ss+x-yandex+com>')
# Contributor : Olivier Le Moal <mail at olivierlemoal dot fr>
# Contributor : Dawid Wrobel <cromo@klej.net>
# Contributor : Sébastien Duquette <ekse.0x@gmail.com>
# Contributor : onny <onny@project-insanity.org>


pkgname=wfuzz-git
_name="${pkgname%-git}"

pkgver() { git -C "$_name" describe --long --tags | sed 's/v[^0-9]*//;s/-/.r/;s/-g/./'; }
pkgver=3.1.0.r2.1b695ee
pkgrel=3

pkgdesc='Web application fuzzer - python3 build of the dev branch'
url="https://github.com/xmendez/$_name"
license=('GPL')
arch=('any')

makedepends=('python-mock' 'python-netaddr' 'python-sphinx' 'texinfo' 'git')
depends=('python' 'python-pycurl' 'python-attrs' 'python-iniconfig' 'python-future' 'python-chardet'
         'python-more-itertools' 'python-pluggy' 'python-py' 'python-toml')

provides=("$_name")
conflicts=("$_name")

source=("git+$url.git")
sha256sums=('SKIP')


build() {
  cd "$_name"
  python setup.py build
  cd docs
  make SPHINXOPTS='-Q -j auto' man info html
}

package() {
  cd "$_name"
  PYTHONHASHSEED=0 python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
  install -dm755                    "$pkgdir/usr/share/$_name"
  cp -a --no-preserve=o wordlist    "$pkgdir/usr/share/$_name/wordlists"
  install -Dm644 *_bash_completion  "$pkgdir/usr/share/bash-completion/completions/$_name"
  install -Dm644 README.md        -t"$pkgdir/usr/share/doc/$_name/"
  cd docs/_build
  install -Dm644 man/*.1          -t"$pkgdir/usr/share/man/man1/"
  install -Dm644 texinfo/Wfuzz.info "$pkgdir/usr/share/info/$_name.info"
  cp -a --no-preserve=o html        "$pkgdir/usr/share/doc/$_name/"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
