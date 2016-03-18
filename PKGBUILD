# Maintainer: S. Leduc <sebastien@sleduc.fr>
# Contributor: Amr Hassan <amr.hassan@gmail.com>
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>
# Contributor: G. Richard Bellamy <rbellamy@pteradigm.com>

pkgname=flexget
_pkgname=FlexGet
pkgver=1.2.491
pkgrel=1

pkgdesc="Automate downloading or processing content (torrents, podcasts, etc.) from different sources like RSS-feeds, html-pages, various sites and more."

arch=('any')
url="http://flexget.com/"
license=('MIT')

depends=('python2'
         # documented in FlexGet.egg-info/requires.txt
         'python2-feedparser'
         'python2-sqlalchemy'
         'python2-yaml'
         'python2-beautifulsoup4'
         'python2-html5lib'
         'python2-pyrss2gen' #AUR#
         'python2-pynzb' #AUR#
         'python2-progressbar'
         'python2-rpyc' #AUR#
         'python2-jinja'
         'python2-requests'
         'python2-dateutil'
         'python2-jsonschema'
#         'python2-tmdb3' #AUR#
         'python2-path' #AUR#
         'python2-guessit>=2.0.3'
         'python2-apscheduler' #AUR#
         'python2-pytvmaze>=1.4.5' #AUR#
         'python2-ordereddict'
         'python2-cherrypy>=3.7.0'
         'python2-flask'
         'python2-flask-restful' #AUR#
         'python2-flask-restplus=0.8.6' #AUR#
         'python2-flask-compress'
         'python2-flask-login>=0.3.2'
         'python2-flask-cors>=2.1.2'
         'python2-pyparsing>=2.0.3'
         'python2-safe'
         )
optdepends=('python2-guppy: for memusage plugin' #AUR#
            'python2-transmissionrpc: Transmission support' #AUR#
            'python2-rarfile: decompress plugin' #AUR#
            )
makedepends=('python2-paver'
             'python2-setuptools'
             )

source=("https://pypi.python.org/packages/source/F/FlexGet/${_pkgname}-${pkgver}.tar.gz"
        'flexget.service'
        "http://download.flexget.com/ChangeLog"
        )

changelog=ChangeLog

sha256sums=('16fb4d7b3c0cb58c0dd13c62d1b4d0314a4eb3cd1491e7a8b199977b98bf494c'
            'e2c3a958ed0c286337cd37fba1d6cbdf4306c57fcddf2b9cc43615ce80ae83aa'
            'dcc1bc676b8c2b798fa9a7e0ed2b6853323e9e9d8ff696696dddeaf29cbc13d6')

prepare() {
  cd "${_pkgname}"-"${pkgver}"

  msg "Patching shebangs to point to python2"
  sed -i 's/\(python\)/\12/' flexget{,/ui}/__init__.py

}

package() {
  cd "${_pkgname}"-"${pkgver}"

  # Python setup
  python2 setup.py install --root="${pkgdir}"/ --prefix=/usr --optimize=1

  # License
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE

  # install systemd user unit
  install -Dm644 ../flexget.service "${pkgdir}"/usr/lib/systemd/user/flexget.service
}

# vim:set ts=2 sw=2 et:
