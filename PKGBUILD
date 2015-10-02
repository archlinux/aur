# Maintainer: S. Leduc <sebastien@sleduc.fr>
# Contributor: Amr Hassan <amr.hassan@gmail.com>
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>
# Contributor: G. Richard Bellamy <rbellamy@pteradigm.com>

pkgname=flexget
_pkgname=FlexGet
pkgver=1.2.357
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
         # undocumented in FlexGet.egg-info/requires.txt
         )
optdepends=('python2-guppy: for memusage plugin' #AUR#
            'python2-transmissionrpc: Transmission support' #AUR#
            'python2-cherrypy: web interface'
            'python2-flask: web interface'
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

sha256sums=('3eb79be11409cae8f0e067e6496ab6d1c8b9a3b06cc6933cd48a68e10d8aea94'
            'e2c3a958ed0c286337cd37fba1d6cbdf4306c57fcddf2b9cc43615ce80ae83aa'
            'dcc1bc676b8c2b798fa9a7e0ed2b6853323e9e9d8ff696696dddeaf29cbc13d6'
            '7d65e71ea411f12fd6fb7ed4aa859ab21c83882d68abc78c8a0e8dbd4a96b7b4')

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
