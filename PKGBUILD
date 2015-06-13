# Maintainer: shmilee <echo c2htaWxlZS56anVAZ21haWwuY29tCg==|base64 -d>

#remove google-analytics ...
_rm_ga=yes

_pkgname=nbviewer
pkgname=python-nbviewer-git
pkgver=r863.8ea799f
pkgrel=1
pkgdesc="A webservice rendering ipynb to static HTML, the web application behind nbviewer.ipython.org"
arch=('any')
url="https://github.com/jupyter/nbviewer"
license=('BSD')
depends=('ipython>=3.0.0' 'python-tornado>=3.1.1' 'python-pycurl' 'python-markdown' 'python-elasticsearch' 'python-sphinx>=0.3' 'python-jsonschema' 'python-mistune')
# 'python-pygments' 'python-jinja' 'python2-futures'
makedepends=('invoke' 'nodejs-less' 'nodejs-bower' 'python<3.5')
optdepends=('python-pylibmc: improvement with memcache'
            'python-newrelic: New Relic performance monitoring'
            'mathjax: display mathematics' )
options=(!emptydirs)
install=
source=("git+https://github.com/jupyter/${_pkgname}.git" "${_pkgname}.service")
md5sums=('SKIP'
         '4d11e0118c436aabc2536c2b39a78d35')

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${_pkgname}"

  sed -i 's|^NPM_BIN.*$|NPM_BIN = "/usr/bin"|' tasks.py
  invoke bower

  cp -r /usr/lib/node_modules/less/ less
  cd less/
  npm install less-plugin-autoprefix less-plugin-clean-css --save-dev
  cd ..
  sed -i 's|^NPM_BIN.*$|NPM_BIN = os.path.join(APP_ROOT, "less", "bin")|' tasks.py
  invoke less
}

package() {
  cd "$srcdir/${_pkgname}"
  python setup.py install --root="$pkgdir/" --optimize=1
  cd "$srcdir/"
  # systemd
  install -Dm 644 ${_pkgname}.service \
    "$pkgdir/usr/lib/systemd/system/${_pkgname}.service"
  # mathjax & path with python<3.5
  cd "$pkgdir"/usr/lib/python3.4/site-packages/nbviewer/
  ln -s /usr/share/mathjax static/mathjax
  msg2 "replace cdn.mathjax."
  sed -i 's|https://cdn.mathjax.org/mathjax/latest|/static/mathjax|' templates/notebook.html

  if [[ $_rm_ga == yes ]]; then
    msg2 "remove google-analytics ..."
    if grep -A10 -B10 -n UA-38683231-2 templates/layout.html; then
      _line=$(grep UA-38683231-2 templates/layout.html -n|awk -F: '{print $1}')
      _ln1=$(expr $_line - 5)
      _ln2=$(expr $_line + 2)
      msg2 "from line $_ln1 to $_ln2. Check this."
      sed -i "${_ln1},${_ln2}d" templates/layout.html
    else
      msg2 "Not found the script for google-analytics."
    fi
  fi
}

# vim:set ts=2 sw=2 et:
