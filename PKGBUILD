# Maintainer: Cedric Girard <girard.cedric@gmail.com>
# Contributor: G. Richard Bellamy <rbellamy@pteradigm.com>
# Contributor: Andrea Repetto <andrea.repetto85@gmail.com>
# Contributor: Bogdan Szczurek <thebodzio@gmail.com>

pkgname=flexget-git
_pkgname=Flexget
pkgver=1.2.360.r6440.168d319
pkgrel=1

pkgdesc="Automate downloading or processing content (torrents, podcasts, etc.) from different sources like RSS-feeds, html-pages, various sites and more."

arch=('any')
url="http://flexget.com/"
license=('MIT')

depends=('python2'
         # documented in FlexGet.egg-info/requires.txt
         'python2-feedparser>=5.1.3'
         'python2-sqlalchemy>=0.7.5'
         'python2-sqlalchemy<=1.999'
         'python2-yaml'
         'python2-beautifulsoup4>=4.1'
         'python2-beautifulsoup4<4.4'
         'python2-guessit<0.10.4'
         'python2-html5lib>=0.11'
         'python2-pyrss2gen' #AUR#
         'python2-progressbar'
         'python2-rpyc' #AUR#
         'python2-jinja'
         'python2-path>=5.1' #AUR#
         'python2-requests>=1.0'
         'python2-requests<2.99'
         'python2-dateutil'
         'python2-jsonschema>=2.0' #AUR#
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

provides=('flexget')
conflicts=('flexget')

source=('git+https://github.com/Flexget/Flexget'
        'flexget.service'
        )

sha256sums=('SKIP'
            'e2c3a958ed0c286337cd37fba1d6cbdf4306c57fcddf2b9cc43615ce80ae83aa')

pkgver() {
  cd Flexget
  printf "%s.r%s.%s" "$(grep __version__ flexget/_version.py | sed -r "s/.*([0-9].*\.[0-9].*\.[0-9].*)\.dev.*/\1/g")" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgname}"

  msg "Patching shebangs to point to python2"
  sed -i 's/\(python\)/\12/' flexget{,/ui}/__init__.py
  python2 ./gen-changelog.py
}

package() {
  cd "${_pkgname}"

  # Python setup
  python2 setup.py install --root="${pkgdir}"/ --prefix=/usr --optimize=1 || return 1

  # License
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE

  # Make sure the perms allow reading by all
  chmod ugo+r ${pkgdir}/usr/lib/python2.7/site-packages/FlexGet-1.2.*.dev0-py2.7.egg-info/*

  # install systemd user unit
  install -Dm644 ../flexget.service "${pkgdir}"/usr/lib/systemd/user/flexget.service
}

# vim:set ts=2 sw=2 et:
