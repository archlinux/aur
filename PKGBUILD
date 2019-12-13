# Maintainer: S. Leduc <sebastien@sleduc.fr>
# Contributor: redfish <redfish@galactica.pw>
# Contributor: Amr Hassan <amr.hassan@gmail.com>
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>
# Contributor: G. Richard Bellamy <rbellamy@pteradigm.com>

pkgname=flexget
_pkgname=Flexget
pkgver=3.0.16
pkgrel=1

pkgdesc="Automate downloading or processing content (torrents, podcasts, etc.) from different sources like RSS-feeds, html-pages, various sites and more."

arch=('any')
url="http://flexget.com/"
license=('MIT')

depends=('python'
         # documented in requirements.in
         'python-feedparser>=5.2.1'
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
         'python-guessit>=3.1.0'
         'python-rebulk>=2.0.0'
         'python-apscheduler>=3.2.0'
         'python-terminaltables>=3.1.0'
         'python-colorclass>=2.2.0'
         'python-cherrypy>=18.0.0'
         'python-flask>=0.7'
         'python-flask-restful>=0.3.3'
         'python-flask-restplus>=0.10.1'
         'python-flask-compress>=1.2.1'
         'python-flask-login>=0.4.0'
         'python-flask-cors>=2.1.2'
         'python-pyparsing>=2.0.3'
         'python-zxcvbn'
         'python-progressbar>=2.5'
         )
optdepends=('python-guppy: for memusage plugin' #AUR#
            'python-transmissionrpc: Transmission support' #AUR#
            'python-rarfile: decompress plugin' #AUR#
            'python-boto3: SNS output plugin' #AUR#
            )
makedepends=('python-paver'
             'python-setuptools'
             )

source=("https://github.com/Flexget/Flexget/archive/v${pkgver}.tar.gz"
        'flexget.service'
        'flexget@.service'
        "http://download.flexget.com/ChangeLog"
        )

changelog=ChangeLog

prepare() {
  cd "${_pkgname}"-"${pkgver}"

  # Don't use the requirements.txt with pinned deps
  cp requirements.{in,txt}

  # Remove specific versions, because they are not going to match
  # versions of Arch packages. Yes, this might break something.
  sed -i 's/==.*//g' requirements.txt
  sed -i 's/<=.*//g' requirements.txt
  sed -i 's/~=.*//g' requirements.txt

  ## zxcvbn-python has been renamed zxcvbn
  sed -i 's/zxcvbn-python/zxcvbn/' requirements.txt

  # Python distribution of progressbar v3.x.x is named progressbar2
  sed -i 's/progressbar/progressbar2/' requirements.txt
}

package() {
  cd "${_pkgname}"-"${pkgver}"

  # Cleanup a previous builds if any, since setuptools doesn't do it
  rm -rf build

  # Python setup
  python setup.py install --root="${pkgdir}"/ --prefix=/usr --optimize=1

  # License
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE

  # install systemd user unit
  install -Dm644 ../flexget.service "${pkgdir}"/usr/lib/systemd/user/flexget.service
}

sha256sums=('23fba92cd18f3c43b1e43ae87f4066708c6da5948a957666a028577d39222354'
            'e2c3a958ed0c286337cd37fba1d6cbdf4306c57fcddf2b9cc43615ce80ae83aa'
            'aceecee5496a34c14c12ed5ad8b97197de32896f358b5aef63a84bf4a419756a'
            'dcc1bc676b8c2b798fa9a7e0ed2b6853323e9e9d8ff696696dddeaf29cbc13d6')
# vim:set ts=2 sw=2 et:
