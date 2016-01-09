_pkgname=frida
pkgname=python-$_pkgname
pkgver=6.0.12
pkgrel=1
pkgdesc="Inject JavaScript to explore native apps on Windows, Mac, Linux, iOS and Android. Python 3 version from PyPi"
arch=('any')
url="http://www.frida.re"
license=('wxWindows Library License, Version 3.1')
depends=('python' 'python-pygments>=2.0.2' 'python-prompt_toolkit>=0.38' 'python-colorama>=0.2.7')
source=("https://pypi.python.org/packages/source/f/frida/frida-${pkgver}.zip")
sha512sums=('7b1a0ad7862099bab5206828dae5c40ac7ef246ac468b5f9a0df29fb8cd49652966af3a1190739c751e6e2bc2df1b9d1ba49599eb6771e78d4c776bef7aee8cf')
conflicts=("python2-${_pkgname}")

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  # those names have been changed in prompt_toolkit 0.54
  if [[ $(pacman -Qi --color=never python-prompt_toolkit | sed -n 2p | cut -d ":" -f2 | tr -d '[[:space:]]' | xargs -I ver vercmp ver 0.54) -ge 0 ]]; then
    sed -i 's/create_default_application/create_prompt_application/g' frida/repl.py
    sed -i 's/create_default_output/create_output/g' frida/repl.py
  fi

  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
