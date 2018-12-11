# Maintainer: Max Chesterfield <`echo Y2hlc3RtMDA3QGhvdG1haWwuY29tCg== | base64 -d`>
# Contributor: Cedric Girard <girard.cedric@gmail.com>
# Contributor: G. Richard Bellamy <rbellamy@pteradigm.com>
# Contributor: Andrea Repetto <andrea.repetto85@gmail.com>
# Contributor: Bogdan Szczurek <thebodzio@gmail.com>

pkgname=flexget-git
_pkgname=Flexget
pkgver=2.17.19.r13351.ff6c7a54d
pkgrel=1

pkgdesc="Automate downloading or processing content (torrents, podcasts, etc.) from different sources like RSS-feeds, html-pages, various sites and more."

arch=('any')
url="http://flexget.com/"
license=('MIT')

depends=('python'
         # documented in requirements.in
         'python-feedparser>=5.2.1'
         'python-sqlalchemy>=1.0.9'
         'python-sqlalchemy<1.999'
         'python-yaml'
         'python-beautifulsoup4>=4.5'
         'python-html5lib>=0.11'
         'python-pyrss2gen'
         'python-pynzb'
         'python-rpyc>=4.0'
         'python-jinja'
         'python-requests>=2.16.3'
         'python-dateutil>=2.5.3'
         'python-jsonschema>=2.0'
         'python-path>=8.1.1'
         'python-pathlib>=1.0'
         'python-guessit=3.0.3'
         'python-rebulk=0.9.0'
         'python-apscheduler>=3.2.0'
         'python-terminaltables>=3.1.0'
         'python-colorclass>=2.2.0'
         'python-cherrypy>=3.7.0'
         'python-flask>=0.7'
         'python-flask-restful>=0.3.3'
         'python-flask-restplus=0.11.0'
         'python-flask-compress>=1.2.1'
         'python-flask-login>=0.4.0'
         'python-flask-cors>=2.1.2'
         'python-pyparsing>=2.0.3'
         'python-zxcvbn'
         'python-future>=0.15.2'
         )
optdepends=('python-guppy: for memusage plugin' #AUR#
            'python-transmissionrpc: Transmission support' #AUR#
            'python-rarfile: decompress plugin' #AUR#
            'python-boto3: SNS output plugin' #AUR#
            )
makedepends=('python-paver'
             'python-setuptools'
             'yarn'
             'bower'
             'gulp'
             )

#checkdepends=('python-vcr')

provides=('flexget')
conflicts=('flexget')

source=('git+https://github.com/Flexget/Flexget'
        'flexget.service'
        'flexget@.service'
        'https://patch-diff.githubusercontent.com/raw/Flexget/Flexget/pull/2225.diff'
        'https://patch-diff.githubusercontent.com/raw/Flexget/Flexget/pull/2268.diff'
        )

sha256sums=('SKIP'
            'e2c3a958ed0c286337cd37fba1d6cbdf4306c57fcddf2b9cc43615ce80ae83aa'
            '5fca3a1b6be282c0914754bbfdeef21005d936fba3d2698801bba18369e1321a'
            '5a22b446a33fda2174c7540c983f328797e37bd2e0ddff8342ea682dd4adce79'
            'ab7378a209b815b493bc85728279d0e344db864ba394409be6d62b768f279951')

pkgver() {
  cd Flexget
  printf "%s.r%s.%s" "$(grep __version__ flexget/_version.py | sed -r "s/.*([0-9].*\.[0-9].*\.[0-9].*)\.dev.*/\1/g")" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgname}"
  sed -i 's!rpyc==4.0.1!rpyc==3.3.0!' requirements.txt
  sed -i 's!pyyaml==3.13!pyyaml==3.12!' requirements.txt
  sed -i 's!requests==2.20.1!requests==2.16.5!' requirements.txt

  patch -p1 < ../2225.diff
  patch -p1 < ../2268.diff
  #pip-compile --output-file requirements.txt requirements.in
  #pip-compile give too stricts requirements...
  cp requirements.in requirements.txt
  #flexget works fine with newer versions of requests
  sed -i 's!flask-restplus==0.10.1!flask-restplus==0.11.0!' requirements.txt
  sed -i 's!rpyc==3.3.0!rpyc>=4.0.2!' requirements.txt
  #zxcvbn-python has been renamed zxcvbn
  sed -i 's!zxcvbn-python!zxcvbn!' requirements.txt
}

build() {
  cd "${_pkgname}"/flexget/ui/v1
  yarn
  XDG_CONFIG_HOME="${_srcdir}" bower --config.analytics=false install
  XDG_CONFIG_HOME="${_srcdir}" gulp

}

#check() {
#  cd "${_pkgname}"
#
#  python2 setup.py test
#}

package() {
  cd "${_pkgname}"

  # Python setup
  python setup.py install --root="${pkgdir}"/ --prefix=/usr --optimize=1 || return 1

  # License
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE

  # Make sure the perms allow reading by all
  chmod ugo+r ${pkgdir}/usr/lib/python3.7/site-packages/FlexGet-*.*.*.dev0-py3.*.egg-info/*

  # install systemd user unit
  install -Dm644 ../flexget.service "${pkgdir}"/usr/lib/systemd/user/flexget.service
  # install systemd system unit
  install -Dm644 ../flexget@.service "${pkgdir}"/usr/lib/systemd/system/flexget@.service
}

# vim:set ts=2 sw=2 et:
