# Maintainer: Giorgi Taba K'obakhidze <t@gtk.ge>

pkgname=messlidger
_name=$pkgname
pkgver='0.0.0.dev0+20240217.gitbd44a23568'
pkgrel=1
pkgdesc='A feature-rich Facebook Messenger to XMPP puppeteering gateway, based on slidge and mautrix-facebook.'
arch=('any')
url="https://git.sr.ht/~nicoco/messlidger"
license=('AGPL3')
depends=('python' 'python-slidge')
makedepends=('python-wheel' 'python-installer')
backup=('etc/slidge/messlidger.conf')
source=("https://slidge.im/repo/$_name/${_name//-/_}-$pkgver.tar.gz"
        'messlidger.tmpfile.d'
        'messlidger.sysuser.conf'
        'messlidger.service'
        'messlidger.conf')
sha256sums=('d1181e98355c22a50b84a5f98de40a3842322059fe79c5626d3447dd353abe74'
            'e2216061d8a45bd6d194730eaab94fa7a98948bbd5ce7834c7c33dc281db85e7'
            '5f411731658c6f05448dd61123d5831389ebcc2107d5277458f68ac7d40ee0da'
            '4d7d6e6fe6a37680cdb68bdf481c9b803c7c93bebf84bd5ed6056af8625a8b40'
            '0e595a80a4301ef94509540477148e7d7a1ce5b9cce80a1f1c1399cd098c277e')

build() {
  cd "$srcdir/${_name//-/_}-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"
  install -Dm 644 -t "$pkgdir"/usr/lib/systemd/system/ messlidger.service
  install -Dm 644 messlidger.sysuser.conf "${pkgdir}"/usr/lib/sysusers.d/messlidger.conf
  install -Dm 644 messlidger.tmpfile.d "${pkgdir}"/usr/lib/tmpfiles.d/messlidger.conf
  install -m 755 -d "$pkgdir/etc/slidge/"
  install -m 640 -t "$pkgdir/etc/slidge/" messlidger.conf

  cd -- "${_name//-/_}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
