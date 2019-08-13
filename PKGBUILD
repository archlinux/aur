# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: Reventlov <contact+aur at volcanis dot me>

pkgname=searx-git
pkgver=0.15.0+r155+g8e62f760
pkgrel=1
pkgdesc='Privacy-respecting metasearch engine (git)'
arch=(any)
url=https://asciimoo.github.io/searx/
license=(AGPL3)
depends=(python2-certifi
         python2-babel
         python2-flask-babel
         python2-flask
         python2-idna
         python2-jinja
         python2-lxml
         python2-pygments
         python2-pyopenssl
         python2-dateutil
         python2-yaml
         python2-requests
         python2-pysocks)
makedepends=(git)
optdepends=('filtron: filter incoming HTTP requests'
            'morty: proxy server for search results')
provides=(searx)
conflicts=(searx)
backup=(etc/searx.conf)
source=(git+https://github.com/asciimoo/searx
        searx.service
        searx.sysusers.d
        searx.tmpfiles.d)
sha512sums=('SKIP'
            'cc58068e502b088c61016a5cd25db248f5fae146f18e00253f3aa0ccd666189ef3a407e00bf9181c23e643e68df7e4f9eec295bf680c982052978c2786325d0a'
            '39b765ade096778ad945725e0ca5c0919e4baff4e7a466e0d093e68d1a92c563a5437caed01e44accf04ac51450007e659435d32a84e818df213de3f9e546793'
            '65b0d25c8673756f145b0113fd49af36062d68c1dbd6009fbc658bf365579f672aadd6f6e7fd66f1e49215ffb9c1ecf58b26c2f7f85319eb011094b20f80ff85')

pkgver() {
  cd searx
  git describe --tags | sed 's#v##;s#-#+#g;s#+#+r#'
}

prepare() {
  cd searx
  # Allow newer libraries since we can't guarantee older library versions
  sed -i 's#==#>=#g' requirements.txt
}

package() {
  cd searx

  python2 setup.py install --root="$pkgdir" --optimize=1
  # Move incorrectly-placed searx files
  mv "$pkgdir"/usr/lib/python2.7/site-packages/{README.rst,requirements*,searx}

  install -Dm 600 searx/settings.yml "$pkgdir"/etc/searx.conf

  install -Dm 644 ../searx.service -t "$pkgdir"/usr/lib/systemd/system
  install -Dm 644 ../searx.sysusers.d "$pkgdir"/usr/lib/sysusers.d/searx.conf
  install -Dm 644 ../searx.tmpfiles.d "$pkgdir"/usr/lib/tmpfiles.d/searx.conf

  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/searx
}
