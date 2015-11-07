_pkgname=frida
pkgname=python2-$_pkgname
pkgver=5.0.10
pkgrel=1
pkgdesc="Inject JavaScript to explore native apps on Windows, Mac, Linux, iOS and Android. Python 2 version from PyPi"
arch=('any')
url="http://www.frida.re"
license=('wxWindows Library License, Version 3.1')
depends=('python2' 'python2-pygments>=2.0.2' 'python2-prompt_toolkit>=0.38' 'python2-colorama>=0.2.7')
source=("https://pypi.python.org/packages/source/f/frida/frida-${pkgver}.zip")
md5sums=('d33c5cc14a4dd624ec0a7fa4dedba8ee')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  # those names have been changed in prompt_toolkit 0.54
  if [[ $(pacman -Qi --color=never python2-prompt_toolkit | sed -n 2p | cut -d ":" -f2 | tr -d '[[:space:]]' | xargs -I ver vercmp ver 0.54) -ge 0 ]]; then
    sed -i 's/create_default_application/create_prompt_application/g' frida/repl.py
    sed -i 's/create_default_output/create_output/g' frida/repl.py
  fi

  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root=$pkgdir --optimize=1 --skip-build
}
