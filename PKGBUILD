# Maintainer: Danny Waser <danny@waser.tech>
# Contributor:  Thore Bödecker <foxxx0@archlinux.org>
# Contributor: Laurent Soest <laurent.soest@gmail.com>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: Armando M. Baratti <amblistas@ajato.com.br>
# Contributor: Florian Richter <Florian_Richter@gmx.de>

pkgname='python38-cherrypy'
_pkgname="${pkgname#python38-}"
pkgver=18.8.0
pkgrel=1
pkgdesc='A pythonic, object-oriented web development framework'
arch=('any')
url='https://cherrypy.org'
license=('BSD')
depends=('python' 'python38-cheroot' 'python38-portend' 'python38-jaraco.collections'
'python38-more-itertools' 'python38-zc.lockfile')
makedepends=('python38-build' 'python38-installer' 'python38-setuptools' 'python38-setuptools-scm' 'python38-wheel')
checkdepends=('python38-objgraph' 'python38-path' 'python38-pytest'
'python38-pytest-forked' 'python38-pytest-services' 'python38-pytest-sugar'
'python38-requests-toolbelt')
optdepends=(
  'python38-flup: for xcgi support'
  'python38-memcached: for memcached session support'
  'python38-pyopenssl: for TLS support'
  'python38-routes: for routes_dispatcher support'
  'python38-simplejson: for JSON support'
)
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/${_pkgname}/${_pkgname}/archive/v$pkgver.tar.gz"
  'disable-sessiontest-file_concurrency.patch'
  'disable-broken-testCombinedTools.patch' # https://github.com/cherrypy/cherrypy/issues/1849
  'disable-broken-ServerStateTests.test_2_KeyboardInterrupt.patch' # https://github.com/cherrypy/cherrypy/issues/1873
)
sha512sums=('54e815d91bacc9710cc2962be2640d7e74b872fb69ab235b217481425fa6fa854d4997ec67ca6e4d3f8f70a995b93c532b909a3feffbfdb149f850a4fa047fad'
            'e8abb7e3f8a064a0da529fcaf393dff305541bc273b539f3129b119d506be3be8cd67894dd4223e067b4dd8b55df8adc5d4feddb8d87188c9e528670c39e252f'
            '8160f7a0e43042c233af22712641724bbaff63d603b31eb3f058c810d2b8f1ca0f5a4666464e4492457bb665ebe0eb5da55bc7e8158e36968f5ccb08ad641733'
            '60ba651c113ecf32e865a40b9361dbe176200274f2b3f40f6d17cbea3d4a868dc2eaf6088906230417c423969ce9692c10ae1f2e0f045571e5c443b53d4e07ca')

prepare() {
  cd ${_pkgname}-${pkgver}
  # apply patch from the source array (should be a pacman feature)
  local filename
  for filename in "${source[@]}"; do
    if [[ "$filename" =~ \.patch$ ]]; then
      echo "Applying patch ${filename##*/}"
      patch -p1 -N -i "$srcdir/${filename##*/}"
    fi
  done
  # we are not interested in coverage tests
  sed -e '/cov/d' -i pytest.ini
}

build() {
  # setuptools wont find version from git tag
  export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"

  cd ${_pkgname}-${pkgver}
  python3.8 -m build --wheel --no-isolation
}

check() {
  cd ${_pkgname}-${pkgver}
  # disable tests that fail due to escalated DeprecationWarnings due to calls to StringIO.readfp()
  # TODO: report upstream!
  pytest -vv \
    -k "not testConfig \
        and not testCustomNamespaces \
        and not testHandlerToolConfigOverride \
        and not testHandlerToolConfigOverride \
        and not testRespNamespaces \
        and not testUnrepr \
        and not test_request_body_namespace \
        and not test_gc \
        and not test_config \
        and not test_call_with_kwargs \
        and not test_call_with_literal_dict"
}

package() {
  cd ${_pkgname}-${pkgver}
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
