# Maintainer: Max Chesterfield <`echo Y2hlc3RtMDA3QGhvdG1haWwuY29tCg== | base64 -d`>
# Contributor: Cedric Girard <girard.cedric@gmail.com>
# Contributor: G. Richard Bellamy <rbellamy@pteradigm.com>
# Contributor: Andrea Repetto <andrea.repetto85@gmail.com>
# Contributor: Bogdan Szczurek <thebodzio@gmail.com>
# Contributor: redfish <redfish@galactica.pw>

pkgname=flexget-git
_pkgname=Flexget
pkgver=3.1.111
pkgrel=1

pkgdesc="Automate downloading or processing content (torrents, podcasts, etc.) from different sources like RSS-feeds, html-pages, various sites and more."

arch=('any')
url="http://flexget.com/"
license=('MIT')

depends=('python'
         # documented in requirements.in
         'python-feedparser-dev>=6.0.2-3'
         'python-sqlalchemy>=1.3.10'
         'python-yaml>=4.2b1'
         'python-beautifulsoup4>=4.5'
         'python-html5lib>=0.11'
         'python-pyrss2gen'
         'python-pynzb'
         'python-rpyc>=4.0'
         'python-jinja>=2.10'
         'python-requests>=2.20.0'
         'python-dateutil>=2.5.3'
         'python-jsonschema>=2.0'
         'python-guessit>=3.2.0'
         'python-rebulk>=2.0.0'
         'python-apscheduler>=3.2.0'
         'python-terminaltables>=3.1.0'
         'python-colorclass>=2.2.0'
         'python-cherrypy>=18.0.0'
         'python-flask>=0.7'
         'python-flask-restful>=0.3.3'
         'python-flask-restx>=0.2.0'
         'python-flask-compress>=1.2.1'
         'python-flask-login>=0.4.0'
         'python-flask-cors>=2.1.2'
         'python-pyparsing>=2.4.7'
         'python-zxcvbn'
         'python-progressbar>=2.5'
         'python-loguru>=0.4.1'
         )
optdepends=('python-guppy: for memusage plugin' #AUR#
            'python-transmissionrpc: Transmission support' #AUR#
            'python-rarfile: decompress plugin' #AUR#
            'python-boto3: SNS output plugin' #AUR#
            )
makedepends=('python-paver'
             'python-setuptools'
             )
             #'yarn'
             #'bower'
             #'gulp'

#checkdepends=('python-vcr')

provides=('flexget')
conflicts=('flexget')

source=("git+https://github.com/Flexget/Flexget/"
        'flexget.service'
        'flexget@.service'
        )

sha256sums=('SKIP'
            'e2c3a958ed0c286337cd37fba1d6cbdf4306c57fcddf2b9cc43615ce80ae83aa'
            'aceecee5496a34c14c12ed5ad8b97197de32896f358b5aef63a84bf4a419756a')

pkgver() {
  cd Flexget
  printf "%s.r%s.%s" "$(grep __version__ flexget/_version.py | sed -r "s/.*([0-9].*\.[0-9].*\.[0-9].*)\.dev.*/\1/g")" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgname}"

  #pip-compile --output-file requirements.txt requirements.in
  #pip-compile give too stricts requirements...
  cp requirements.in requirements.txt

  # Remove specific versions, because they are not going to match
  # versions of Arch packages. Yes, this might break something.
  sed -i 's/==.*//g' requirements.txt
  sed -i 's/<=.*//g' requirements.txt
  sed -i 's/~=.*//g' requirements.txt

  # Relax loguru requirement (AUR out-of-date right now)
  sed -i 's/loguru>=0.4.1/loguru>=0.4/g' requirements.txt

  #zxcvbn-python has been renamed zxcvbn
  sed -i 's!zxcvbn-python!zxcvbn!' requirements.txt

  # Python distribution of progressbar v3.x.x is named progressbar2
  sed -i 's/progressbar/progressbar2/' requirements.txt
}

build() {
  cd "${_pkgname}"
  python dev_tools.py bundle-webui
}

# currently broken somewhere in the bower task
#build() {
#  cd "${_pkgname}"/flexget/ui/v1
#  yarn
#  XDG_CONFIG_HOME="${_srcdir}" bower --config.analytics=false install
#  XDG_CONFIG_HOME="${_srcdir}" gulp
#
#}

package() {
  cd "${_pkgname}"

  # Cleanup a previous builds if any, since setuptools doesn't do it
  rm -rf build

  # Python setup
  python setup.py install --root="${pkgdir}"/ --prefix=/usr --optimize=1 || return 1

  # License
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE

  # install systemd user unit
  install -Dm644 ../flexget.service "${pkgdir}"/usr/lib/systemd/user/flexget.service
  # install systemd system unit
  install -Dm644 ../flexget@.service "${pkgdir}"/usr/lib/systemd/system/flexget@.service
}

# vim:set ts=2 sw=2 et:
