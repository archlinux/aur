# Maintainer: S. Leduc <sebastien@sleduc.fr>
# Contributor: Amr Hassan <amr.hassan@gmail.com>
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>
# Contributor: G. Richard Bellamy <rbellamy@pteradigm.com>

pkgname=flexget
_pkgname=FlexGet
pkgver=1.2.359
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
         'python2-guessit<0.10.4'
         'python2-html5lib'
         'python2-pyrss2gen' #AUR#
         'python2-progressbar'
         'python2-rpyc' #AUR#
         'python2-jinja'
         'python2-path' #AUR#
         'python2-requests'
         'python2-dateutil'
         'python2-jsonschema'
         'python2-tvrage' #AUR#
         'python2-tmdb3' #AUR#
         'python2-pynzb' #AUR#
         'python2-apscheduler' #AUR#
         'python2-flask'
         'python2-flask-restful' #AUR#
         'python2-ordereddict'
         'python2-flask-restplus072'
         'python2-cherrypy>=3.7.0'
         'python2-flask-assets>=0.11' #AUR#
         'python2-cssmin' #AUR#
         'python2-flask-compress'
         'python2-flask-login>=0.3.2'
         'python2-libsass>=0.8.3'
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
        "fix_beautifulsoup_4_4_0.patch"
        )

changelog=ChangeLog

sha256sums=('6b7aebbf5d8311df91955585d29423a1118dd43ccbc58b2e43930605d09414f0'
            'e2c3a958ed0c286337cd37fba1d6cbdf4306c57fcddf2b9cc43615ce80ae83aa'
            'dcc1bc676b8c2b798fa9a7e0ed2b6853323e9e9d8ff696696dddeaf29cbc13d6'
            'daf5c63bbad7be570a9280e855527ba3a225790592e3026784216ea1b3ed92db')

prepare() {
  cd "${_pkgname}"-"${pkgver}"

  msg "Patching shebangs to point to python2"
  sed -i 's/\(python\)/\12/' flexget{,/ui}/__init__.py

  patch < "${srcdir}"/fix_beautifulsoup_4_4_0.patch
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
