# Maintainer: rnestler
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Alexandre Petitjean <alpetitjean at gmail dot com>

_pkgname=mopidy
pkgname=mopidy4
pkgver=4.0.0
pkgrel=2
pkgdesc="An extensible music server written in Python"
arch=('any')
url="https://www.mopidy.com"
license=('Apache-2.0')
depends=('python' 'python-cyclopts>=4.3.0' 'python-httpx' 'python-platformdirs' 'python-pydantic' 'python-gobject' 'python-pykka' 'python-rich'         'python-tornado' 'gstreamer' 'gst-python' 'gst-plugins-good' 'gst-plugins-ugly'
         'gst-plugins-base' 'python-dbus')
checkdepends=('python-polyfactory' 'python-dirty-equals' 'python-pytest' 'python-pytest-httpx' 'python-pytest-mock')
makedepends=('python-sphinx' 'python-sphinx_rtd_theme' 'git' 'python-build'
             'python-installer' 'python-wheel' 'python-setuptools' 'python-setuptools-scm'
             'python-sphinx-autodoc-typehints')
backup=('etc/mopidy/mopidy.conf')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/mopidy/mopidy/archive/v${pkgver}.tar.gz"
        'mopidy.conf'
        'logging.conf'
        'mopidy.sysusers'
        )
sha512sums=('9fe097859603c8ad83030ac42dee14bc1adac293b69951de5364f4e13f90543eab2298a7673b88ca163ffbf591c23e85527dd24ea57c99b38ee6c2d0973368d2'
            'eb66e8e826640a939b1ba51569ab7fab041b8b5e8823ea2d5f05596faf1de8882fd8c1c32bdb92534e759243fb5ff741bda0d2ebb3282af542d1287c8c68b5ea'
            '0c438058500ab7559baae21b03b10e2b80b10c77776b240b2100da1f4c84ea8efe24dc7a38a95034e75605eaf5d21604d13e5b8c7358778c555ddb6372a49388'
            'ff6c9f0406dfc1cc01ac6edcc6bae429342437397321ab9205ca273a63b28611d08005a0a5dba639b5ae2157a4f03a1d58c2199f7dbc6965864685b4b71f0b6f')
provides=("mopidy=$pkgver")
conflicts=('mopidy')

build() {
  cd ${_pkgname}-${pkgver}
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation

  rm -rf test-env
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  # TODO: docs need to be built differently
  # make -C docs SPHINXBUILD="$PWD/test-env/bin/python /usr/bin/sphinx-build" html man
}

check() {
  # Fix for some tests
  export NO_COLOR=1
  cd ${_pkgname}-${pkgver}
  # TODO: Tests are currently broken
  # test-env/bin/python -m unittest discover -vs .
}

package() {
  cd ${_pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm755 extra/mopidyctl/mopidyctl "${pkgdir}/usr/bin/mopidyctl"

  # install -dm755 "${pkgdir}/usr/share/doc/mopidy"
  # cp -r docs/_build/html "${pkgdir}/usr/share/doc/mopidy"

  # install -dm755 "${pkgdir}/usr/share/man/man1/"
  # gzip -n -c docs/_build/man/mopidy.1 > "${pkgdir}/usr/share/man/man1/mopidy.1.gz"

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
