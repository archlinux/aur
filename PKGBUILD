# Maintainer: rnestler
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Alexandre Petitjean <alpetitjean at gmail dot com>

_pkgname=mopidy
pkgname=mopidy4
pkgver=4.0.0a2
pkgrel=2
pkgdesc="An extensible music server written in Python"
arch=('any')
url="https://www.mopidy.com"
license=('Apache-2.0')
depends=('python' 'python-pykka' 'python-requests' 'gstreamer' 'python-setuptools'
         'gst-python' 'gst-plugins-good' 'gst-plugins-ugly' 'python-tornado'
         'gst-plugins-base' 'python-dbus')
checkdepends=('python-gobject' 'python-pytest' 'python-responses' 'python-pytest-mock')
makedepends=('python-sphinx' 'python-sphinx_rtd_theme' 'git' 'python-build'
             'python-installer' 'python-wheel' 'python-setuptools-scm'
             'python-sphinx-autodoc-typehints')
backup=('etc/mopidy/mopidy.conf')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/mopidy/mopidy/archive/v${pkgver}.tar.gz"
        'mopidy.conf'
        'logging.conf'
        'mopidy.sysusers'
        )
sha512sums=('d5a987ec8c1517749c79619e7cfb50c8d5c5ddff471a1dc31b2c0e64c6b180906b068b17dd0c33e11b48ab658f1c5b66072159dd57fc3bfe315c6d7fc2ff7c53'
            'eb66e8e826640a939b1ba51569ab7fab041b8b5e8823ea2d5f05596faf1de8882fd8c1c32bdb92534e759243fb5ff741bda0d2ebb3282af542d1287c8c68b5ea'
            '0c438058500ab7559baae21b03b10e2b80b10c77776b240b2100da1f4c84ea8efe24dc7a38a95034e75605eaf5d21604d13e5b8c7358778c555ddb6372a49388'
            'ff6c9f0406dfc1cc01ac6edcc6bae429342437397321ab9205ca273a63b28611d08005a0a5dba639b5ae2157a4f03a1d58c2199f7dbc6965864685b4b71f0b6f')
provides=('mopidy')
conflicts=('mopidy')

build() {
  cd ${_pkgname}-${pkgver}
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation

  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  make -C docs SPHINXBUILD="$PWD/test-env/bin/python /usr/bin/sphinx-build" html man
}

check() {
  cd ${_pkgname}-${pkgver}
  test-env/bin/python -m unittest discover -vs .
}

package() {
  cd ${_pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm755 extra/mopidyctl/mopidyctl "${pkgdir}/usr/bin/mopidyctl"

  install -dm755 "${pkgdir}/usr/share/doc/mopidy"
  cp -r docs/_build/html "${pkgdir}/usr/share/doc/mopidy"

  install -dm755 "${pkgdir}/usr/share/man/man1/"
  gzip -n -c docs/_build/man/mopidy.1 > "${pkgdir}/usr/share/man/man1/mopidy.1.gz"

  install -dm755 "${pkgdir}/usr/share/man/man8/"
  gzip -n -c extra/mopidyctl/mopidyctl.8 > "${pkgdir}/usr/share/man/man8/mopidyctl.8.gz"

  install -Dm644 "${srcdir}/mopidy.conf" "${pkgdir}/etc/mopidy/mopidy.conf"
  install -Dm644 "${srcdir}/logging.conf" "${pkgdir}/etc/mopidy/logging.conf"

  install -Dm644 "extra/systemd/mopidy.service" "${pkgdir}/usr/lib/systemd/system/mopidy.service"
  install -Dm644 "extra/desktop/mopidy.desktop" "${pkgdir}/usr/share/applications/mopidy.desktop"

  install -dm755 -g 46 -o 46 "${pkgdir}/var/cache/mopidy"
  install -dm755 -g 46 -o 46 "${pkgdir}/var/log/mopidy"
  install -dm755 -g 46 -o 46 "${pkgdir}/var/lib/mopidy"
  install -dm755 -g 46 -o 46 "${pkgdir}/var/lib/mopidy/local"
  install -dm755 -g 46 -o 46 "${pkgdir}/var/lib/mopidy/media"
  install -dm755 -g 46 -o 46 "${pkgdir}/var/lib/mopidy/playlists"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 "${srcdir}/mopidy.sysusers" "${pkgdir}/usr/lib/sysusers.d/$_pkgname.conf"
}

# vim:set ts=2 sw=2 et:
